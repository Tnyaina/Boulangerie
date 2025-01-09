<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Category> categories = BddObject.find(new Category(), null);
    List<Parfum> parfums = BddObject.find(new Parfum(), null);
    List<Patisserie> resultats = new ArrayList<Patisserie>();
    
    // Traitement du formulaire
    if(request.getMethod().equals("POST")) {
        String categoryId = request.getParameter("category");
        String parfumId = request.getParameter("parfum");
        
        if(categoryId != null && !categoryId.isEmpty() && parfumId != null && !parfumId.isEmpty()) {
            Category selectedCategory = new Category();
            selectedCategory.setId(categoryId);
            selectedCategory = BddObject.findById(selectedCategory, null);
            
            Parfum selectedParfum = new Parfum();
            selectedParfum.setId(parfumId);
            selectedParfum = BddObject.findById(selectedParfum, null);
            
            if(selectedCategory != null && selectedParfum != null) {
                Patisserie patisserie = new Patisserie();
                resultats = patisserie.getPatisserieByCategAndParfumSold(selectedCategory, selectedParfum);
            }
        }
    }
%>

<div>
    <h3>Rechercher les pâtisseries vendues par catégorie et parfum</h3>
</div>

<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mx-auto ml-auto">
    <div class="h-100 bg-light rounded p-4">
        <div class="d-flex flex-row justify-content-between mb-4">    
            <h6 class="mb-0">Sélection des critères</h6>
        </div>
        
        <form action="" method="post" class="needs-validation" novalidate>
            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label for="category" class="form-label">Catégorie de pâtisseries</label>
                    <select class="form-select" id="category" name="category" required>
                        <option value="">Choisir une catégorie...</option>
                        <%
                            for(Category cat : categories) {
                        %>
                            <option value="<%= cat.getId() %>"><%= cat.getNomCategory() %></option>
                        <%
                            }
                        %>
                    </select>
                    <div class="invalid-feedback">
                        Veuillez sélectionner une catégorie
                    </div>
                </div>
                
                <div class="col-md-6">
                    <label for="parfum" class="form-label">Parfum</label>
                    <select class="form-select" id="parfum" name="parfum" required>
                        <option value="">Choisir un parfum...</option>
                        <%
                            for(Parfum parf : parfums) {
                        %>
                            <option value="<%= parf.getId() %>"><%= parf.getNom() %></option>
                        <%
                            }
                        %>
                    </select>
                    <div class="invalid-feedback">
                        Veuillez sélectionner un parfum
                    </div>
                </div>
            </div>
            
            <div class="text-end">
                <button type="submit" class="btn btn-primary">Rechercher</button>
            </div>
        </form>
    </div>
</div>

<!-- Affichage des résultats -->
<% if(request.getMethod().equals("POST") && !resultats.isEmpty()) { %>
<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-4">
    <div class="h-100 bg-light rounded p-4">
        <h6 class="mb-4">Pâtisseries vendues correspondant aux critères</h6>
        <div class="alert alert-info" role="alert">
            Les pâtisseries affichées ci-dessous sont celles qui ont déjà été vendues au moins une fois.
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nom de la Pâtisserie</th>
                        <th scope="col">Prix Unitaire</th>
                        <th scope="col">Statut</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Patisserie pat : resultats) { %>
                    <tr>
                        <td><%= pat.getId() %></td>
                        <td><%= pat.getNomPatisserie() %></td>
                        <td><%= pat.getPrixUnite() %> €</td>
                        <td><span class="badge bg-success">Vendue</span></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<% } else if(request.getMethod().equals("POST")) { %>
<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-4">
    <div class="alert alert-info" role="alert">
        Aucune pâtisserie vendue trouvée pour ces critères.
    </div>
</div>
<% } %>

<script>
// Form validation script
(function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }
            form.classList.add('was-validated')
        }, false)
    })
})()
</script>