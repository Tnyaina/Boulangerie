package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import mapping.BddObject;

@TableAnnotation(nameTable = "pat_parfum", sequence = "pat_parf_seq", prefix = "PPF_")
public class PatParfum {
    @ColumnField(column = "idPat_parfum", is_increment = true, primary_key = true)
    private String id;
    
    @ColumnField(column = "idPatisserie")
    private String idPatisserie;
    
    @ColumnField(column = "idParfum")
    private String idParfum;
    
    private Patisserie patisserie;
    private Parfum parfum;
    
    // Constructors
    public PatParfum() {
    }
    
    public PatParfum(String idPatisserie, String idParfum) {
        this.setIdPatisserie(idPatisserie);
        this.setIdParfum(idParfum);
    }
    
    // Getters and Setters
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
    
    public String getIdParfum() {
        return idParfum;
    }
    
    public void setIdParfum(String idParfum) {
        this.idParfum = idParfum;
    }
    
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
    
    public Parfum getParfum() throws Exception {
        if(this.getIdParfum() == null) return null;
        try {
            Parfum p = new Parfum();
            p.setId(this.getIdParfum());
            p = BddObject.findById(p, null);
            return p;
        } catch (Exception e) {
            throw new Exception("Erreur sur fonction getParfum. Error: " + e.getMessage());
        }
    }
    
    public void setParfum(Parfum parfum) {
        this.parfum = parfum;
    }
}