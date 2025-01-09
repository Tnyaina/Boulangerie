package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import mapping.BddObject;

@TableAnnotation(nameTable = "patisserie_category", sequence = "pat_cat_seq", prefix = "PATCAT_")
public class PatisserieCategory {
    @ColumnField(column = "idPat_Cat", is_increment = true, primary_key = true)
    private String id;
    
    @ColumnField(column = "idPatisserie")
    private String idPatisserie;
    
    @ColumnField(column = "idCategory")
    private String idCategory;
    
    private Patisserie patisserie;
    private Category category;

    // Constructeurs
    public PatisserieCategory() {
    }

    public PatisserieCategory(String idPatisserie, String idCategory) {
        this.setIdPatisserie(idPatisserie);
        this.setIdCategory(idCategory);
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

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
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

    public Category getCategory() throws Exception {
        if(this.getIdCategory() == null) return null;
        try {
            Category c = new Category();
            c.setId(this.getIdCategory());
            c = BddObject.findById(c, null);
            return c;
        } catch (Exception e) {
            throw new Exception("Erreur sur fonction getCategory. Error: " + e.getMessage());
        }
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}