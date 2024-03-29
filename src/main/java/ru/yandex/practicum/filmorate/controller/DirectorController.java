package ru.yandex.practicum.filmorate.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.yandex.practicum.filmorate.model.Director;
import ru.yandex.practicum.filmorate.service.DirectorService;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/directors")
@Slf4j
public class DirectorController {

    private final DirectorService directorService;

    @Autowired
    public DirectorController(DirectorService directorService) {
        this.directorService = directorService;
    }

    @GetMapping("/{id}")
    public Director getDirectorById(@PathVariable long id) {
        log.info("Get director id={}", id);
        return directorService.get(id);
    }

    @GetMapping()
    public List<Director> getDirectors() {
        return directorService.getAll();
    }

    @PostMapping
    public Director createDirector(@Valid @RequestBody Director director) {
        log.info("Post director");
        return directorService.create(director);
    }

    @PutMapping
    public Director updateDirector(@Valid @RequestBody Director director) {
        log.info("Put director id={}", director.getId());
        return directorService.update(director);
    }

    @DeleteMapping("/{id}")
    public void deleteDirector(@PathVariable long id) {
        log.info("Delete director id={}", id);
        directorService.delete(id);
    }




}
