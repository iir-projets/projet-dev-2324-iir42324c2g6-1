package com.example.Mouad_Airline.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "flights")
public class Flight  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer flid;

    @Column(name = "origin")
    private String origin;

    @Column(name = "dest")
    private String dest;

    @Column(name = "flight_date")
    private String departureDate;

    @Column(name = "depart_time")
    private String departureTime;

    @Column(name = "cost")
    private String cost;

    @Column(name = "aircraft")
    private String aircraft;

    @Column(name = "departure_airport_code")
    private String departureAirportCode;

    @Column(name = "arrival_airport_code")
    private String arrivalAirportCode;

    @Column(name = "flight_duration_minutes")
    private String flightDurationMinutes;

    @Column(name = "arrival_time")
    private String arrivalTime;

    public Integer getFlid() {
        return flid;
    }

    public void setFlid(Integer flid) {
        this.flid = flid;
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

    public String getDepartureAirportCode() {
        return departureAirportCode;
    }

    public void setDepartureAirportCode(String departureAirportCode) {
        this.departureAirportCode = departureAirportCode;
    }

    public String getArrivalAirportCode() {
        return arrivalAirportCode;
    }

    public void setArrivalAirportCode(String arrivalAirportCode) {
        this.arrivalAirportCode = arrivalAirportCode;
    }

    public String getFlightDurationMinutes() {
        return flightDurationMinutes;
    }

    public void setFlightDurationMinutes(String flightDurationMinutes) {
        this.flightDurationMinutes = flightDurationMinutes;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }
}
