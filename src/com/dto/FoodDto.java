package com.dto;

public class FoodDto {

	private int fno;
	private String fname;
	private String nationid;
	private String cookingid;
	private String recipe;
	private String ingredients;
	private String imgdir;
	private String cooking; // JOIN

	public FoodDto() {
		super();
	}

	public FoodDto(int fno, String fname, String nationid, String cookingid,
			String recipe, String ingredients, String imgdir) {
		this.fno = fno;
		this.fname = fname;
		this.nationid = nationid;
		this.cookingid = cookingid;
		this.recipe = recipe;
		this.ingredients = ingredients;
		this.imgdir = imgdir;
	}
	// JOIN
	public FoodDto(int fno, String fname, String cooking) {
		super();
		this.fno = fno;
		this.fname = fname;
		this.cooking = cooking;
	}

	// JOIN
	public String getCooking() {
		return cooking;
	}
	public void setCooking(String cooking) {
		this.cooking = cooking;
	}
	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getNationid() {
		return nationid;
	}

	public void setNationid(String nationid) {
		this.nationid = nationid;
	}

	public String getCookingid() {
		return cookingid;
	}

	public void setCookingid(String cookingid) {
		this.cookingid = cookingid;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getImgdir() {
		return imgdir;
	}

	public void setImgdir(String imgdir) {
		this.imgdir = imgdir;
	}

}
