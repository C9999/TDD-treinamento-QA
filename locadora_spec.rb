require_relative "locadora"
describe CarrinhoRegras do
  context "Testes no valor total do Carrinho que deve aplicar uma porcentagem de desconto de acordo com a faixa. Nesse caso o filme de [Ação] não foi adicionado." do
    it "Carrinho com valor >= 100 e < 200 com desconto possível de 10%" do
      obj = CarrinhoRegras.new()
      resultado = obj.valida_promocao(150)
      expect(resultado).to eq(0.1)
    end
    it "Carrinho com valor >= 200 e < 300 com desconto possível de 20%" do
      obj = CarrinhoRegras.new()
      resultado = obj.valida_promocao(299)
      expect(resultado).to eq(0.2)
    end
    it "Carrinho com valor >= 300 e < 400 com desconto possível de 25%" do
      obj = CarrinhoRegras.new()
      resultado = obj.valida_promocao(301)
      expect(resultado).to eq(0.25)
    end
    it "Carrinho com valor > 400 com desconto possível de 30%" do
      obj = CarrinhoRegras.new()
      resultado = obj.valida_promocao(442)
      expect(resultado).to eq(0.3)
    end
    it "Carrinho com valor < 100 sem desconto" do
      obj = CarrinhoRegras.new()
      resultado = obj.valida_promocao(0)
      expect(resultado).to eq(0)
    end
  end
  context "Teste para validar se existe um filme do genero um filme de Açao para a aplicaçao de 5% de desconto" do
    it "Filme de Açao encontrado" do
      obj = CarrinhoRegras.new()
      desc = obj.valida_genero_acao(true)
      expect(desc).to eq(0.05)
    end
    it "Filme de Açao nao encontrado" do
      obj = CarrinhoRegras.new()
      desc = obj.valida_genero_acao(false)
      expect(desc).to eq(0)
    end
  end
end
