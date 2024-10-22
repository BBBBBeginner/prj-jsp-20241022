package com.example.prjjsp20241022.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    // 게시물 CRUD
    // Create, Read, Update, Delete
    // C :

    // /board/new
    @GetMapping("new")
    public String newBoard() {

        // /WEB-INF/view/board/new.jsp
    }
}
