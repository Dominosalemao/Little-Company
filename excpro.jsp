<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecluir produtos</title>
    </head>
    <body>
        <%
            //Recebe o código digitado no formulário
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            //Conecta ao banco de dados chamado banco
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root" , "admin");
            // Excclui o produto de códio informado 
            PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo = ?");
            st.setInt(1, cod);
            int resultado = st.executeUpdate(); //Executa o comando DELETE 
            //Verifica se o produto foi excluido
            if(resultado == 0){
              out.print("Este produto não está cadastrado");
            } else{
              out.print("O protudo de código " + cod + " foi excluido com sucesso");
            }           

        %>
    </body>
</html>
