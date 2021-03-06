require_relative "regras"

class FilmesEmCatalogo
  def initialize(id, titulo, genero, valor)
    $id = id
    $titulo = titulo
    $genero = genero
    $valor = valor
    descricao()
  end

  def descricao()
    puts " ID: #{$id}, #{$titulo}, Genero: #{$genero} R$#{$valor},00 "
  end
end

def option_carrinho(obj)
  @obj = obj
  puts "Deseja incluir um novo filme ?(s = Sim, n = Não): "
  d = (gets.chomp) #Resposta de Sim ou Não
  if d == "s"
    $i = 0
    inclui_filme_no_carrinho(obj)
  elsif d == "n"
    $i = 1
    inclui_filme_no_carrinho(obj)
  else
    $i = 1
    inclui_filme_no_carrinho(obj)
  end
end

def inclui_filme_no_carrinho(obj)
  @obj = obj
  while $i == 0 do
    puts "Digite o ID do filme a ser inserido no carrinho: "
    num_id = Integer(gets.chomp) #ID do filme
    $carrinho_qtd<<num_id
    $total_de_filmes = $total_de_filmes + 1
    temp = obj.soma_valores(num_id)
    $total += temp

    if num_id == 3 || num_id == 4
      $desconto_filme_acao = obj.valida_genero_acao(true)
    end
    option_carrinho(obj)
  end
end

#Main **************************************

carrinho = Regras.new()

puts ">> Filmes em catalogo: <<"
puts
rings = FilmesEmCatalogo.new(1, "O Senhor dos Anéis", "Fantasia", 45)

white = FilmesEmCatalogo.new(2, "As Branquelas", "Comédia", 55)

vf7 = FilmesEmCatalogo.new(3, "Velozes e Furiosos 7", "Ação", 100)

vf6 = FilmesEmCatalogo.new(4, "Velozes e Furiosos 6", "Ação", 55)

scp = FilmesEmCatalogo.new(5, "The Scapegoat", "Drama", 100)

bad = FilmesEmCatalogo.new(6, "Meu Malvado Favorito", "Animação", 200)

inclui_filme_no_carrinho(carrinho)

desconto = carrinho.valida_promocao($total)
temp = $total * desconto
total_promocional = $total - temp

promo = $total * $desconto_filme_acao
total_promocional = total_promocional - promo
acumulado = promo
puts
puts "Calculando o valor carrinho..."
puts
puts "IDs incluidos:  #{$carrinho_qtd} "
puts
puts "Quantidade de filmes alugados: #{$total_de_filmes}"
puts
puts "Valor total:  R$ #{$total},00"
puts
puts "Possível desconto: -#{desconto * 100}%"
puts
if $filme_acao == true
  acumulado = $desconto_filme_acao + desconto
  acumulado = acumulado * 100
  puts "Desconto promocional ativo devido a locação de filme de Ação, bonus de -#{$desconto_filme_acao * 100}% "
  puts
  puts "Total de descontos acumulados: -#{acumulado}%"
  puts
end
puts "Valor com desconto: R$ #{total_promocional}"
puts
puts "Aprovar desconto para esse cliente ?(s = Sim, n = Não): "
e = (gets.chomp) #Aprovação do desconto no final da compra
if e == "s"
  desconto = desconto + $desconto_filme_acao
  puts ">>> Desconto de #{desconto * 100}% aplicado com sucesso!, total a ser pago: R$ #{total_promocional} <<<"
  puts
elsif e == "n"
  puts ">>> Compra fechada sem desconto, total a ser pago: R$ #{$total},00 <<<"
  puts
else
  desconto = temp = total_promocional = 0
end
