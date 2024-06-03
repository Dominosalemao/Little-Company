<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset= ISO-8859-1">
        <title>Alteração de produtos</title>
    </head>
    <body>
        <%
            //Recebe o código do produto
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));
            //conectar ao banco de dados 
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "admin");
            //Buscar o produto pelo código que foi recebido
            st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ? ");
            st.setInt(1, c);
            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {
                out.print("Este produto não foi encontrado");
            } else {
        %>
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo") %>" readonly>
            </p>
            <p>
                <label for="nome">Nome do produto:</label>
                <input type="text" name="nome" id="nome" size="40" maxlength="40" value="<%= resultado.getString("nome") %>">
            </p>            
            <p>
                <label for="marca">Marca:</label>
                <input type="text" name="marca" id="marca" maxlength="30" value="<%= resultado.getString("marca") %>">
            </p>            
            <p>
                <label for="preco">Preço do produto:</label>
                <input type="number" step ="0.5" name="preco" id="preco" value="<%= resultado.getString("preco") %>">
            </p>            

            <p>
                <input type="submit" value="Salvar alterações">
            </p>

        </form>


        <%
            }
        %>
    </body>
</html>
