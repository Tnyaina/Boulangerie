/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import annoted.ColumnField;
import annoted.TableAnnotation;

/**
 *
 * @author rango
 */
@TableAnnotation(nameTable = "unite")
public class Unite {
   @ColumnField(column = "idUnite", primary_key = true, is_increment = false)
   private String id;
   
   @ColumnField(column = "nom")
   private String nomUnite;

    public Unite(String id, String nomUnite) {
        this.setId(id);
        this.setNomUnite(nomUnite);
    }

    public Unite() {
    }
   
   
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNomUnite() {
        return nomUnite;
    }

    public void setNomUnite(String nomUnite) {
        this.nomUnite = nomUnite;
    }

   
   
}
