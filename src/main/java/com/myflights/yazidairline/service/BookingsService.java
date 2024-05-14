package com.myflights.yazidairline.service;

import com.myflights.yazidairline.Entity.Bookings;
import com.myflights.yazidairline.repository.BookingsRepository;
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