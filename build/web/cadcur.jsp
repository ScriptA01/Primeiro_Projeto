<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Receber os dados digitados no formulário
            String c, n, d;
            c = request.getParameter("codigo");
            n = request.getParameter("nome");
            d = request.getParameter("duracao");
            try {

                // Conectar com o Banco de Dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/quintas_noite", "root", "1234");

                // Inserir os dados recebidos do cadcur.html na tabela curso do BD
                String sql = "INSERT INTO curso VALUES(?,?,?)";
                PreparedStatement st = conexao.prepareStatement(sql);
                st.setString(1, c);
                st.setString(2, n);
                st.setString(3, d);

                st.executeUpdate(); // Executa o INSERT gerado acima
                out.print("Curso cadastrado com sucesso");

            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                //Duplicate entry 'cc' for key 'curso.PRIMARY'
                if (mensagemErro.contains("Duplicate entry")) {
                    out.print("<b>Este curso já está cadastrado<b>");
                } else {
                    out.print("Erro = " + mensagemErro);
                }
            }
        %>
    </body>
</html>
