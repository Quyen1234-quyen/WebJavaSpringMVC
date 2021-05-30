package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.ProductCategoryDao;
import dao.ProductDao;
import model.Product;

@Controller
@RequestMapping(value = "/admin/product")
public class ControllerProduct {
	@Autowired
	ProductDao pdao;
	@Autowired
	ProductCategoryDao pcdao;
	private static final String upload_derectort="/static/images";
	@RequestMapping(value="")
	public String product() {
		return "redirect:/admin";
	}
	@RequestMapping(value="/xoa/{id}")
	public String xoa(ModelMap mm,@PathVariable("id") String id,HttpSession session) {
		pdao.delete(id);
		return "redirect:/admin";
	}
	@RequestMapping(value="/them" ,method=RequestMethod.GET)
	public ModelAndView them(ModelMap mm,HttpSession session) {
		mm.put("listpc",pcdao.getAllProdC());
		return new ModelAndView("themsp","command",new Product());
	}
	@RequestMapping(value="/them",method=RequestMethod.POST)
	public String themsp(@ModelAttribute("p") Product p ,@RequestParam CommonsMultipartFile file,HttpSession session) throws Exception {
		ServletContext context=session.getServletContext();
		String path=context.getRealPath(upload_derectort);
		String filename=file.getOriginalFilename();
		byte[] bytes=file.getBytes();
		BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(path+File.separator+filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();
		System.out.println(p.getIdpc());
		p.setImg("static/images/"+filename);
		pdao.save(p);
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/suaSP/{id}" ,method=RequestMethod.GET)
	public ModelAndView sua(ModelMap mm,@PathVariable("id") String id) {
		List<Product> list=pdao.getAllProd();
		Product a=new Product();
		for(Product p:list) {
			if(p.getId().equals(id)) {
				a=p;
			}
		}
		mm.put("listpc",pcdao.getAllProdC());
		return new ModelAndView("suasp","command",a);
	}
	
	@RequestMapping(value="/suaSP" ,method=RequestMethod.POST)
	public String suaSP(@ModelAttribute("p") Product p ,@RequestParam CommonsMultipartFile file,HttpSession session)throws Exception {
		ServletContext context=session.getServletContext();
		String path=context.getRealPath(upload_derectort);
		String filename=file.getOriginalFilename();
		byte[] bytes=file.getBytes();
		BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(path+File.separator+filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();
		File afile = new File(path+File.separator+filename);
		if (afile.renameTo(new File("./BaiTapLon/static/images/" + afile.getName()))) {
            System.out.println("File is moved successful!" + afile.getName());
        } else {
            System.out.println("File is failed to move!" + afile.getName());
        }
		System.out.println(path+File.separator+filename);
		p.setImg("static/images/"+filename);
		pdao.update(p);
		return "redirect:/admin";
	}
}
