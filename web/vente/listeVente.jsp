<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Vente> ventes = BddObject.find(new Vente(), null); 
%>

<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mx-auto ml-auto">
    <div class="h-100 bg-light rounded p-4">
        <div class="d-flex flex-row justify-content-between mb-4">    
            <h6 class="mb-0">Liste des Ventes</h6>
        </div>
       
        <div style="width: 100%">
            <table border="1" class="table table-lg table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Client</th>
                        <th>Pâtisserie</th>
                        <th>Prix</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Vente vente : ventes){ 
                        Patisserie pat = null;
                        try {
                            pat = vente.getPatisserie();
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                %>
                    <tr>
                        <td><%= vente.getId() %></td>
                        <td><%= vente.getNomClient() != null ? vente.getNomClient() : "-" %></td>
                        <td><%= pat != null ? pat.getNomPatisserie() : "Non défini" %></td>
                        <td><%= pat != null ? pat.getPrixUnite() + " Ar" : "-" %></td>
                        <td class="text-center">
                            <a href="home.jsp?page=vente/detailVente&&id=<%= vente.getId() %>">
                                <i class="fa fa-eye me-2"></i>
                            </a>
                        </td>
                    </tr>
                <% } %> 
                </tbody>
            </table>
        </div>
    </div>
</div>