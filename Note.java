package com.entities;

import java.time.LocalDate;
import java.util.Date;
import java.util.Random;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="Notes")
public class Note {
	@Id
	private int id;
	private String title;
	@Column(length = 1500)			//we keep length of content 1500 so that we can store 1500 words otherwise it will be 255 by default
	private String content;
	private LocalDate addedDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDate getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(LocalDate addedDate) {
		this.addedDate = addedDate;
	}
	
	public Note(String title, String content, LocalDate addedDate) {
		super();
		this.id = new Random().nextInt(100000);
		this.title = title;
		this.content = content;
		this.addedDate = addedDate;
	}
	
	
}
