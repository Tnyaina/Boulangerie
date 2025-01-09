package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import mapping.BddObject;

@TableAnnotation(nameTable = "vente", sequence = "vente_seq", prefix = "VNT_")
public class Vente {
    @ColumnField(column = "idVente", is_increment = true, primary_key = true)
    private String id;
    
    @ColumnField(column = "NomClient")
    private String nomClient;
    
    @ColumnField(column = "idPatisserie")
    private String idPatisserie;
    
    private Patisserie patisserie;

public Vente(String nomClient, String idPatisserie) {
    this.setNomClient(nomClient);
    this.setIdPatisserie(idPatisserie);
}

    // Constructors
    public Vente() {
    }


    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNomClient() {
        return nomClient;
    }

    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
    }

    public String getIdPatisserie() {
        return idPatisserie;
    }

    public void setIdPatisserie(String idPatisserie) {
        this.idPatisserie = idPatisserie;
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
}