package br.com.laricahunter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PratoTipicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PratoTipico.list(params), model:[pratoTipicoCount: PratoTipico.count()]
    }

    def show(PratoTipico pratoTipico) {
        respond pratoTipico
    }

    def create() {
        respond new PratoTipico(params)
    }

    @Transactional
    def save(PratoTipico pratoTipico) {
        if (pratoTipico == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pratoTipico.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pratoTipico.errors, view:'create'
            return
        }

        pratoTipico.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pratoTipico.label', default: 'PratoTipico'), pratoTipico.id])
                redirect pratoTipico
            }
            '*' { respond pratoTipico, [status: CREATED] }
        }
    }

    def edit(PratoTipico pratoTipico) {
        respond pratoTipico
    }

    @Transactional
    def update(PratoTipico pratoTipico) {
        if (pratoTipico == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pratoTipico.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pratoTipico.errors, view:'edit'
            return
        }

        pratoTipico.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'pratoTipico.label', default: 'PratoTipico'), pratoTipico.id])
                redirect pratoTipico
            }
            '*'{ respond pratoTipico, [status: OK] }
        }
    }

    @Transactional
    def delete(PratoTipico pratoTipico) {

        if (pratoTipico == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        pratoTipico.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'pratoTipico.label', default: 'PratoTipico'), pratoTipico.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pratoTipico.label', default: 'PratoTipico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
