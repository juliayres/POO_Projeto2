<%-- 
    Document   : home
    Created on : 13/03/2019, 08:55:53
    Author     : Julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <header>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        </header>
    <body>

               <center>
                
                <H1>Amortização Constante</H1> 
          <table border="0" width="100%">
                <form>
                
                <tr><td align="center">Valor Empréstimo:&nbsp;<input type="number" name="emprestimo"><br>
                        Taxa de Juros:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="taxaJuros"><br>
                        Parcelas:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="numeroParcelas"><br>
                        <input type="submit" name="calcular" value="calcular"></td>
            </form>  
                <br>
                <br>
                <td><table border="1>"
                   
                     
                <% if (request.getParameter("calcular") != null) { %>
                
                <tr><td>#</td><td>Parcela</td><td>Amortizações</td><td>Juros</td><td>Saldo Devedor</td></tr>
                
                    
                   <%
                try {
                    double emprestimo = Integer.parseInt(request.getParameter("emprestimo"));
                    double taxaJuros = Integer.parseInt(request.getParameter("taxaJuros"));
                    double numeroParcelas = Integer.parseInt(request.getParameter("numeroParcelas")); 
                    double amortizacao= emprestimo/numeroParcelas;
                    double juros= emprestimo*taxaJuros/100;
                    int i=1;
                    double parcela = amortizacao + juros;
                    double saldoAtualizado= emprestimo-amortizacao;
                    
                    double somaParcela=juros, somaJuros=juros;
                    
                    
                    for (i=1; i<= numeroParcelas; i++){          
                    
                 %>
                 <tr> 
                    <td><%=i%></td>
                    <td>R$<%=parcela%></td> 
                    <td>R$<%=amortizacao%></td>
                    <td>R$<%=juros%></td> 
                    <td>R$<%=saldoAtualizado%></td>
                    
                    
                    <%
                    
                    juros= saldoAtualizado*taxaJuros/100;
                    parcela = amortizacao + juros;
                    saldoAtualizado= saldoAtualizado-amortizacao;
                    somaJuros= somaJuros+juros;
                    somaParcela= somaParcela + parcela;
                    %>
                </tr>
                
                <%
                     } 
%>

<tr><td>#</td><td>R$<%=somaParcela%></td><td>R$<%=emprestimo%></td><td>R$<%=somaJuros%></td><td>TOTAIS</td></tr>

<%

                    }
                
                catch (Exception e) {}
                    }
        %>
            </td>
            </tr>
        </table>
            </tr>
    </table> 
    </center>
    <div  class="min"> 
    </div>      
    </body>
    <footer>
         <%@include file="WEB-INF/jspf/footer.jspf"%>
    </footer>

