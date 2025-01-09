<%-- 
    Document   : header
    Created on : 21 déc. 2024, 18:28:22
    Author     : aram
--%>

<%--<%@page import="mapping.*"%>
<%@page import="model.*"%>--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>-->
        <!-- Spinner End -->


<!-- MENU GAUCHE START -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="home.jsp" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary">Boulangerie</h3>
        </a>
        <div class="navbar-nav w-100">
            <a href="#" class="nav-item nav-link">
                <i class="fa fa-home me-2"></i>Home
            </a> 
            
            <!-- Recherche  -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-folder me-2"></i>Recherche
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a 
                        href="home.jsp?page=recherche/filtreProd"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Patisseries (ingredient)
                    </a> 

                    <a 
                        href="home.jsp?page=recherche/filtrePat"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Patisseries (parfum)
                    </a>    
                
                </div>
                
            </div>
            
            <!-- TEMPLATE -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-folder me-2"></i>Template
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a 
                        href="home.jsp?page=template/formulaire" 
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                         Formulaire
                    </a>     
                     <a 
                        href="home.jsp?page=template/tableau"  
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Tableau
                    </a>   
                     <a 
                        href="home.jsp?page=template/graphe"  
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Graphe
                    </a>     
                </div>
            </div> 
            
            <!--EMPLOYE-->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-folder me-2"></i>Employe
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a 
                        href="home.jsp?page=employe/listeEmploye"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                         Liste
                    </a>     
                     <a 
                        href="home.jsp?page=employe/insertionEmploye"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Inserer
                    </a>      
                </div>
            </div>

            <!-- Patisserie  -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-folder me-2"></i>Patisserie
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a 
                        href="home.jsp?page=patisserie/listePatisserie"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Liste des Patisseries
                    </a>

                    <a 
                        href="home.jsp?page=patisserie/insertPatisserie"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Insertion de Patisserie
                    </a>     
                
                </div>
            </div>

               <!--PRODUIT--> 
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-folder me-2"></i>Produit
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a 
                        href="home.jsp?page=produit/listeProduit"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                         Liste
                    </a>     
                     <a 
                        href="home.jsp?page=produit/insertionProduit"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Inserer produit
                    </a>      
                </div>
            </div>

                <!-- Parfum  -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-folder me-2"></i>Parfum
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a 
                        href="home.jsp?page=parfum/listeParfum"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Liste des Parfums
                    </a>

                    <a 
                        href="home.jsp?page=parfum/insertParfum"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Insertion de Parfum
                    </a>     
                
                </div>
            </div>

            <!-- Vente  -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-folder me-2"></i>Vente
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a 
                        href="home.jsp?page=vente/listeVente"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Liste des ventes
                    </a>

                    <a 
                        href="home.jsp?page=vente/insertVente"
                        class="dropdown-item"
                    > 
                        <i class="fa fa-chevron-right me-2"></i> 
                        Insertion de vente
                    </a>     
                
                </div>
        </div>
    </nav>
</div>
<!-- MENU GAUCHE END -->


<!--  LOGOUT USER START -->
<div class="content">
    <!-- Navbar Start -->
    <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
        <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
            <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
        </a>
        <a href="#" class="sidebar-toggler flex-shrink-0">
            <i class="fa fa-bars"></i>
        </a>
        <form class="d-none d-md-flex ms-4">
            <input class="form-control border-0" type="search" placeholder="Search">
        </form>
        <div class="navbar-nav align-items-center ms-auto">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <span class="d-none d-lg-inline-flex"> User </span>
                </a>
                <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                    <a href="#" class="dropdown-item">Settings</a>
                    <a href="#" class="dropdown-item">Log Out</a>
                </div>
            </div>
        </div>
    </nav>
    <!--  LOGOUT USER START -->
    
   <!-- MODAL MATIERE PREMIERE FOR POKETRA -->
    <div class="modal fade" id="benefice" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content" >
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle"> Choisir parmi matiere_premieres : <b> </b>  </h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="btn-close"></button>
            </div>
              
            <form action="home.jsp" method="GET">
                <input type="hidden" name="page" value="poketra_by_matiere">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <select class="form-select" id="floatingSelect" name="idmatiere"
                            aria-label="Floating label select example">
                            <option selected>  </option>
                            <option>Value 1</option>
                            <option>Value 2</option>
                        </select>
                        <label for="floatingSelect"> Choisir ici ... </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"> Recherche </button>
                </div>
            </form>
        </div>
      </div>
    </div>


    <!--  div ne se ferme pas car ca continue dans hone,jsp -->