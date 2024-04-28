package com.myflights.yazidairline.controller;

import com.myflights.yazidairline.Entity.Flight;
import com.myflights.yazidairline.response.ObjectResponse;
import com.myflights.yazidairline.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.io.*;
import java.util.*;
import java.util.List;


@RestController
public class AppController {

    @Autowired
    private FlightService flightService;



        @GetMapping("/find-flights/{origin}/{dest}") // find-flights/JFK/CLT/12-10-2023        /find-flights?org=JFK&dest=CLT&date=12-10-2023
        public ResponseEntity<ObjectResponse>findFlights(@PathVariable() String origin, @PathVariable() String dest){
            ObjectResponse resp =  new ObjectResponse();
            try {
                // List<Flight> flights = flightService.findFlightsByDate( origin, dest, date);
                List<Flight> flights = flightService.findFlights( origin, dest);
                resp.setResponseData(flights);
                resp.setStatusCode(HttpStatus.OK);
                resp.setMessageType("SUCCESS");
                //return flights;
            } catch (Exception ex){
                resp.setStatusCode(HttpStatus.BAD_REQUEST);
                resp.setMessage("Error occured on the server");
                resp.setMessageType("ERROR");
                ex.printStackTrace();
            }
            return new ResponseEntity<ObjectResponse>(resp, resp.getStatusCode());
        }}
