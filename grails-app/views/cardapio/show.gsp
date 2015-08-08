<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-cardapio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-cardapio" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:display bean="cardapio" />-->
            <ol class="property-list cardapio">
                <li class="fieldcontain">
                   <span id="descricao-label" class="property-label">Descrição</span>
                   <div class="property-value" aria-labelledby="descricao-label">${this.cardapio.descricao}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="preco-label" class="property-label">Preco</span>
                   <div class="property-value" aria-labelledby="preco-label">${this.cardapio.preco}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="imagem-label" class="property-label">Imagem</span>
                   <div class="property-value" aria-labelledby="imagem-label">
                        <img width="50" height="50" src="${createLink(controller:'cardapio', action:'image', id: cardapio.id)}"/>
                   </div>     
                </li>
                <li class="fieldcontain">
                   <span id="categoria-label" class="property-label">Categoria</span>
                   <div class="property-value" aria-labelledby="categoria-label">
                        <g:link action="show" resource="${cardapio.categoria}">${cardapio.categoria}</g:link>
                   </div>     
                </li>
                <li class="fieldcontain">
                   <span id="Produto-label" class="property-label">Produto</span>
                   <div class="property-value" aria-labelledby="produto-label">
                        <g:link action="show" resource="${cardapio.produto}">${cardapio.produto}</g:link>
                   </div>     
                </li>
            </ol>
            <g:form resource="${this.cardapio}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.cardapio}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
