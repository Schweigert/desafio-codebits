# Arquivo de Configuração
# Descreve o funcionamento básico da aplicação

class Config
  # Configurações relevantes ao Banco de Dados
  # Utilizando o MySQL (MySQL2 Lib)
  @dbHost = "localhost"
  @dbName = "codebits"
  @dbUser = "root"
  @dbPass = "root"

  class << self
    attr_reader :dbHost
    attr_reader :dbName
    attr_reader :dbUser
    attr_reader :dbPass
  end

end
