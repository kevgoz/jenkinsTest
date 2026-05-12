package com.example.singlerest.services;

import org.springframework.stereotype.Service;

@Service
public class DateTimeControllerService {

    public String getDateTime() {

        System.out.print("hoa");
      return java.time.LocalDateTime.now().toString();
    }
}
