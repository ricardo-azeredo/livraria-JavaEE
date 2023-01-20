

<%@page import="br.com.livraria.DAO.AutorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.livraria.DTO.Autor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar bg-light">
            <div class="container">
                <a href="/Livraria/" ><span class="navbar-brand mb-0 h1">Livraria</span></a>
            </div>
        </nav>
        <form action="addLivroAction.jsp" method="POST">
            <div>
                <label>Nome</label><br/>
                <input type="text" name="nome" />
            </div>
            <div>
                <label>ISBN</label><br/>
                <input type="text" name="isbn" />
            </div>
            <div>
                <label>Valor</label><br/>
                <input type="text" name="valor" />
            </div>
            <div>
                <label>Autor</label><br/>
                <select name="autor">
                    <%
                        AutorDAO autorDAO = new AutorDAO();
                        ArrayList<Autor> lista = autorDAO.PesquisarAutor();

                        for (int i = 0; i < lista.size(); i++) {
                            out.print("<option  value='"+lista.get(i).getAutorId()+"'>"+lista.get(i).getAutorId()+" - "+lista.get(i).getNomeAutor()+"</option>");
                        }
                    %>
                </select>
            </div>
            <button type="submit">Cadastrar</button>
        </form>
    </body>
</html>
