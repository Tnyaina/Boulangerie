package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mapping.BddObject;
import model.Vente;

@WebServlet(name = "InsertionVenteServlet", urlPatterns = {"/InsertionVenteServlet"})
public class InsertionVenteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Récupération des paramètres du formulaire
        String nomClient = request.getParameter("nomClient");
        String idPatisserie = request.getParameter("idPatisserie");

        try {
            // Création et insertion de la vente
            Vente vente = new Vente(nomClient, idPatisserie);
            BddObject.insertInDatabase(vente, null);
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp?page=vente/insertVente");
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
        return "Servlet pour l'insertion des ventes";
    }
}