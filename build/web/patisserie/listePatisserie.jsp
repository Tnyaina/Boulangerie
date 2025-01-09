<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Patisserie> produits = BddObject.find(new Patisserie(), null); 
%>

<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mx-auto ml-auto">
    <div class="h-100 bg-light rounded p-4">
        <div class="d-flex flex-row justify-content-between mb-4">    
            <h6 class="mb-0"> Liste des patisseries </h6>
        </div>
       
        <div style="width: 100%">
            <table border="1" class="table table-lg table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nom</th>
                        <th>Prix unite</th>
                        <th>Catégorie</th>
                        <th>Parfum</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Patisserie prod : produits) {
                        // Récupérer la catégorie de la pâtisserie
                        PatisserieCategory pc = new PatisserieCategory();
                        pc.setIdPatisserie(prod.getId());
                        List<PatisserieCategory> pcList = BddObject.find(pc, null);
                        
                        Category category = null;
                        if(!pcList.isEmpty()) {
                            Category catTemp = new Category();
                            catTemp.setId(pcList.get(0).getIdCategory());
                            List<Category> cats = BddObject.find(catTemp, null);
                            if(!cats.isEmpty()) {
                                category = cats.get(0);
                            }
                        }
                        
                        // Récupérer le parfum unique associé à cette patisserie
                        PatParfum patParfum = new PatParfum();
                        patParfum.setIdPatisserie(prod.getId());
                        List<PatParfum> patParfums = BddObject.find(patParfum, null);
                        Parfum parfum = null;
                        if(!patParfums.isEmpty()) {
                            parfum = patParfums.get(0).getParfum();
                        }
                %>
                    <tr>
                        <td><%= prod.getId() %></td>
                        <td><%= prod.getNomPatisserie() %></td>
                        <td><%= prod.getPrixUnite() %> Ar</td>
                        <td>
                            <% if(category != null) { %>
                                <%= category.getNomCategory() %>
                            <% } else { %>
                                <span class="text-muted">Non catégorisé</span>
                            <% } %>
                        </td>
                        <td>
                            <% if(parfum != null) { %>
                                <%= parfum.getNom() %>
                            <% } else { %>
                                <span class="text-muted">Aucun parfum</span>
                            <% } %>
                        </td>
                    </tr>
                <% } %> 
                </tbody>
            </table>
        </div>
    </div>
</div>