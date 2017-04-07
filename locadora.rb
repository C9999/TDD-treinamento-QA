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

def option_carrinho()
  puts "Deseja incluir um novo filme ?(1 = Sim, 2 = Não): "
  d = Integer(gets.chomp)
  if d == 1
    inclui_filme_no_carrinho()
  elsif d == 2
     fecha_carrinho()
  else
     option_carrinho()
  end
end

def inclui_filme_no_carrinho()
  puts "Digite o ID do filme a ser inserido no carrinho: "
  num_id = Integer(gets.chomp) #ID do filme
  $carrinho<<num_id
  $total_de_filmes = $total_de_filmes + 1
  somatoria(num_id)
end

def somatoria(num_id) #Fase 2: Implementar um hash de id para valor
  if num_id == 1
    $total += 45
  elsif num_id == 2
    $total += 55
  elsif num_id == 3
    $total += 100
  elsif num_id == 4
    $total += 55
  elsif num_id == 5
    $total += 100
  elsif num_id == 6
    $total += 200
  else
    puts "ID invalido!, por favor insira um filme que exista em nosso cadastro. "
    inclui_filme_no_carrinho()
  end
  option_carrinho()
end

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

def fecha_carrinho()
  desconto = valida_promocao($total)
  temp = $total * desconto
  total_promocional = $total - temp
  puts
  puts "Calculando o valor carrinho..."
  puts
  puts "IDs incluidos:  #{$carrinho} "
  puts
  puts "Quantidade de filmes alugados: #{$total_de_filmes}"
  puts
  puts "Valor total:  R$ #{$total},00"
  puts
  puts "Possivel desconto: -#{desconto * 100}%"
  puts
  puts "Valor com desconto: R$ #{total_promocional}"
  puts
  puts "Aprovar desconto para esse cliente ?(1 = Sim, 2 = Não): "
  e = Integer(gets.chomp)
  if e == 1
    puts ">>> Desconto de #{desconto * 100}% aplicado com sucesso!, total a ser pago: R$ #{total_promocional} <<<"
  elsif e == 2
    puts ">>> Compra fechada sem desconto, total a ser pago: R$ #{$total},00 <<<"
  else
    desconto = temp = total_promocional = 0
    fecha_carrinho()
  end
end

#Main **************************************
$carrinho = [ ]
$total = 0
$total_de_filmes = 0

puts ">> Filmes em catalogo: <<"
puts
rings = FilmesEmCatalogo.new(1, "O Senhor dos Anéis", "Fantasia", 45)

white = FilmesEmCatalogo.new(2, "As Branquelas", "Comédia", 55)

vf7 = FilmesEmCatalogo.new(3, "Velozes e Furiosos 7", "Ação", 100)

vf6 = FilmesEmCatalogo.new(4, "Velozes e Furiosos 6", "Ação", 55)

scp = FilmesEmCatalogo.new(5, "The Scapegoat", "Drama", 100)

bad = FilmesEmCatalogo.new(6, "Meu Malvado Favorito", "Animação", 200)

inclui_filme_no_carrinho()
