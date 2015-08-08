package br.com.laricahunter

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CardapioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cardapio.list(params), model:[cardapioCount: Cardapio.count()]
    }

    def image= {
        def something = Cardapio.get( params.id )
        byte[] image = something.avatar
        response.outputStream << image
    }


    def show(Cardapio cardapio) {
        respond cardapio
    }

    def create() {
        respond new Cardapio(params)
    }

    @Transactional
    def save(Cardapio cardapio) {
        if (cardapio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cardapio.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cardapio.errors, view:'create'
            return
        }

        cardapio.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), cardapio.id])
                redirect cardapio
            }
            '*' { respond cardapio, [status: CREATED] }
        }
    }

    def edit(Cardapio cardapio) {
        /*def oldAvatar = cardapio.avatar
 
        cardapio.properties = params
         
        if(!cardapio.avatar){
            cardapio.avatar = oldAvatar;
        }*/
        respond cardapio
    }

    @Transactional
    def update(Cardapio cardapio) {
        if (cardapio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cardapio.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cardapio.errors, view:'edit'
            return
        }

        cardapio.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), cardapio.id])
                redirect cardapio
            }
            '*'{ respond cardapio, [status: OK] }
        }
    }

    @Transactional
    def delete(Cardapio cardapio) {

        if (cardapio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        cardapio.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), cardapio.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
