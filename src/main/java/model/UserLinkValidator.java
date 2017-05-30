package model;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserLinkValidator implements Validator {
    @Override
    public boolean supports(Class aClass) {
        return Link.class.equals(aClass);
    }

    @Override
    public void validate(Object obj, Errors errors) {
        Link a = (Link) obj;


        //Ругялярка линка
        String UserLink = a.getLink();
        Pattern pattern = Pattern.compile("((https://)|(http://)|(www.)|(\\s))+(soundcloud.com/)+[a-zA-Z0-9\\-\\.]+(/)+[a-zA-Z0-9\\-\\.]+((/)+[a-zA-Z0-9\\-\\.]+)*");
        Matcher matcher = pattern.matcher(UserLink);
        boolean b = matcher.matches();

        //Ругялярка названия
        String UserTitle = a.getTitle();
        Pattern pattern2 = Pattern.compile("\\w*");
        Matcher matcher2 = pattern2.matcher(UserTitle);
        boolean d = matcher2.matches();


        ValidationUtils.rejectIfEmpty(errors, "title", "Empty.field");
        ValidationUtils.rejectIfEmpty(errors, "link", "Empty.field");

        System.out.println(a.getTitle());


        if (!d) {
            errors.rejectValue("title", "Invalid.title");
        }
        if (!b) {
            errors.rejectValue("link", "Invalid.link");
        }


    }

}
