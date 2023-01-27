
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
            <table class="table">
                <thead>
                  <tr>    
                    <th scope="col">Código</th>
                    <th scope="col">Livro</th>
                    <th scope="col">ISBN</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Autor</th>
                    <th scope="col" colspan="2">Ação</th>
                  </tr>
                </thead>
                <tbody>
                    
                        <%
                            try {
                                LivroDAO livroDAO = new LivroDAO();
                                ArrayList<Livros> lista = livroDAO.PesquisarLivro();

                                for (int i = 0; i < lista.size(); i++) {
                                %>
                                <tr>
                                    
                                <%
                                    out.print("<td>"+lista.get(i).getLivroID()+"</td>");
                                    out.print("<td>"+lista.get(i).getNomeLivro()+"</td>");
                                    out.print("<td>"+lista.get(i).getIsbn()+"</td>");
                                    out.print("<td>"+lista.get(i).getValor()+"</td>");
                                    out.print("<td>"+lista.get(i).getAutorId()+"</td>");

                                    out.print("<td><a type='button' class='btn btn-primary' href='frmAlterarLivroView.jsp?id=" 
                                                + lista.get(i).getLivroID() +
                                                "&nome="+ lista.get(i).getNomeLivro() + 
                                                "&isbn="+ lista.get(i).getIsbn()+
                                                "&valor="+ lista.get(i).getValor()+
                                                "&autorId="+ lista.get(i).getAutorId()+
                                                "'>Alterar </a></td>");
                                    %>
                                    
                                </tr>
                                <%
                                }
                            } catch (Exception e) {
                                out.print("Não há livros");
                            }

                       %>  
                             
                </tbody>
            </table>    
        </div>
         
    </body>
</html>
