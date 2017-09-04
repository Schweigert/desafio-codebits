require 'zlib'
require 'base64'

# Essa classe trabalha com compressão de dados.
# Será utilizada para comprimir dados ao inserir no banco, evitando
# SqlInjection* (Pode ser quebrado utilizando a engenharia reversa)
# O documento de engenharia do algoritmo encontra-se na RFC 1950.
# O documento de engenharia de decompressão encontra-se na RFC 1951.
# O seu funcionamento é próximo á codificação de Huffman, porém funcioa com
# uma complexidade inferior.

class Zip

  # Comprime um texto
  def self.zip txt
    compressed = Zlib::Deflate.deflate txt
    return Base64.encode64 compressed
  end

  # Extrai um texto comprimido
  def self.dezip compressed
    return Zlib::Inflate.inflate(Base64.decode64(compressed))
  end

end
