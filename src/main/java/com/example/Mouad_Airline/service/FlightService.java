package com.example.Mouad_Airline.service;

import com.example.Mouad_Airline.Entity.Flight;
import com.example.Mouad_Airline.repository.FlightRepository;
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

    public List<Flight> findAllFlights() {
        return repo.findAll();
    }
    public List<Flight> findFlights(String origin, String dest) {
        return repo.findByOriginAndDest(origin,dest);
    }
    public Flight findFlightById(int flid) {
        return repo.findByFlid(flid);
    }


}
