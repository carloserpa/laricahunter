package br.com.laricahunter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstabelecimentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estabelecimento.list(params), model:[estabelecimentoCount: Estabelecimento.count()]
    }

    def show(Estabelecimento estabelecimento) {
        respond estabelecimento
    }

    def create() {
        respond new Estabelecimento(params)
    }

    @Transactional
    def save(Estabelecimento estabelecimento) {
        if (estabelecimento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (estabelecimento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond estabelecimento.errors, view:'create'
            return
        }

        estabelecimento.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estabelecimento.label', default: 'Estabelecimento'), estabelecimento.id])
                redirect estabelecimento
            }
            '*' { respond estabelecimento, [status: CREATED] }
        }
    }

    def edit(Estabelecimento estabelecimento) {
        respond estabelecimento
    }

    @Transactional
    def update(Estabelecimento estabelecimento) {
        if (estabelecimento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (estabelecimento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond estabelecimento.errors, view:'edit'
            return
        }

        estabelecimento.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'estabelecimento.label', default: 'Estabelecimento'), estabelecimento.id])
                redirect estabelecimento
            }
            '*'{ respond estabelecimento, [status: OK] }
        }
    }

    @Transactional
    def delete(Estabelecimento estabelecimento) {

        if (estabelecimento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        estabelecimento.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'estabelecimento.label', default: 'Estabelecimento'), estabelecimento.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estabelecimento.label', default: 'Estabelecimento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
