package com.myflights.yazidairline.Entity;

import jakarta.persistence.*;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

@Entity
@Table(name = "flights")
public class Flight  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer fl_id;

    @Column(name = "depart_location")
    private String origin;

    @Column(name = "dest_locaion")
    private String dest;


    @Column(name = "flight_date")
    private String departureDate;

    @Column(name = "depart_time")
    private String departureTime;

    @Column(name = "cost")
    private String cost;

    @Column(name = "aircraft")
    private String aircraft;

    public Integer getFl_id() {
        return fl_id;
    }

    public void setFl_id(Integer fl_id) {
        this.fl_id = fl_id;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDest() {
        return dest;
    }

    public void setDest(String dest) {
        this.dest = dest;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getAircraft() {
        return aircraft;
    }

    public void setAircraft(String aircraft) {
        this.aircraft = aircraft;
    }


}
