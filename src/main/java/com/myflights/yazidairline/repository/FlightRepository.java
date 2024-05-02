package com.myflights.yazidairline.repository;

import com.myflights.yazidairline.Entity.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Integer> {
 Flight findByOriginAndDestAndDepartureDate(String origin,String dest,String departureDate);
 Flight findByDepartureDateBetween(String startDate,String endDate);
 List<Flight> findByOriginAndDest(String origin, String dest);
Flight findByFlid(Integer flid);
}
