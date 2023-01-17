
package br.com.livraria.DTO;

public abstract class Livros {
    private int livroId;
    private String nomeLivro;
    private String isbn;
    private double valor;
    private Autor autorId;
    
    
    public int getLivroID(){
        return livroId;
    }
    
    public void setLivroID(int livroId ){
        this.livroId = livroId;
    }
    
    public String getNomeLivro(){
        return nomeLivro;
    }
    
    public void setnomeLivro(String nomeLivro){
        this.nomeLivro = nomeLivro;
    }
    
    public String isbn(){
        return isbn;
    }
    
    public void setIsbn(String isbn){
        this.isbn = isbn;
    }
    
   public double getValor(){
       return valor;
   }     
   
   public void setValor(double valor){
       this.valor = valor;
   }
   
   public Autor getAutorId(){
       return autorId;
   }
   
   public void setAutorId(Autor autorId) {
       this.autorId = autorId;
   }       
}
