<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Excluir cursos</title>
    </head>
    <body>
        <%
            // Declaração de variaveis
            String c;
            

            // Receber o código digitado no form excur.html
            c = request.getParameter("codigo");
            try {

                // conectar com o BD
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/quintas_noite", "root", "1234");
                
                //Excluir o curso de código informado
                PreparedStatement st = conexao.prepareStatement("DELETE FROM curso WHERE codigo = ?");
                st.setString(1, c);// Completa o Delete no lugar do ?
                int resultado = st.executeUpdate(); // Executa o comando delete
                if (resultado == 1) {
                    //mostra a mensagem da confirmação de exclusão
                    out.print("O curso " + c + " foi apagado com sucesso");
                } else {
                    out.print("O curso de código " + c + " não está cadastrado");
                }
            } catch (SQLException x) {
                out.print("Entre em contato com o suporte e informe o erro: " + x.getErrorCode());
            }
        %>
    </body>
</html>
