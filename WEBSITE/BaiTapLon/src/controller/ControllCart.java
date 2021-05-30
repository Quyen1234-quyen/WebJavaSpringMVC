package controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.BillDao;
import dao.BillinfoDao;
import dao.ProductCategoryDao;
import dao.ProductDao;
import model.Bill;
import model.Billinfo;
import model.Product;

@Controller
@RequestMapping(value="/giohang")
public class ControllCart {
	
	@Autowired
	ProductDao pdao;
	@Autowired
	ProductCategoryDao pcdao;
	@Autowired
	BillDao billdao;
	@Autowired
	BillinfoDao billinfodao;
	
	int i=0;
	Bill bill=new Bill();
	Billinfo billinfo=new Billinfo();
	@RequestMapping(value="")

	public String GioHang(ModelMap mm, HttpSession session) {
		mm.put("listpc",pcdao.getAllProdC() );
		mm.put("listp",pdao.getAllProd());
		List<Billinfo> list =(List<Billinfo>) session.getAttribute("myShop");
		mm.put("tongtien",tongtien(list));
		mm.put("list1", list);
		session.setAttribute("listspxn",list);
		return "giohang";
	}
	@RequestMapping(value="/GiamSoLuong/{id}", method = RequestMethod.GET)
	
	public String GiamSp(ModelMap mm, HttpSession session, @PathVariable("id") String id) {
		mm.put("listpc",pcdao.getAllProdC() );
		mm.put("listp",pdao.getAllProd());
		List<Billinfo> list =(List<Billinfo>) session.getAttribute("myShop");
		
		for(Billinfo b:list) {
			if(b.getIdp().equals(id)) {
				if(b.getQuantity()>1) {
					b.setQuantity(b.getQuantity()-1);
				}
			}
		}
		
		mm.put("tongtien",tongtien(list));
		mm.put("list1", list);
		session.setAttribute("listspxn",list);	
		return "giohang";
	}
	@RequestMapping(value="/ThemSoLuong/{id}", method = RequestMethod.GET)
	public String ThemSp(ModelMap mm, HttpSession session, @PathVariable("id") String id) {
		mm.put("listpc",pcdao.getAllProdC() );
		mm.put("listp",pdao.getAllProd());
		List<Billinfo> list =(List<Billinfo>) session.getAttribute("myShop");
		for(Billinfo b:list) {
			if(b.getIdp().equals(id)) {
					b.setQuantity(b.getQuantity()+1);
					
			}
		}
		
		mm.put("tongtien",tongtien(list));
		mm.put("list1", list);
		session.setAttribute("listspxn",list);
		return "giohang";
	}
	
	@RequestMapping(value="/xoaSanPham/{id}", method = RequestMethod.GET)
	public String Xoasp(ModelMap mm, HttpSession session, @PathVariable("id") String id) {
		List<Billinfo> list =(List<Billinfo>) session.getAttribute("myShop");
		if(list.size()==1) {
			list.remove(0);
		}
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getIdp().equals(id)) {
				list.remove(i);	
			}
		}
		mm.put("tongtien",tongtien(list));
		mm.put("listpc",pcdao.getAllProdC() );
		mm.put("listp",pdao.getAllProd());
		mm.put("list1", list);
		session.setAttribute("listspxn",list);
		return "giohang";
	}
	
	@RequestMapping(value="/xacnhanmuahang", method = RequestMethod.GET)
	public String xachanmuahang(HttpSession session,@RequestParam String name,@RequestParam String email, @RequestParam String phone,@RequestParam String address) throws ParseException {
			List<Billinfo> list =(List<Billinfo>) session.getAttribute("listspxn");
			System.out.println("vao day");
			String idbill=list.get(0).getIdbill();
			System.out.println("vao day1");
			String name1=name;
			String email1=email;
			String phone1=phone;
			String address1=address;
			
			Date date =new Date();
			SimpleDateFormat dateFormat = new  SimpleDateFormat("dd/MM/yyyy"); 
			String formattedDate = dateFormat.format(date); 
			String status="0";
			bill=new Bill(list.get(0).getIdbill(), name1, address1,formattedDate, email1, phone1, status);
			billdao.add(bill);	
			
			for(Billinfo billinfo:list) {
				billinfodao.add(billinfo);
			}
			System.out.println("lolo");
			for(int i=0; i<list.size();i++) {
					list.remove(i);	
			}
			return "redirect:/giohang";
		
	}
	public int tongtien(List<Billinfo> list) {
		int tong=0;
		for(Billinfo a:list) {
			for(Product b:pdao.getAllProd()) {
				if(b.getId().equals(a.getIdp())) {
					tong+=a.getQuantity()*b.getPrice();
				}
			}
		}
		return tong ;
	}
}
