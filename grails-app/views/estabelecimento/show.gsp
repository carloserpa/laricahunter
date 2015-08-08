<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estabelecimento.label', default: 'Estabelecimento')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-estabelecimento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-estabelecimento" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:display bean="estabelecimento" /> -->
            <ol class="property-list estabelecimento">
                <li class="fieldcontain">
                   <span id="cnpj-label" class="property-label">CNPJ</span>
                   <div class="property-value" aria-labelledby="cnpj-label">${this.estabelecimento.cnpj}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="razaosocial-label" class="property-label">Razão Social</span>
                   <div class="property-value" aria-labelledby="razaosocial-label">${this.estabelecimento.razaosocial}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="nomefantasia-label" class="property-label">Nome Fantasia</span>
                   <div class="property-value" aria-labelledby="nomefantasia-label">${this.estabelecimento.nomefantasia}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="logradouro-label" class="property-label">Logradouro</span>
                   <div class="property-value" aria-labelledby="logradouro-label">${this.estabelecimento.logradouro}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="numero-label" class="property-label">Número</span>
                   <div class="property-value" aria-labelledby="numero-label">${this.estabelecimento.numero}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="complemento-label" class="property-label">Complemento</span>
                   <div class="property-value" aria-labelledby="complemento-label">${this.estabelecimento.complemento}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="bairro-label" class="property-label">Bairro</span>
                   <div class="property-value" aria-labelledby="bairro-label">${this.estabelecimento.razaosocial}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="cep-label" class="property-label">CEP</span>
                   <div class="property-value" aria-labelledby="cep-label">${this.estabelecimento.cep}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="fone1-label" class="property-label">Fone 1</span>
                   <div class="property-value" aria-labelledby="fone1-label">${this.estabelecimento.fone1}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="fone2-label" class="property-label">Fone 2</span>
                   <div class="property-value" aria-labelledby="fone2-label">${this.estabelecimento.fone2}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="fone3-label" class="property-label">Fone 3</span>
                   <div class="property-value" aria-labelledby="fone3-label">${this.estabelecimento.fone3}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="horaabertura-label" class="property-label">Hora abertura</span>
                   <div class="property-value" aria-labelledby="horaabertura-label">${this.estabelecimento.horaabertura}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="horafechamento-label" class="property-label">Hora fechamento</span>
                   <div class="property-value" aria-labelledby="horafechamento-label">${this.estabelecimento.horafechamento}</div>     
                </li>
                <li class="fieldcontain">
                   <span id="imagem-label" class="property-label">Imagem</span>
                   <div class="property-value" aria-labelledby="imagem-label">
                        <img width="50" height="50" src="${createLink(controller:'estabelecimento', action:'image', id: estabelecimento.id)}"/>
                   </div>     
                </li>
               <li class="fieldcontain">
                   <span id="municipio-label" class="property-label">Municipio</span>
                   <div class="property-value" aria-labelledby="municipio-label">${this.estabelecimento.municipio}</div>     
                </li>               
            </ol>
            <g:form resource="${this.estabelecimento}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.estabelecimento}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
