package com.myflights.yazidairline.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "airport")
public class Airport {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Integer flight_id;

        @Column(name = "flight_code")
        private String airportCode;

        @Column(name = "airport_long_name")
        private String longName;


        @Column(name = "airport_description")
        private String description;


        @Column(name = "location_zip")
        private String zipCode;

        @Column(name = "country")
        private String country;

        @Column(name = "city")
        private String city;

    public Integer getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(Integer flight_id) {
        this.flight_id = flight_id;
    }

    public String getAirportCode() {
        return airportCode;
    }

    public void setAirportCode(String airportCode) {
        this.airportCode = airportCode;
    }

    public String getLongName() {
        return longName;
    }

    public void setLongName(String longName) {
        this.longName = longName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
