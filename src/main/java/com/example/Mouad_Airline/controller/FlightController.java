package com.example.Mouad_Airline.controller;

import com.example.Mouad_Airline.Entity.Bookings;
import com.example.Mouad_Airline.Entity.Flight;
import com.example.Mouad_Airline.response.ObjectResponse;
import com.example.Mouad_Airline.service.BookingsService;
import com.example.Mouad_Airline.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@RestController
public class FlightController {



    @Autowired
    private FlightService flightService;
    @GetMapping("/find-flights/")
    public List<Flight> findAllFlights() {
        return flightService.findAllFlights();
    }

    @GetMapping("/find-flights/{origin}/{dest}")
    // find-flights/JFK/CLT/12-10-2023        /find-flights?org=JFK&dest=CLT&date=12-10-2023
    public List<Flight> findFlights(@PathVariable() String origin, @PathVariable() String dest) {
        try {
            return flightService.findFlights(origin, dest);
        } catch (Exception ex) {
            ex.printStackTrace();
            // You might want to handle this exception more gracefully, for example by returning an empty list
            return new ArrayList<>();
        }
    }


}



