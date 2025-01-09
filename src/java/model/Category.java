package model;

import annoted.ColumnField;
import annoted.TableAnnotation;
import mapping.BddObject;

@TableAnnotation(nameTable = "category", sequence = "cat_seq", prefix = "CAT_")
public class Category {
    @ColumnField(column = "idCategory", is_increment = true, primary_key = true)
    private String id;
    
    @ColumnField(column = "nomCategory")
    private String nomCategory;

    // Constructeurs
    public Category() {
    }

    public Category(String nomCategory) {
        this.setNomCategory(nomCategory);
    }

    // Getters et Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNomCategory() {
        return nomCategory;
    }

    public void setNomCategory(String nomCategory) {
        this.nomCategory = nomCategory;
    }
}