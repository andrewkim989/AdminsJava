package com.andrewkim.admindashboard.validator;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.andrewkim.admindashboard.models.User;
import com.andrewkim.admindashboard.repositories.UserRepository;

@Component
public class UserValidator implements Validator {
	private final UserRepository userRepository;
	
	public UserValidator (UserRepository userRepository) {
        this.userRepository = userRepository;
    }
	@Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        List <User> allusers = userRepository.findAll();
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "Match");
        }
        for (int i = 0; i < allusers.size(); i++) {
        	String name = allusers.get(i).getUsername();
        	if (name.equals(user.getUsername())) {
        		errors.rejectValue("username", "UserIsAlreadyThere");
        	}
        }
    }
}
