/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.util.List;
import mapping.BddObject;
import model.Produit;
import model.Unite;

/**
 *
 * @author aram
 */
public class Main {
    public static void main(String[] args) throws Exception{
        System.out.println("Hello again JAVA");
        
        try {
            Unite unite = new Unite();
            unite.setNomUnite("l");
            unite.setId("u2");
            
            // LISTE DES UNITE
//            List<Unite> unites = BddObject.find(unite, null);
//            for(Unite u : unites)
//            {
//                System.out.println("Nom: " + u.getNomUnite());
//            }
            

             // unite by id (Obligatoire on set le primary key)
             
//             Unite u1 = BddObject.findById(unite, null);
//             System.out.println("Nom: " + u1.getNomUnite());

            // Liste des produits
//            List<Produit> produits = BddObject.find(new Produit(), null);
//            System.out.println("List size: " + produits.size());
//            for(Produit p : produits){
//                System.out.println("Nom: " + p.getNomProduit() + " en " + p.getMyUnite().getNomUnite());
//            }

            // Insertion
            Produit insert = new Produit("Lait", "u2");
            String newId = BddObject.insertInDatabase(insert, null);
            
            System.out.println("New ID: " + newId);
            
            
        } catch (Exception e) {
            System.out.println("error in main: " + e.getMessage());
        }
    }
}
