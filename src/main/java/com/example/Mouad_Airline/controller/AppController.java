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
public class AppController {


    @Autowired
    private BookingsService bookingService;

    @Autowired
    private FlightService flightService;

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



