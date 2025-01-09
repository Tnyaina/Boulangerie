package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import mapping.BddObject;

@TableAnnotation(nameTable = "ingredient", sequence = "ingr_seq", prefix = "INGR_")
public class Ingredient {
    @ColumnField(column = "idIngredient", is_increment = true, primary_key = true)
    private String id;
    
    @ColumnField(column = "idPatisserie")
    private String idPatisserie;
    
    @ColumnField(column = "idProduit")
    private String idProduit;
    
    private Patisserie patisserie;
    private Produit produit;

    // Constructeurs
    public Ingredient() {
    }

    public Ingredient(String idPatisserie, String idProduit) {
        this.setIdPatisserie(idPatisserie);
        this.setIdProduit(idProduit);
    }

    // Getters et Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdPatisserie() {
        return idPatisserie;
    }

    public void setIdPatisserie(String idPatisserie) {
        this.idPatisserie = idPatisserie;
    }

    public String getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(String idProduit) {
        this.idProduit = idProduit;
    }

    // Méthodes pour récupérer les objets liés
    public Patisserie getPatisserie() throws Exception {
        if(this.getIdPatisserie() == null) return null;
        try {
            Patisserie p = new Patisserie();
            p.setId(this.getIdPatisserie());
            p = BddObject.findById(p, null);
            return p;
        } catch (Exception e) {
            throw new Exception("Erreur sur fonction getPatisserie. Error: " + e.getMessage());
        }
    }

    public void setPatisserie(Patisserie patisserie) {
        this.patisserie = patisserie;
    }

    public Produit getProduit() throws Exception {
        if(this.getIdProduit() == null) return null;
        try {
            Produit p = new Produit();
            p.setId(this.getIdProduit());
            p = BddObject.findById(p, null);
            return p;
        } catch (Exception e) {
            throw new Exception("Erreur sur fonction getProduit. Error: " + e.getMessage());
        }
    }

    public void setProduit(Produit produit) {
        this.produit = produit;
    }
}