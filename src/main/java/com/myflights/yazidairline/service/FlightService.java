package com.myflights.yazidairline.service;

import com.myflights.yazidairline.Entity.Flight;
import com.myflights.yazidairline.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class FlightService {
    @Autowired
    private FlightRepository repo;

    public void SaveFlight(Flight flight) {
        repo.saveAndFlush(flight);
    }

   
    public List<Flight> findFlights(String origin, String dest) {
        return repo.findByOriginAndDest(origin,dest);
    }
    public Flight findFlightById(int flid) {
        return repo.findByFlid(flid);
    }


}
