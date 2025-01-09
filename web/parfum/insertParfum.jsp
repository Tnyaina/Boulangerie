<%-- 
    Document   : formulaire
    Created on : 21 déc. 2024, 18:29:51
    Author     : aram
--%>
<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mb-5" style="margin-left: auto; margin-right: auto">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Insert Nouveau Parfum </h6>
        <form method="POST" action="InsertionParfumServlet">
            <div class="form-floating mb-3">
                <input 
                    type="text" 
                    name="nomParfum" 
                    class="form-control" 
                    id="floatingInput"
                    placeholder="name@example.com"
                >
                <label for="floatingInput"> Nom  </label>
            </div>
            
            
            
            <button type="submit" class="btn btn-primary"> Enregistrer </button>
        </form>
    </div>
</div>