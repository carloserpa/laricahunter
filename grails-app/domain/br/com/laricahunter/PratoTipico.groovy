package br.com.laricahunter

class PratoTipico {
	static belongsTo = [produto: Produto, municipio: Municipio]
	
    static constraints = {
    }
}
