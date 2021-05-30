package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BillDao;
import dao.BillinfoDao;
import dao.ProductCategoryDao;
import dao.ProductDao;
import model.Bill;
import model.Billinfo;
import model.Product;

@Controller
@RequestMapping(value = "/admin/bill")
public class ControllerBill {
	@Autowired
	ProductDao pdao;
	@Autowired
	ProductCategoryDao pcdao;
	@Autowired
	BillDao billdao;
	@Autowired
	BillinfoDao billinfodao;
	Bill bill=new Bill();
	Billinfo billinfo= new Billinfo();
	Product pro=new Product();
	@RequestMapping(value="" ,method=RequestMethod.GET)
	public String bill(ModelMap mm) {
		mm.put("listbill",billdao.getAllBill());
		mm.put("listbillinfo",billinfodao.getAllBillinfo());
		mm.put("listp",pdao.getAllProd());
		mm.put("listpc",pcdao.getAllProdC());
		return "bill";
	}
	
	@RequestMapping(value="/xoabill/{id}" ,method=RequestMethod.GET)
	public String xoabill(@PathVariable("id") String id) {
		billdao.delete(id);
		return "redirect:/admin/bill";
	}
	@RequestMapping(value="/updatebill/{id}" ,method=RequestMethod.GET)
	public String updatebill(@PathVariable("id") String id) {
		billdao.update(id);
		return "redirect:/admin/bill";
	}
	@RequestMapping(value="/billdetail/{id}" ,method=RequestMethod.GET)
	public String billdetail(ModelMap mm,@PathVariable("id") String id) {
		String name="",phone="",address="";
		for(Bill bill:billdao.getAllBill()) {
			if(bill.getIdbill().equals(id)) {
				name+=bill.getName();
				phone+=bill.getPhone();
				address+=bill.getAddress();
			}
		}
		List<Billinfo> listbillinfo=new ArrayList<>();
		for(Billinfo billinfo:billinfodao.getAllBillinfo()) {
			if(billinfo.getIdbill().equals(id)) {
				listbillinfo.add(billinfo);
			}
		}
		int tong=0;
		for(Billinfo billinfo:billinfodao.getAllBillinfo()) {
			if(billinfo.getIdbill().equals(id)) {
				for(Product pro:pdao.getAllProd()) {
					if(billinfo.getIdp().equals(pro.getId())) {
						tong+=billinfo.getQuantity()*pro.getPrice();
					}
				}
			}
		}
		System.out.println(listbillinfo.size());
		mm.put("listbillinfo",listbillinfo);
		mm.put("product",pdao.getAllProd());
		mm.put("name", name);
		mm.put("phone", phone);
		mm.put("tong", tong);
		mm.put("address", address);
		return "billdetail";
	}
	
	
	
}
