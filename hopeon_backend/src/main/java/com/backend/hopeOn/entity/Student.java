package com.backend.hopeOn.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity(name = "student")
public class Student extends AbstractEntity{

    @Column(name = "reg_no")
    private String regNo;
    @Column(name = "full_name")
    private String fullName;
    @Column(name = "grade")
    private String grade;
    @Column(name = "student_class")
    private String studentClass;
    @Column(name = "parent_name")
    private String parentName;
    @Column(name = "contact_no")
    private String contactNo;
    @Column(name = "gender")
    private String gender;
    @Column(name = "age")
    private String age;
    @Column(name = "location")
    private String location;
    @Column(name = "image_url")
    private String imageUrl;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "vehicle_id", referencedColumnName ="id")
    private Vehicle vehicle;
}
