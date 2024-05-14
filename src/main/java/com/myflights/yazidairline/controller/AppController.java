package com.myflights.yazidairline.controller;

import com.myflights.yazidairline.Entity.Bookings;
import com.myflights.yazidairline.Entity.Flight;
import com.myflights.yazidairline.response.ObjectResponse;
import com.myflights.yazidairline.service.BookingsService;
import com.myflights.yazidairline.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.util.*;
import java.util.List;


@RestController
public class AppController {

    @Autowired
    private FlightService flightService;

    @Autowired
    private BookingsService bookingService;


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

    @PostMapping("/save-booking")
    // find-flights/JFK/CLT/12-10-2023        /find-flights?org=JFK&dest=CLT&date=12-10-2023
    public ResponseEntity<ObjectResponse>findFlights( @RequestBody Bookings booking ){
        ObjectResponse resp = new ObjectResponse();
        try {
            // List<Flight> flights = flightService.findFlightsByDate( origin, dest, date);

            Flight flight = flightService.findFlightById(booking.getFlid());

            if (flight != null) {

                booking.setAmount(flight.getCost());
                booking.setDest(flight.getDest());
                booking.setOrigin(flight.getOrigin());
                booking.setTravelDate(flight.getDepartureDate());
            bookingService.saveBooking(booking);

            resp.setStatusCode(HttpStatus.OK);
            resp.setMessageType("SUCCESS");
            resp.setMessage("booking saved to database");
            }else {
                resp.setStatusCode(HttpStatus.BAD_REQUEST);
                resp.setMessage("flight not found");
                resp.setMessageType("ERROR");
            }
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



