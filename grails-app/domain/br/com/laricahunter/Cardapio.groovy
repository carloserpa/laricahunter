package br.com.laricahunter

class Cardapio {
	Double preco
	String descricao
	byte[] avatar
	static belongsTo = [produto: Produto, categoria: Categoria, estabelecimento: Estabelecimento]
	
    static constraints = {
    	preco(blank: false)
		descricao(blank: false)
		avatar(size:0..131072, nulable: true)
    }
}
