package com.example.prjjsp20241022.dto;

import lombok.Data;
import org.apache.ibatis.annotations.Insert;

import java.time.LocalDateTime;

@Data
public class Board {
    private Insert id;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime inserted;
}