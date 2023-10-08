
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% // Declaração de variaveis
            String c, n, d, sql;
            Connection conexao;
            PreparedStatement st;

            //Receber os dados digitados no formulário
            c = request.getParameter("codigo");
            n = request.getParameter("nome");
            d = request.getParameter("duracao");
            try {
                // Conectar com o Banco de Dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/quintas_noite", "root", "1234");
                //Enviar os dados alterados, recebidos acima, na tabela do BD
                sql = "UPDATE curso SET nome = ?, duracao = ? WHERE codigo = ?";
                st = conexao.prepareStatement(sql);
                st.setString(1, n);
                st.setString(2, d);
                st.setString(3, c);
                st.executeUpdate(); // Execulta o update
                out.print("O curso de código " + c + " foi alterado com sucesso");
            } catch (SQLException erro) {
                out.print("Entre em contato com o suporte e informe o erro " + erro.getErrorCode());
            }
        %>
    </body>
</html>
