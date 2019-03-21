<%-- 
    Document   : home
    Created on : 13/03/2019, 09:10:53
    Author     : Marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <header>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        </header>
    <body>
     <div  class="min">
        <!--
        Alan!
        DESENVOLVER NESTA ÁREA
        
        
        -->
        
        <form>
            Valor do Emprestimo:<input type="number" name="emprestimo"/>
            Taxa de juros(%) ao mês:<input type="number" name="taxa"/>
            Quantidade de parcelas:<input type="number" name="parcelas"/>
            <input type="submit" name="price" value="calcular">
        </form>
        
        <%if(request.getParameter("calcular") != null){
        double juros, jurosTotal = 0, devedor, amortização = 0 , Total = 0, prestaçãoTotal = 0;
                double emprestimo = Double.parseDouble(request.getParameter("emprestimo"));
                double taxa = Double.parseDouble(request.getParameter("taxa"));
                double tempo = Double.parseDouble(request.getParameter("parcelas"));
                
                double prestação = emprestimo * ((Math.pow((1 + taxa/100), tempo) * taxa/100) / (Math.pow((1 + taxa/100), tempo) - 1));
                devedor = emprestimo;
                
                for(int i=1; i <= tempo; i++){
                    prestaçãoTotal = prestaçãoTotal + prestação;
                    juros = prestação * taxa/100;
                    jurosTotal = jurosTotal + juros;
                    amortização = prestação - juros;
                    devedor = devedor - amortização;
                    
                    out.println("<tr>");
                    out.println("<td>" + i + "</td>");
                    out.println("<td>" + prestação + "</td>");
                    out.println("<td>" + juros + "</td>");
                    out.println("<td>" + amortização + "</td>");
                    out.println("<td>" + devedor + "</td>");
                    out.println("</tr>");
                }
            out.println("<tr>");
            out.println("<td>" + Total + "</td>");
            out.println("<td>" + prestaçãoTotal + "</td>");
            out.println("<td>" + jurosTotal + "</td>");
            out.println("<td>" + amortização + "</td>");
            out.println("<td>" + devedor + "</td>");
            out.println("</tr>");
        %>
    </div>
    </body>
    <footer>
         <%@include file="WEB-INF/jspf/footer.jspf"%>
    </footer>
</html>
