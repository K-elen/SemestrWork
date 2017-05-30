package service;


import model.UserForm;
import model.Link;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import repository.LinkRepository;


@Service
public class LinkService {

    @Autowired
    private LinkRepository linkRepository;


    public void addNewLink(Link link) {
        UserForm userForm = (UserForm) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        link.setLogin(userForm.getLogin());
        linkRepository.save(link);
    }
}
