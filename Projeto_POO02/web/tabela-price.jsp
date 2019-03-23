<%-- 
    Document   : tabela
    Created on : 17/03/2019, 20:03:15
    Author     : Leticia
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Locale"%>
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
        <style>
            .tabela, td, th {
                border: ;
            }
            
            .tabela th{
                padding: 5px;
            }
        </style>
    <body>
     <div  class="min">
         <center>
                
                <H1>Tabela Price</H1> 
          
        <br>
        <br>
        <table width="100%">
            <tr align="center">
        <form>
            <td> Empréstimo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="emprestimo"><br>
            Taxa de Juros:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" step="0.01" name="taxa"><br>
            Nº de Parcelas:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="parcelas"><br>
            <input type="submit" name="calcular" value="Calcular"><br>
        </form>
        </td>       
        <td>
        <br>
        <br>
        <%if(request.getParameter("calcular") != null){
            double emprestimo=Double.parseDouble(request.getParameter("emprestimo"));
            double taxa=Double.parseDouble(request.getParameter("taxa"));
            double parcelas=Double.parseDouble(request.getParameter("parcelas"));
                
            double prestação=emprestimo*((Math.pow((1 + taxa/100), parcelas) * taxa/100) / (Math.pow((1 + taxa/100), parcelas) - 1));
            double devedor=emprestimo;
            double prestaçãoTotal = 0;
            double juros = 0;
            double jurosTotal = 0;
            double amortização = 0;
            double amortizaçãoTotal = 0;
            
            Locale.setDefault(new Locale("pt", "BR"));
            DecimalFormat df = new DecimalFormat();
            df.applyPattern("R$ #,##0.00");
           
            %><table class="tabela" border="1">                <thead>
                    <th> Parcela </th>    
                    <th> Prestação </th>  
                    <th> Juros </th>  
                    <th> Amortização </th>    
                    <th> Saldo devedor </th>
                </thead>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><%=df.format(devedor)%></td>
                </tr>
            <%for(int i=1; i <= parcelas; i++){
                prestaçãoTotal = prestaçãoTotal + prestação;
                juros = devedor * taxa/100;
                jurosTotal = jurosTotal + juros;
                amortização = prestação - juros;
                devedor = devedor - amortização;
                amortizaçãoTotal = amortização + amortizaçãoTotal;
            %>    
            <tr>
                <td><%=i%></td>
                <td><%=df.format(prestação)%></td>
                <td><%=df.format(juros)%></td>
                <td><%=df.format(amortização)%></td>
                <td><%=df.format(devedor)%></td>
            </tr>
            <%}%>
            <tr>
                    <td>Total</td>
                    <td><%=df.format(prestaçãoTotal)%></td>
                    <td><%=df.format(jurosTotal)%></td>
                    <td><%=df.format(amortizaçãoTotal)%></td>
                    <td><%=df.format(devedor)%></td>
                </tr>
            </table>
        <%}%>
        </td>
        </tr>
        </table>   
     </div>     
    </body>
    <footer>
         <%@include file="WEB-INF/jspf/footer.jspf"%>
    </footer>
</html>
