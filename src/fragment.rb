require_relative "db"
require_relative "zip"

# A classe Fragment representa um fragmento de código armazenado no banco.
class Fragment < Db

  attr_reader :id, :lang
  attr_accessor :source, :name

  @@fragMutex = Mutex.new

  # Inicia um novo fragmento
  # O fragmento é inserido no banco de dados
  def initialize name, source, id = nil
    @name = name
    @source = source
    @id = id
    detect
  end


  # Obtem um fragmento pelo id do objeto
  def self.get id
    @@fragMutex.synchronize {
       r = @@connection.query "
        SELECT * FROM Fragments WHERE id = #{id.to_i}
        LIMIT 1
       "
       f = nil
       r.each do |row|
         f = Fragment.new(Zip.dezip(row['name']), Zip.dezip(row['source']), row['id'])
       end
       return f
    }
  end


  # Esta função insere um novo fragmento com o source e name do fragmento
  def create
    # Necessita de sincronização para evitar problemas de concorrência
    @@fragMutex.synchronize {
      # Cria um novo objeto no banco
      @@connection.query "
        INSERT INTO Fragments (name, source) VALUES ('#{Zip.zip @name}','#{Zip.zip @source}')
      "
      # Obtem o último ID
      @id = @@connection.last_id
    }
  end

  # Este método deleta o objeto do banco de dados
  def delete
    return if @id == nil
    @@connection.query "
      DELETE FROM Fragments WHERE id = #{@id.to_i}
    "
  end

  # Update a object in database
  def update
      @@connection.query "
        UPDATE Fragments SET source = '#{Zip.zip @source}', name = '#{Zip.zip @name}' WHERE id = #{id.to_i}
      "
  end

  # Traduz o objeto para uma string
  def to_s
    "#{@name}:#{@source}"
  end

  # Detecta a linguagem pelo nome do fragmento
  private
  def detect
    # Detecta a extensão do arquivo
    extension = @name.split(".").last

    # Seleciona a linguagem
    @lang = Config.fragLangs[extension]
    @lang = :notRecognized if @lang == nil
  end

end
