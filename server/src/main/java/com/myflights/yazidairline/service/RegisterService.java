package com.myflights.yazidairline.service;

import com.myflights.yazidairline.Entity.Users;
import com.myflights.yazidairline.repository.RegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterService {
    @Autowired
    private RegisterRepository repo;

    public void saveUsers(Users user) {
        repo.saveAndFlush(user);
    }
}
