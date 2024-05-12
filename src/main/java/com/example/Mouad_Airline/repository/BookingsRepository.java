package com.example.Mouad_Airline.repository;


import com.example.Mouad_Airline.Entity.Bookings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingsRepository extends JpaRepository <Bookings, Integer> {

}
