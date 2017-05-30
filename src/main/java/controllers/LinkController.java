package controllers;


import model.Link;
import model.UserForm;
import model.UserLinkValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import repository.LinkRepository;
import service.LinkService;

@Controller
public class LinkController {

    @Autowired
    private LinkRepository linkRepository;

    @Autowired
    private LinkService linkService;

    @InitBinder("link")
    protected void initUserPostBinder(WebDataBinder binder) {
        binder.setValidator(new UserLinkValidator());
    }


    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/link", method = RequestMethod.GET)
    public String newPost(ModelMap map) {
        map.put("link", new Link());
        return "new_link";
    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/link", method = RequestMethod.POST)
    public String springHandlerPost(
            RedirectAttributes redirectAttributes,
            @Validated Link link,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return "new_link";
        } else {
            System.out.println(link.getTitle());
            linkService.addNewLink(link);
            redirectAttributes.addFlashAttribute("message", "Новый плейлист добавлен");
            return "redirect:" + MvcUriComponentsBuilder.fromMappingName("LC#newPost").build();
        }
    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/pagination", method = RequestMethod.GET)
    public String pagination(ModelMap map, @RequestParam(required = false, value = "searchTerm") String searchTerm, Pageable pageable) {
        Page<Link> page;
        UserForm userForm = (UserForm) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        searchTerm = userForm.getLogin();
        page = linkRepository.findAll(searchTerm, pageable);
        map.addAttribute("page", page);
        return "links";
    }
}
