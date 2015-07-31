package br.com.laricahunter

class Cardapio {
	Double preco
	String descricao
	static belongsTo = [produto: Produto, categoria: Categoria, estabelecimento: Estabelecimento]
	
    static constraints = {
    	preco(blank: false)
		descricao(blank: false)
    }
}
