package com.myflights.yazidairline.repository;

import com.myflights.yazidairline.Entity.Airport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AirportRepository extends JpaRepository<Airport, Integer> {
    Airport findByAirportCode(String airportCode);
    Airport findByLongName(String longName);
}
