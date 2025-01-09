package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import database.ConnectionBase;
import mapping.BddObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.*;

@TableAnnotation(nameTable = "patisserie", sequence = "pat_seq", prefix = "PAT_")
public class Patisserie {
    @ColumnField(column = "idPatisserie", is_increment = true, primary_key = true)
    private String id;

    @ColumnField(column = "nomPatisserie")
    private String nomPatisserie;

    @ColumnField(column = "prixUnite")
    private Double prixUnite;

    private Category myCategory;
    private Produit myProduit;
    

    // Constructeurs
    public Patisserie() {
    }

    public Patisserie(String nomPatisserie, Double prixUnite) {
        this.setNomPatisserie(nomPatisserie);
        this.setPrixUnite(prixUnite);
    }

    // Getters et Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNomPatisserie() {
        return nomPatisserie;
    }

    public void setNomPatisserie(String nomPatisserie) {
        this.nomPatisserie = nomPatisserie;
    }

    public Double getPrixUnite() {
        return prixUnite;
    }

    public void setPrixUnite(Double prixUnite) {
        this.prixUnite = prixUnite;
    }

    public List<Patisserie> getPatisserieByProd(Category category, Produit produit) throws Exception {
        List<Patisserie> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT DISTINCT p.* ");
        sql.append("FROM patisserie p ");
        sql.append("JOIN patisserie_category pc ON p.idPatisserie = pc.idPatisserie ");
        sql.append("JOIN category c ON pc.idCategory = c.idCategory ");
        sql.append("JOIN ingredient i ON p.idPatisserie = i.idPatisserie ");
        sql.append("JOIN produit pr ON i.idProduit = pr.idProduit ");
        sql.append("WHERE c.idCategory = ? AND pr.idProduit = ?");
        
        ConnectionBase connectionBase = new ConnectionBase();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            connection = connectionBase.dbConnect();
            stmt = connection.prepareStatement(sql.toString());
            stmt.setString(1, category.getId());
            stmt.setString(2, produit.getId());
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Patisserie patisserie = new Patisserie();
                patisserie.setId(rs.getString("idPatisserie"));
                patisserie.setNomPatisserie(rs.getString("nomPatisserie"));
                patisserie.setPrixUnite(rs.getDouble("prixUnite"));
                list.add(patisserie);
            }
            
            return list;
        } catch (Exception e) {
            throw new Exception("Erreur lors de la recherche des patisseries: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (connection != null) connection.close();
        }
    }

    // Dans Patisserie.java - ajouter cette méthode à la classe

public List<Patisserie> getPatisserieByCategAndParfumSold(Category category, Parfum parfum) throws Exception {
    List<Patisserie> list = new ArrayList<>();
    StringBuilder sql = new StringBuilder();
    sql.append("SELECT DISTINCT p.* ");
    sql.append("FROM patisserie p ");
    sql.append("JOIN patisserie_category pc ON p.idPatisserie = pc.idPatisserie ");
    sql.append("JOIN category c ON pc.idCategory = c.idCategory ");
    sql.append("JOIN pat_parfum pp ON p.idPatisserie = pp.idPatisserie ");
    sql.append("JOIN parfum pf ON pp.idParfum = pf.idParfum ");
    sql.append("JOIN vente v ON p.idPatisserie = v.idPatisserie ");  
    sql.append("WHERE c.idCategory = ? AND pf.idParfum = ?");
    
    ConnectionBase connectionBase = new ConnectionBase();
    Connection connection = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        connection = connectionBase.dbConnect();
        stmt = connection.prepareStatement(sql.toString());
        stmt.setString(1, category.getId());
        stmt.setString(2, parfum.getId());
        
        rs = stmt.executeQuery();
        
        while (rs.next()) {
            Patisserie patisserie = new Patisserie();
            patisserie.setId(rs.getString("idPatisserie"));
            patisserie.setNomPatisserie(rs.getString("nomPatisserie"));
            patisserie.setPrixUnite(rs.getDouble("prixUnite"));
            list.add(patisserie);
        }
        
        return list;
    } catch (Exception e) {
        throw new Exception("Erreur lors de la recherche des patisseries vendues: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (connection != null) connection.close();
    }
}

    public List<Patisserie> getPatisserieByCategAndParfum(Category category, Parfum parfum) throws Exception {
        List<Patisserie> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT DISTINCT p.* ");
        sql.append("FROM patisserie p ");
        sql.append("JOIN patisserie_category pc ON p.idPatisserie = pc.idPatisserie ");
        sql.append("JOIN category c ON pc.idCategory = c.idCategory ");
        sql.append("JOIN pat_parfum pp ON p.idPatisserie = pp.idPatisserie ");
        sql.append("JOIN parfum pf ON pp.idParfum = pf.idParfum ");
        sql.append("WHERE c.idCategory = ? AND pf.idParfum = ?");
        
        ConnectionBase connectionBase = new ConnectionBase();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            connection = connectionBase.dbConnect();
            stmt = connection.prepareStatement(sql.toString());
            stmt.setString(1, category.getId());
            stmt.setString(2, parfum.getId());
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                Patisserie patisserie = new Patisserie();
                patisserie.setId(rs.getString("idPatisserie"));
                patisserie.setNomPatisserie(rs.getString("nomPatisserie"));
                patisserie.setPrixUnite(rs.getDouble("prixUnite"));
                list.add(patisserie);
            }
            
            return list;
        } catch (Exception e) {
            throw new Exception("Erreur lors de la recherche des patisseries: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (connection != null) connection.close();
        }
    }

    
}