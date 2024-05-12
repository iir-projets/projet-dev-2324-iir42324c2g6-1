package com.example.Mouad_Airline.repository;

import com.example.Mouad_Airline.Entity.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date; // Import Date class for using Date type in methods
import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Integer> {

 // Method to find a flight by origin, destination, and departure date
 Flight findByOriginAndDestAndDepartureDate(String origin, String dest, String departureDate);

 // Method to find flights within a date range
 List<Flight> findByDepartureDateBetween(String startDate, String endDate);

 // Method to find flights by origin and destination
 List<Flight> findByOriginAndDest(String origin, String dest);

 // Method to find a flight by flight ID
 Flight findByFlid(Integer flid);
 List<Flight> findAll();
}
