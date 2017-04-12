
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

class CarrinhoRegras
  @@carrinho_qtd = [ ]
  @@total = 0
  @@total_de_filmes = 0

  def valida_promocao(t)
    if t >= 100 && t < 200
      return 0.1
    elsif t >= 200 && t < 300
      return 0.2
    elsif t >= 300 && t < 400
      return 0.25
    elsif t >= 400
      return 0.3
    else
      return 0
    end
  end

  def valida_genero_acao(filme_acao)
    if filme_acao == true
      return 0.05
    else
      return 0
    end
  end

  def option_carrinho()
    puts "Deseja incluir um novo filme ?(1 = Sim, 2 = Não): "
    d = Integer(gets.chomp) #Resposta de Sim ou Não
    #d = (gets.chomp).to_i #Resposta de Sim ou Não
    if d == 1
      inclui_filme_no_carrinho(0)
    elsif d == 2
      inclui_filme_no_carrinho(1)
    else
      inclui_filme_no_carrinho(1)
    end
  end

  def inclui_filme_no_carrinho(option)
    if option == 0
      puts "Digite o ID do filme a ser inserido no carrinho: "
      num_id = Integer(gets.chomp) #ID do filme
      #num_id = (gets.chomp) #ID do filme
      @@carrinho_qtd << num_id
      @@total_de_filmes = @@total_de_filmes + 1
      temp = somatoria(num_id)
      @@total += temp
      option_carrinho()
    elsif option == 1
      fecha_carrinho()
    else
      fecha_carrinho()
    end
  end

  def somatoria(num_id)
    if num_id == 1
      return 45
    elsif num_id == 2
      return 55
    elsif num_id == 3
      return 100
    elsif num_id == 4
      return 55
    elsif num_id == 5
      return 100
    elsif num_id == 6
      return 200
    else
      return 0
    end
  end

  def fecha_carrinho()
    desconto = valida_promocao(@@total)
    temp = @@total * desconto
    total_promocional = @@total - temp
    puts
    puts "Calculando o valor carrinho..."
    puts
    puts "IDs incluidos:  #{@@carrinho_qtd} "
    puts
    puts "Quantidade de filmes alugados: #{@@total_de_filmes}"
    puts
    puts "Valor total:  R$ #{@@total},00"
    puts
    puts "Possivel desconto: -#{desconto * 100}%"
    puts
    puts "Valor com desconto: R$ #{total_promocional}"
    puts
    puts "Aprovar desconto para esse cliente ?(1 = Sim, 2 = Não): "
    e = Integer(gets.chomp) #Aprovação do desconto no final da compra
    #e = (gets.chomp) #Aprovação do desconto no final da compra
    if e == 1
      puts ">>> Desconto de #{desconto * 100}% aplicado com sucesso!, total a ser pago: R$ #{total_promocional} <<<"
    elsif e == 2
      puts ">>> Compra fechada sem desconto, total a ser pago: R$ #{@@total},00 <<<"
    else
      desconto = temp = total_promocional = 0
      fecha_carrinho()
    end
  end
end

#Main **************************************
carrinho = CarrinhoRegras.new()

puts ">> Filmes em catalogo: <<"
puts
rings = FilmesEmCatalogo.new(1, "O Senhor dos Anéis", "Fantasia", 45)

white = FilmesEmCatalogo.new(2, "As Branquelas", "Comédia", 55)

vf7 = FilmesEmCatalogo.new(3, "Velozes e Furiosos 7", "Ação", 100)

vf6 = FilmesEmCatalogo.new(4, "Velozes e Furiosos 6", "Ação", 55)

scp = FilmesEmCatalogo.new(5, "The Scapegoat", "Drama", 100)

bad = FilmesEmCatalogo.new(6, "Meu Malvado Favorito", "Animação", 200)

carrinho.inclui_filme_no_carrinho(0)
