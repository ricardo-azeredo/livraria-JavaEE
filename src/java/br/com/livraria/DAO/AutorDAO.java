
package br.com.livraria.DAO;

import br.com.livraria.DTO.Autor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author admin
 */
public class AutorDAO {
    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Autor> lista = new ArrayList<>();
    
    public void CadastrarAutor(Autor autor) throws ClassNotFoundException {
        String sql = "INSERT INTO autor(nome, email) VALUES (?, ?)";
        conn = new ConexaoDAO().conexaoDB();
        
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, autor.getNomeAutor());
            pstm.setString(2, autor.getEmail());
            pstm.execute();
            pstm.close();
            
        } catch(SQLException e){
            System.out.println("Não foi possível cadastrar ");
        }
    }
    
    public ArrayList<Autor> PesquisarLivro() throws ClassNotFoundException {
        String sql = "SELECT * FROM livros";
        conn = new ConexaoDAO().conexaoDB();
        
        try {
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            
            while(rs.next()){
                               
                Autor autor = new Autor();
                autor.setAutorId(rs.getInt("id")); 
                autor.setNomeAutor(rs.getString("nome"));
                
                lista.add(autor);
               
            }
            pstm.close();
        } catch(SQLException e){
            System.out.println("Não há livros para ser exibidos");
        }
        return lista;
    }
}
