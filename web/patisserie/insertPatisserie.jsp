<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insertion d'une pâtisserie</title>
    <style>
        .error { color: red; margin-bottom: 10px; }
        .success { color: green; margin-bottom: 10px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"],
        input[type="number"],
        select { width: 300px; padding: 5px; }
        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover { background-color: #45a049; }
        select[multiple] { height: 100px; }
    </style>
</head>
<body>
    <h1>Insertion d'une nouvelle pâtisserie</h1>
    
    <% if(request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>
    
    <% if(request.getAttribute("success") != null) { %>
        <div class="success"><%= request.getAttribute("success") %></div>
    <% } %>
    
    <%
        // Récupérer la liste des parfums disponibles
        Parfum parfumTemp = new Parfum();
        List<Parfum> parfums = BddObject.find(parfumTemp, null);
        List<Category> category = BddObject.find(new Category(), null);
    %>
    
    <form action="InsertionPatisserieServlet" method="POST">
        <div class="form-group">
            <label for="nomPatisserie">Nom de la pâtisserie :</label>
            <input type="text" id="nomPatisserie" name="nomPatisserie" required>
        </div>
        
        <div class="form-group">
            <label for="prixUnite">Prix unitaire :</label>
            <input type="number" id="prixUnite" name="prixUnite" step="0.01" min="0" required>
        </div>
        
        <div class="form-group">
            <label for="parfums">Parfums  :</label>
            <select name="parfums" id="parfums"  required>
                <% for(Parfum parfum : parfums) { %>
                    <option value="<%= parfum.getId() %>"><%= parfum.getNom() %></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
    <label for="category">Catégorie :</label>
    <select name="category" id="category" required>
        <% for(Category cat : category) { %>
            <option value="<%= cat.getId() %>"><%= cat.getNomCategory() %></option>
        <% } %>
    </select>
</div>
        
        <button type="submit">Enregistrer</button>
    </form>
    
    <p><a href="home.jsp">Retour à l'accueil</a></p>
</body>
</html>