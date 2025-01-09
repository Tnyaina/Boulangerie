<%-- 
    Document   : tableau
    Created on : 26 déc. 2024, 19:28:16
    Author     : aram
--%>
<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  String getId = (String) request.getParameter("id");
  Produit produit = new Produit();
  produit.setId(getId);
  produit = BddObject.findById(produit, null);
%>

<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mx-auto ml-auto">
    <div class="h-100 bg-light rounded p-4">
        <div class="d-flex flex-row justify-content-between mb-4">    
            <h6 class="mb-0"> Template tableau : </h6>
        </div>
       
        <div style="width: 100%">
            <table border="1" class="table table-lg table-bordered">
                <thead>
                    <tr>
                        <th> Description </th>
                        <th> Valeur </th>  
                    </tr>
                </thead>
                <tbody>
                   
                    <tr>
                        <th> Id </th>
                        <td> <%= produit.getId() %>  </td>
                     
                    </tr>
                    <tr>
                        <th> Nom </th>
                        <td> <%= produit.getNomProduit() %> </td>
                    </tr>
                     <tr>
                        <th>Unite </th>
                        <td> <%= produit.getMyUnite().getNomUnite()%></td>
                     </tr>
                  
                </tbody>
            </table>
        </div>
    </div>
</div>