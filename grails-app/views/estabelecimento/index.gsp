<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estabelecimento.label', default: 'Estabelecimento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-estabelecimento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-estabelecimento" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:table collection="${estabelecimentoList}" /> -->
            <table>                
                <thead>
                    <tr>
                        <g:sortableColumn property="cnpj" defaultOrder="asc" title="CNPJ"/>
                        <g:sortableColumn property="nomefantasia" defaultOrder="asc" title="Nome Fantasia"/>
                        <th>Imagem</th>                        
                        <th>Fone</th>
                        <th>Horário Funcionamento</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${estabelecimentoList}" var="estabelecimento">                                    
                    <tr>                      
                        <td><g:link action="show" resource="${estabelecimento}">${estabelecimento.cnpj}</g:link></td>  
                        <td>${estabelecimento.nomefantasia}</td>  
                        <td>                        
                            <img width="50" height="50" src="${createLink(controller:'estabelecimento', action:'image', id: estabelecimento.id)}"/>
                        </td>               
                        <td>${estabelecimento.fone1}</td>  
                        <td><g:formatDate format="HH:mm" date="${estabelecimento.horaabertura}"/> : <g:formatDate format="HH:mm" date="${estabelecimento.horafechamento}"/></td>  
                     </tr>
                     </g:each>                      
                    
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${estabelecimentoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>