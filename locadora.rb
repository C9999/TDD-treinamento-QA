require_relative "filmes"
require_relative "regras"
class CarrinhoRegras

  def option_carrinho()
    puts "Deseja incluir um novo filme ?(s = Sim, n = Não): "
    #d = Integer(gets.chomp) #Resposta de Sim ou Não
    d = (gets.chomp) #Resposta de Sim ou Não
    if d == "s"
      inclui_filme_no_carrinho(0)
    elsif d == "n"
      inclui_filme_no_carrinho(1)
    else
      inclui_filme_no_carrinho(1)
    end
  end

  def inclui_filme_no_carrinho(option)
    if option == 0
      puts "Digite o ID do filme a ser inserido no carrinho: "
      num_id = Integer(gets.chomp) #ID do filme
      #num_id = (gets.chomp).to_i #ID do filme
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
    puts "Aprovar desconto para esse cliente ?(s = Sim, n = Não): "
    #e = Integer(gets.chomp) #Aprovação do desconto no final da compra
    e = (gets.chomp) #Aprovação do desconto no final da compra
    if e == "s"
      puts ">>> Desconto de #{desconto * 100}% aplicado com sucesso!, total a ser pago: R$ #{total_promocional} <<<"
      puts
    elsif e == "n"
      puts ">>> Compra fechada sem desconto, total a ser pago: R$ #{@@total},00 <<<"
      puts
    else
      desconto = temp = total_promocional = 0
      fecha_carrinho()
    end
  end#Voltar na Main com if == 1 fazer os calculos
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
