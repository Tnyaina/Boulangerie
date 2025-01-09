/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import mapping.BddObject;

/**
 *
 * @author rango
 */

@TableAnnotation(nameTable = "produit", sequence = "prod_seq", prefix = "PROD_")
public class Produit {
    @ColumnField(column = "idProduit", is_increment = true, primary_key = true)
    private String id;
    
    @ColumnField(column = "nomProduit")
    private String nomProduit;
    
    @ColumnField(column = "idUnite")
    private String idUnite;
    
    private Unite myUnite;


    public Produit(String nomProduit, String idUnite) {
        this.setNomProduit(nomProduit);
        this.setIdUnite(idUnite);
    }

    public Produit() {
    }
    
    // GETTERS AND SETTERS
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNomProduit() {
        return nomProduit;
    }

    public void setNomProduit(String nomProduit) {
        this.nomProduit = nomProduit;
    }

    public String getIdUnite() {
        return idUnite;
    }

    public void setIdUnite(String idUnite) {
        this.idUnite = idUnite;
    }

    public Unite getMyUnite() throws Exception{
        if(this.getIdUnite() == null) return null;
        try {
            Unite u = new Unite();
            u.setId(this.getIdUnite());
            u = BddObject.findById(u, null);
            return u;
        } catch (Exception e) {
            throw new Exception("Erreur sur fonction getMyUnite. Error: " + e.getMessage());
        }
    }

    public void setMyUnite(Unite myUnite) {
        this.myUnite = myUnite;
    }


}
