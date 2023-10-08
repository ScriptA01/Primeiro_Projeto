<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>dados do curso</title>
    </head>
    <body>
        <%
            // declaração
            String c, sql;
            Connection conexao;
            PreparedStatement st;
            ResultSet resultado;
            // Receber o codigo do curso digitado no form altcur
            c = request.getParameter("codigo");
            try
            {
                //Conectar com o Banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/quintas_noite", "root", "1234");
                // Buscar o curso pelo Código na tabela do BD
                sql = "SELECT * FROM curso WHERE codigo =?";
                st = conexao.prepareStatement(sql);
                st.setString(1, c);
                resultado = st.executeQuery(); //Executa o SELECT  
                if (resultado.next()) { //Se o curso foi encontrado na tabela
                    //Carregar os dado do curso em um formulário HTML

        %>

        <form method="action" action="altcur.jsp">
            <form>
                <p>
                    <label for="cod">Código:*</label>
                    <input readonly id="cod" type="text" name="codigo" size="5" maxlength="5" required  value="<%= resultado.getString("codigo")%>">
                </p>
                <p>
                    <label for="nom">Nome:*</label>
                    <input id="nom" type="text" name="nome" size="50" maxlength="50" required value="<%= resultado.getString("nome")%>">
                </p>
                <p>
                    <label for="dur">Duração:</label>
                    <input id="dur" type="text" name="duracao" size="15" maxlength="15" value="<%= resultado.getString("duracao")%>">
                </p>
                <p>
                    <input type="submit" value="Salvar alterações">
                </p>
            </form>

            <%
                    } else { //Se o curso não foi encontrado na tabela
                        out.print("Este curso de código " + c + " não está cadastrado");
                    }
            }catch (SQLException erro){
          out.print("Entre em contato com o suporte e informe o código de erro:" + erro.getErrorCode());
       }
            %>
    </body>
</html>
