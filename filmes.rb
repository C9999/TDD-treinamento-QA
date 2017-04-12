class FilmesEmCatalogo
  def initialize(id, titulo, genero, valor)
    @id = id
    @titulo = titulo
    @genero = genero
    @valor = valor
    descricao()
  end

  def descricao()
    puts " ID: #{@id}, #{@titulo}, Genero: #{@genero} R$#{@valor},00 "
  end
end
