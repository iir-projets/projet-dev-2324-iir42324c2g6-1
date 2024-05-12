package com.example.Mouad_Airline.service;

import com.example.Mouad_Airline.Entity.Bookings;
import com.example.Mouad_Airline.repository.BookingsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingsService {

    @Autowired
    private BookingsRepository repo;


    public void saveBooking(Bookings booking){
        repo.saveAndFlush(booking);
    }

}