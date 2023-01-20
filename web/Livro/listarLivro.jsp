
<%@page import="br.com.livraria.DAO.LivroDAO"%>
<%@page import="br.com.livraria.DTO.Livros"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Includes/head.jsp"></jsp:include>
    
    <body>
        <jsp:include page="../Includes/navbar.jsp">
             <jsp:param name="title" value="Listar Livros" />
         </jsp:include>
        <div class="container">
            <h1>Listar Livros</h1>
            <%
                try {
                    LivroDAO livroDAO = new LivroDAO();
                    ArrayList<Livros> lista = livroDAO.PesquisarLivro();

                    for (int i = 0; i < lista.size(); i++) {
                        out.print("Código: " + lista.get(i).getLivroID() + "<br/>");
                        out.print("Titulo: " + lista.get(i).getNomeLivro() + "<br/>");
                    }
                } catch (Exception e) {
                    out.print("Não há livros");
                }

            %>  
        </div>
         
    </body>
</html>
