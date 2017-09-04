require 'mysql2'

# Esta classe representa um objeto com conexão ao banco de dados.
# Todo objeto que requer uma conexão ao banco deve herdar essa classe.
class Db

  # Inicializa a conexão com o banco de dados
  @@connection = Mysql2::Client.new :host     => Config.dbHost,
                                    :database => Config.dbName,
                                    :username => Config.dbUser,
                                    :password => Config.dbPass

end
