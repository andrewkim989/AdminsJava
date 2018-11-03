package com.andrewkim.admindashboard.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.andrewkim.admindashboard.models.User;
import com.andrewkim.admindashboard.services.UserService;
import com.andrewkim.admindashboard.validator.UserValidator;

@Controller
public class UserController {
	private UserService userService;
	private UserValidator userValidator;
    
    public UserController (UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }
    
    @RequestMapping("/login")
    public String start(Model model, @RequestParam(value="error", required=false) String error,
    		@RequestParam(value="logout", required=false) String logout) {
    	if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        
        return "login.jsp";
    }
    
    @RequestMapping("/register")
    public String register(@Valid @ModelAttribute("user") User user) {
        return "register.jsp";
    }
	
	@PostMapping("/register")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result,
    		Model model) {
		userValidator.validate(user, result);
		
        if (result.hasErrors()) {
            return "register.jsp";
        }
        
        List <User> allUsers = userService.allUser();
        boolean adminExists = false;
        
        for (int i = 0; i < allUsers.size(); i++) {
        	User u = allUsers.get(i);
        	if (u.getRoles().get(0).getName().equals("ROLE_ADMIN")) {
        		adminExists = true;
        	}
        }

        if (!adminExists) {
        	userService.saveUserWithAdminRole(user);
        	return "redirect:/";
        }
        else {
        	userService.saveWithUserRole(user);
            return "redirect:/";
        }
    }
	
	@RequestMapping(value = {"/", "/dashboard"})
    public String home(Principal principal, Model model) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        
        Date date = user.getCreatedAt();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String time = sdf.format(date);
		model.addAttribute("time", time);
		
		String t = new SimpleDateFormat("MM/dd/yyyy; hh:mm:ss a").format(Calendar.getInstance().getTime());
		model.addAttribute("t", t);
        return "home.jsp";
    }
    
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
    	String name = principal.getName();
		User user = userService.findByUsername(name);
        model.addAttribute("user", user);
        List <User> everyone = userService.allUser();
        model.addAttribute("everyone", everyone);
        return "admin.jsp";
    }
    
    @RequestMapping("/admin/{id}/delete")
    public String deleteAccount(@PathVariable("id") Long id) {
    	userService.deleteAccount(id);
    	return "redirect:/admin";
    }
    
    @RequestMapping("/admin/{id}/makeAdmin")
    public String makeAdmin(@PathVariable("id") Long id) {
    	User user = userService.findUserById(id);
    	userService.userToAdmin(user);
    	return "redirect:/admin";
    }
}
