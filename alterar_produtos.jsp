<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produtos </title>
    </head>
    <body>
        <%
          //Recebe os dados ALTERADOS no formulário carregaprod.jsp  
            int c;
            String n, m;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            p = Double.parseDouble(request.getParameter("preco"));
          //Fazer a conexão com o banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "admin");
          //Alterar os dados na tabela produto no BD
            st = conecta.prepareStatement("UPDATE produto SET nome = ?, marca = ?, preco = ? WHERE codigo = ?");
            st.setString(1, n);
            st.setString(2, m);
            st.setDouble(3, p);
            st.setInt(4, c);
            st.executeUpdate();
            out.print("O produto " +c+ " foi alterado com sucesso");

        %>
    </body>
</html>
