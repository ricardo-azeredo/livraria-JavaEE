<%-- 
    Document   : addLivroAction
    Author     : Rico
--%>

<%@page import="br.com.livraria.DAO.LivroDAO"%>
<%@page import="br.com.livraria.DTO.Livros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                Livros livro = new Livros();
                livro.setNomeLivro(request.getParameter("nome"));

                LivroDAO livroDAO = new LivroDAO();
                livroDAO.CadastrarLivro(livro);
                
                 response.sendRedirect("listarLivro.jsp");
            } catch(Exception e){
                
            }
         %>
    </body>
</html>