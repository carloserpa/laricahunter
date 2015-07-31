package br.com.laricahunter

class Municipio {
    String nome
    static belongsTo = [uf: Uf]

    static constraints = {
        nome(blank: false)
    }

    String toString() {
    	return this.nome;
	}
}
