package com.myflights.yazidairline.repository;
import com.myflights.yazidairline.Entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterRepository extends JpaRepository<Users, Integer> {
}
