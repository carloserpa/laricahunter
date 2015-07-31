package br.com.laricahunter

class Produto {
    String nome
    static belongsTo = [categoria: Categoria]

    static constraints = {
        nome(blank: false)
    }
/*
    static mapping = {
        categoria cascade:"all-delete-orphan"
    }
 */
 	String toString() {
    	return this.nome;
	}
}
