<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-cardapio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-cardapio" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:table collection="${cardapioList}" />-->
            
            <table>                
                <thead>
                    <tr>
                        <g:sortableColumn property="descricao" defaultOrder="asc" title="Descrição"/>
                        <g:sortableColumn property="preco" defaultOrder="asc" title="Preço"/>
                        <th>Imagem</th>
                        <g:sortableColumn property="categoria" defaultOrder="asc" title="Categoria"/>
                        <g:sortableColumn property="produto" defaultOrder="asc" title="Produto"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${cardapioList}" var="cardapio">                                    
                    <tr>                      
                        <td><g:link action="show" resource="${cardapio}">${cardapio.descricao}</g:link></td>  
                        <td>${cardapio.preco}</td>  
                        <td>                        
                            <img width="50" height="50" src="${createLink(controller:'cardapio', action:'image', id: cardapio.id)}"/>
                        </td>               
                        <td><g:link action="show" resource="${cardapio.categoria}">${cardapio.categoria}</g:link></td>  
                        <td><g:link action="show" resource="${cardapio.produto}">${cardapio.produto}</g:link></td>      
                     </tr>
                     </g:each>                      
                    
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${cardapioCount ?: 0}" />
            </div>
        </div>
    </body>
</html>