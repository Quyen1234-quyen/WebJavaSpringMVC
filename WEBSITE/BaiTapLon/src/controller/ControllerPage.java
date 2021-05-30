package controller;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import dao.ProductCategoryDao;
import dao.ProductDao;
import model.Bill;
import model.Billinfo;
import model.Product;
import model.ProductCategory;

@Controller

public class ControllerPage {
	@Autowired
	ProductDao pdao;
	@Autowired
	ProductCategoryDao pcdao;
	List<Product> listproduct=new ArrayList<>();
	List<Billinfo> listbillinfo=new ArrayList<>();
	int i=0;
	/*Trang Chu*/
	@RequestMapping(value = "home.html", method = RequestMethod.GET)
    public String viewHome(ModelMap mm, HttpSession session,HttpServletRequest request) {
		List<Product> list=pdao.getAllProd();
		if(list==null) list=new ArrayList<>();
//		Random i= new Random();
//		while(list.size()>4) {
//			list.remove(i.nextInt(list.size()));
//		}
		mm.put("listpc",pcdao.getAllProdC());
		mm.put("listp", list);
		showMyCart(session,request);
        return "home";
    }

	/*Find Product*/
	@RequestMapping(value = "/timsp", method = RequestMethod.POST)

	public  String viewHomeByKey(ModelMap mm, HttpSession session,@RequestParam("key") String key) {
		List<Product> listp=new  ArrayList<>();
		listproduct=pdao.getAllProd();
		for(Product p:listproduct) {
			if(this.removeAccent(p.getName().toUpperCase()).startsWith(this.removeAccent(key.toUpperCase()))) {
				listp.add(p);
			}		
		}
		mm.put("listpc",pcdao.getAllProdC());
		mm.put("listp", listp);
		return "home";
	}
	@RequestMapping(value = { "/product/{id}","/product/product/{id}","product/product/product/{id}"}, method = RequestMethod.GET)
	public String viewHomeProduct(ModelMap mm, HttpSession session,@PathVariable("id") String id) {
		mm.put("listpc", pcdao.getAllProdC());
		mm.put("listp",pdao.getAllProdC(id));
		return "home";
	}
	
	@RequestMapping(value="/addsp/{id}", method = RequestMethod.GET)
	public String hello(@PathVariable("id") String id,ModelMap mm,HttpSession session,HttpServletRequest request) {
		Billinfo billinfo=new Billinfo();
		Bill bill= new Bill();
		if(i==0) {
			Random rd = new Random(); 
			int number=rd.nextInt();
			bill.setIdbill(id+number);
			i++;
			session.setAttribute("user",bill.getIdbill());
		}
		bill.setIdbill(session.getAttribute("user")+"");
		for(Product p: pdao.getAllProd()) {
			if(p.getId().equals(id)) {
				if(listbillinfo.size()>0) {
					int dem=0;
					for(Billinfo bill1:listbillinfo) {
						if(id.equals(bill1.getIdp())) {
							dem++;
							
						}
					}
					if(dem>0) {
						for(Billinfo bill2:listbillinfo) {
							if(bill2.getIdp().equals(id)) {
								bill2.setQuantity(bill2.getQuantity()+1);
							}
						}
					}else {
						
						billinfo.setIdbill(bill.getIdbill());
						billinfo.setIdp(id);
						billinfo.setQuantity(1);
						
						listbillinfo.add(billinfo);	
					}
				}
				else {
					billinfo.setIdbill(bill.getIdbill());
					billinfo.setIdp(id);
					billinfo.setQuantity(1);
					listbillinfo.add(billinfo);	
				}
			}
		}
		showMyCart(session,request);
		mm.put("listpc",pcdao.getAllProdC());
		mm.put("listp", pdao.getAllProd());
		return "home";
	}
	
	public  static String removeAccent(String s) {
		  String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		  Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		  return pattern.matcher(temp).replaceAll("");
	}
	
	
	 private void showMyCart(HttpSession session,HttpServletRequest request) {
		 session = request.getSession(true);
		 session.setAttribute("myCartNum", listbillinfo.size());
		 session.setAttribute("myShop", listbillinfo);
	 }
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*	test ajax*/
	@RequestMapping(value="/textAjax")
	public String t() {
		return "textAjax";
	}
//	@RequestMapping(value="/addsp", method = RequestMethod.POST)
//	@ResponseBody
//	public String hello() {
//		return "hello";
//	}
	
	@RequestMapping(value="/sum/{a}/{b}", method = RequestMethod.POST)
	@ResponseBody
	public  String sum(@PathVariable(value="a") int a,@PathVariable(value="b") int b) {
		return String.valueOf(a+b);
	}
	
	@RequestMapping(value="/json", method = RequestMethod.GET)
	@ResponseBody
	public Product json() {
		return new Product("1","1","1","1",1,"1");
	}
	
	@RequestMapping(value="/json2", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Product> json2() {
		ArrayList<Product> list=new ArrayList<Product>() ;
		list.add(new Product("1","1","1","1",1,"1"));
		list.add(new Product("2","1","1","1",1,"1"));
		list.add(new Product("3","1","1","1",1,"1"));
		
		return list;
	}
	
}
