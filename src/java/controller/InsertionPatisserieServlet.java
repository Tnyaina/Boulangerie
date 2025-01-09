package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;  

import mapping.BddObject;
import model.*;

@WebServlet(name = "InsertionPatisserieServlet", urlPatterns = {"/InsertionPatisserieServlet"})
public class InsertionPatisserieServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
        try {
            // Récupération des paramètres du formulaire
            String nomPatisserie = request.getParameter("nomPatisserie");
            Double prixUnite = Double.parseDouble(request.getParameter("prixUnite"));
            String parfumId = request.getParameter("parfums");
            String categoryId = request.getParameter("category");
            String[] produitsId = request.getParameterValues("produits");

            // Création et insertion de la pâtisserie
            Patisserie patisserie = new Patisserie(nomPatisserie, prixUnite);
            String patisserieId = BddObject.insertInDatabase(patisserie, null);

            // Insertion de la relation patisserie-parfum
            PatParfum patParfum = new PatParfum(patisserieId, parfumId);
            BddObject.insertInDatabase(patParfum, null);

            // Insertion des relations patisserie-ingredients pour chaque produit sélectionné
            if(produitsId != null) {
                for(String produitId : produitsId) {
                    // Création d'un nouvel ingrédient pour chaque produit
                    Ingredient ingredient = new Ingredient(patisserieId, produitId);
                    BddObject.insertInDatabase(ingredient, null);
                }
            }
            
            // Insertion de la relation patisserie-category
            PatisserieCategory patCategory = new PatisserieCategory(patisserieId, categoryId);
            BddObject.insertInDatabase(patCategory, null);
            
            request.setAttribute("success", "Pâtisserie et ses ingrédients ajoutés avec succès!");
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Le prix doit être un nombre valide");
        } catch (Exception e) {
            request.setAttribute("error", "Erreur lors de l'insertion: " + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp?page=patisserie/insertPatisserie");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet pour l'insertion des pâtisseries et leurs ingrédients";
    }
}