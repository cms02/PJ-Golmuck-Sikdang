package com.dto;

public class PopularityDto {
	private int fno;
	private int mno;
	private int mage;
	private int count;
	private String nation;
	private String mgender;

	//
	private int rank;
	private String fname;
	private String imgdir;
	//

	public PopularityDto(int fno, int mno, int mage, String mgender) {
		this.fno = fno;
		this.mno = mno;
		this.mage = mage;
		this.mgender = mgender;
	}

	public PopularityDto(int rank, String fname, String imgdir, String nation, int count) {
		this.count = count;
		this.nation = nation;
		this.rank = rank;
		this.fname = fname;
		this.imgdir = imgdir;
	}

	public PopularityDto(int fno, int count, int rank, String fname, String imgdir, String nation) {
		super();
		this.fno = fno;
		this.count = count;
		this.nation = nation;
		this.rank = rank;
		this.fname = fname;
		this.imgdir = imgdir;
	}

	public int getRank() {
		return rank;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getImgdir() {
		return imgdir;
	}

	public void setImgdir(String imgdir) {
		this.imgdir = imgdir;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public PopularityDto() {
		super();
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getMage() {
		return mage;
	}

	public void setMage(int mage) {
		this.mage = mage;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

}
