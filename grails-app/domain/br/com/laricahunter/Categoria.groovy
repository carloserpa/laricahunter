package br.com.laricahunter

class Categoria {
    String nome;
    static constraints = {
        nome(blank: false)
    }
}
