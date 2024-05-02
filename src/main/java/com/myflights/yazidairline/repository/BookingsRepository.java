package com.myflights.yazidairline.repository;


import com.myflights.yazidairline.Entity.Bookings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingsRepository extends JpaRepository <Bookings, Integer> {

}
