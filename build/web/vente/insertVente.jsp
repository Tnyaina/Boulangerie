<%@page import="mapping.BddObject"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Patisserie> patisseries = BddObject.find(new Patisserie(), null);
%>

<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mb-5" style="margin-left: auto; margin-right: auto">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Enregistrer une Nouvelle Vente</h6>
        <form method="POST" action="InsertionVenteServlet">
            <div class="form-floating mb-3">
                <input 
                    type="text" 
                    name="nomClient" 
                    class="form-control" 
                    id="floatingInput"
                    placeholder="Nom du client"
                    required
                >
                <label for="floatingInput">Nom du Client</label>
            </div>
            
            <div class="form-floating mt-3 mb-3">
                <select 
                    class="form-select" 
                    id="floatingSelect" 
                    name="idPatisserie"
                    aria-label="Floating label select example"
                    required
                >
                    <%
                        for(Patisserie patisserie : patisseries){ %>
                            <option value="<%= patisserie.getId() %>">
                                <%= patisserie.getNomPatisserie() %> - <%= patisserie.getPrixUnite() %> Ar
                            </option>
                        <% }
                    %>
                </select>
                <label for="floatingSelect">Pâtisserie</label>
            </div>
            
            <button type="submit" class="btn btn-primary">Enregistrer la Vente</button>
        </form>
    </div>
</div>