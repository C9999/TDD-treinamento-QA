class CarrinhoRegras
  @@carrinho_qtd = [ ]
  @@total = 0
  @@total_de_filmes = 0

  def valida_genero_acao(filme_acao)
    if filme_acao == true
      return 0.05
    else
      return 0
    end
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
end
