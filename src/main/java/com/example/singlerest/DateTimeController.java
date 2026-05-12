package com.example.singlerest;

import java.time.LocalDateTime;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DateTimeController {

    @GetMapping("/datetime")
    public String getDateTime() {
        return LocalDateTime.now().toString();
    }
}
