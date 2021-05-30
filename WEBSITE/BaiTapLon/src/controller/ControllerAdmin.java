package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.CommonDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.AcountDao;
import dao.BillDao;
import dao.BillinfoDao;
import dao.ProductCategoryDao;
import dao.ProductDao;
import model.Account;
import model.Product;
@Controller
@RequestMapping(value = "/admin")
public class ControllerAdmin {
	@Autowired
	AcountDao account;
	@Autowired
	ProductDao pdao;
	@Autowired
	ProductCategoryDao pcdao;

	@RequestMapping(value="")
	public String admin(ModelMap mm,HttpSession session) {
		System.out.println(session.getAttribute("level"));
		if(session.getAttribute("level")!=null && Integer.parseInt(session.getAttribute("level")+"")==2) {
			mm.put("listsp",pdao.getAllProd());
			return "admin";
		}else {
			return "redirect:/admin/login";
		}
	}
	
	
	@RequestMapping(value="/login")
	public String login(HttpSession session) {
		if(session.getAttribute("level")!=null) {
			return "redirect:/admin";
		}else {
			return "login";
		}
		
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String DangNhap(ModelMap mm, HttpSession session, @RequestParam String username,@RequestParam String password,HttpServletRequest request){
		String user=username;
		String pass=password;
		int i=0;
		for(Account a: account.getAllAccount()) {
			if(a.getLevel()==2) {
				if(a.getName().equals(user) && a.getPass().equals(pass)) {
					session = request.getSession(true);
					session.setAttribute("level", a.getLevel());
					i++;
				}
			}
		}
		if(i!=0) {
			return "redirect:/admin";
		}
		else {
			mm.put("loi",1);
			return "login";
		}
		
	}
	
	
	
			
	
	
}
