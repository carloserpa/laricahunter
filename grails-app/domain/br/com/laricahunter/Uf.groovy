package br.com.laricahunter

class Uf {
    String sigla
    String nome

    static constraints = {
        sigla(blank: false)
        nome(blank: false)

    }
}
