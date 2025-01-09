package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import mapping.BddObject;

@TableAnnotation(nameTable = "parfum", sequence = "parf_seq", prefix = "PRF_")
public class Parfum {
    @ColumnField(column = "idParfum", is_increment = true, primary_key = true)
    private String id;
    
    @ColumnField(column = "Nom")
    private String nom;
    
    // Constructors
    public Parfum() {
    }
    
    public Parfum(String nom) {
        this.setNom(nom);
    }
    
    // Getters and Setters
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
}