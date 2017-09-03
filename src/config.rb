# Arquivo de Configuração
# Descreve o funcionamento básico da aplicação

class Config
  # Configurações relevantes ao Banco de Dados
  # Utilizando o MySQL (MySQL2 Lib)
  @dbHost = "localhost"
  @dbName = "codebits"
  @dbUser = "root"
  @dbPass = "root"

  # Linguagens detectáveis
  @fragLangs = {
    "c"     =>  :c,
    "rb"    =>  :ruby,
    "py"    =>  :python,
    "go"    =>  :golang,
    "hs"    =>  :haskell,
    "cpp"   =>  :cpp,
    "java"  =>  :java
  }

  class << self
    attr_reader :dbHost
    attr_reader :dbName
    attr_reader :dbUser
    attr_reader :dbPass

    attr_reader :fragLangs
  end

end
