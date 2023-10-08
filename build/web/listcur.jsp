<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Cursos</title>
        <link rel="stylesheet" href="tabela.css"
        
        
          
    </head>
    <body>
        <%
            //Conectar com o Banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/quintas_noite", "root", "1234");
            //Buscar todos os cursos da tabela curso do BD
            String sql = "SELECT * FROM curso";
            PreparedStatement st = conexao.prepareStatement(sql);
            ResultSet resultado = st.executeQuery(); //Executa o SELECT  
        %>
        <table 
            <tr>
                <th> código </th>
                <th> Nome </th>
                <th> duração </th>
                <th>Alteração</th>
                <th>Exclusão</th>
                
            </tr>
            <%
                //Exibir os cursoos um por um
                while (resultado.next()) {

            %>


            <tr>
                <td> <%= resultado.getString("codigo")%> </td>
                <td> <%= resultado.getString("nome")%> </td>
                <td> <%= resultado.getString("duracao")%> </td>
                <td> <a href="excur.jsp?codigo=<%= resultado.getString("codigo")%>"> Excluir </a> </td>
                <td> <a href="carregacurso.jsp?codigo=<%= resultado.getString("codigo")%>"> Alterar </a> </td>
            </tr>

            <%
                }
            %> 

        </table>
    </body>
</html>
