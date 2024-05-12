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
    public ResponseEntity<ObjectResponse> findFlights(@PathVariable() String origin, @PathVariable() String dest) {
        ObjectResponse resp = new ObjectResponse();
        try {
            // List<Flight> flights = flightService.findFlightsByDate( origin, dest, date);
            List<Flight> flights = flightService.findFlights(origin, dest);
            resp.setResponseData(flights);
            resp.setStatusCode(HttpStatus.OK);
            resp.setMessageType("SUCCESS");
            //return flights;
        } catch (Exception ex) {
            resp.setStatusCode(HttpStatus.BAD_REQUEST);
            resp.setMessage("Error occured on the server");
            resp.setMessageType("ERROR");
            ex.printStackTrace();
        }
        return new ResponseEntity<ObjectResponse>(resp, resp.getStatusCode());
    }



}



