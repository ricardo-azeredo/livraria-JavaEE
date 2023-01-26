
package br.com.livraria.DAO;

import br.com.livraria.DTO.LivroFisico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import br.com.livraria.DTO.Livros;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ricardo
 */
public class LivroDAO {
    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Livros> lista = new ArrayList<>();
    
   
        
    public void CadastrarLivro(Livros livro) throws ClassNotFoundException{
        String sql = "INSERT INTO livros (nome_livro, isbn, valor, autorId) VALUES (?, ?, ?, ?)";
        conn = new ConexaoDAO().conexaoDB();
        
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, livro.getNomeLivro());
            pstm.setString(2, livro.getIsbn());
            pstm.setDouble(3, livro.getValor());
            pstm.setInt(4, livro.getAutorId());
            pstm.execute();
            pstm.close();
        } catch(SQLException e){
            System.out.println("Não foi possível cadastrar ");
        }
    }
    
    public ArrayList<Livros> PesquisarLivro() throws ClassNotFoundException {
        String sql = "SELECT * FROM livros";
        conn = new ConexaoDAO().conexaoDB();
        
        try {
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            
            while(rs.next()){
                               
                Livros livro = new Livros();
                livro.setLivroID(rs.getInt("id")); 
                livro.setNomeLivro(rs.getString("nome_livro"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setValor(rs.getDouble("valor"));
                livro.setAutorId(rs.getInt("autorId"));
                lista.add(livro);
               
            }
            pstm.close();
        } catch(SQLException e){
            System.out.println("Não há livros para ser exibidos");
        }
        return lista;
    }
}