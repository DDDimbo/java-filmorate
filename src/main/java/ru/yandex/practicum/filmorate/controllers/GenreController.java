package ru.yandex.practicum.filmorate.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import ru.yandex.practicum.filmorate.model.Genre;
import ru.yandex.practicum.filmorate.service.GenreService;

import java.util.Collection;

@RestController
@RequestMapping("/genres")
public class GenreController {

    private final GenreService genreService;

    public GenreController(GenreService genreService) {
        this.genreService = genreService;
    }

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Genre findGenreByID(@PathVariable(value = "id") int genreId) {
        return genreService.findGenre(genreId);
    }

    @GetMapping()
    @ResponseStatus(HttpStatus.OK)
    public Collection<Genre> findAll() {
        return genreService.findAll();
    }
}