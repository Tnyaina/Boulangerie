<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Produit> produits = BddObject.find(new Produit(), null);
    List<Category> categories = BddObject.find(new Category(), null);
    List<Patisserie> resultats = new ArrayList<Patisserie>();
    
    // Traitement du formulaire
    if(request.getMethod().equals("POST")) {
        String categoryId = request.getParameter("category");
        String productId = request.getParameter("product");
        
        if(categoryId != null && !categoryId.isEmpty() && productId != null && !productId.isEmpty()) {
            Category selectedCategory = new Category();
            selectedCategory.setId(categoryId);
            selectedCategory = BddObject.findById(selectedCategory, null);
            
            Produit selectedProduct = new Produit();
            selectedProduct.setId(productId);
            selectedProduct = BddObject.findById(selectedProduct, null);
            
            if(selectedCategory != null && selectedProduct != null) {
                Patisserie patisserie = new Patisserie();
                resultats = patisserie.getPatisserieByProd(selectedCategory, selectedProduct);
            }
        }
    }
%>

<div>
    <h3>Rechercher les patisseries</h3>
</div>

<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mx-auto ml-auto">
    <div class="h-100 bg-light rounded p-4">
        <div class="d-flex flex-row justify-content-between mb-4">    
            <h6 class="mb-0">Sélection des produits</h6>
        </div>
        
        <form action="" method="post" class="needs-validation" novalidate>
            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label for="category" class="form-label">Catégorie de patisseries</label>
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
                    <label for="product" class="form-label">Ingredients</label>
                    <select class="form-select" id="product" name="product" required>
                        <option value="">Choisir un produit...</option>
                        <%
                            for(Produit prod : produits) {
                        %>
                            <option value="<%= prod.getId() %>">
                                <%= prod.getNomProduit() %> (<%= prod.getMyUnite().getNomUnite() %>)
                            </option>
                        <%
                            }
                        %>
                    </select>
                    <div class="invalid-feedback">
                        Veuillez sélectionner un produit
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
        <h6 class="mb-4">Résultats de la recherche</h6>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nom de la Patisserie</th>
                        <th scope="col">Prix Unitaire</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Patisserie pat : resultats) { %>
                    <tr>
                        <td><%= pat.getId() %></td>
                        <td><%= pat.getNomPatisserie() %></td>
                        <td><%= pat.getPrixUnite() %> €</td>
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
        Aucune patisserie trouvée pour ces critères.
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