package com.fms.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="userdetails")
public class User {

	@Id
	@Column(name="id" , nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="username", nullable=false)
	private String username;
	
	@Column(name="password", nullable=false)
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="location")
	private String location;
	
	/*@OneToMany(cascade = CascadeType.ALL)*/
	
	//@JoinTable(joinColumns=	@JoinColumn(name="id"), inverseJoinColumns=@JoinColumn(name="feedbackId"))
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user")
	//@JoinTable(name = "feedback", joinColumns = { @JoinColumn(name = "id") }, inverseJoinColumns = { @JoinColumn(name = "feedbackId") })
	private Set<Feedback> fb = new HashSet<Feedback>();
	/*@JoinTable(name = "feedback", joinColumns = { @JoinColumn(name = "id") }, inverseJoinColumns = { @JoinColumn(name = "feedbackId") })*/
	
	
	
	public Set<Feedback> getFb() {
		return fb;
	}
	public void setFb(Set<Feedback> fb) {
		this.fb = fb;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", phone="
				+ phone + ", gender=" + gender + ", location=" + location + "]";
	}
	
	
	
	
	
}
