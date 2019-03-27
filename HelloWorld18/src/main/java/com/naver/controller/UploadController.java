package com.naver.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.utils.MediaUtils;
import kr.co.utils.UploadFileUtils;

@Controller
public class UploadController {
	
	
	@Resource(name="uploadPath")
	private String uploadPath;	
	
	@ResponseBody
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		ResponseEntity<String> entity=null;
		
		fileName.replace('/',File.separatorChar);
		
		String formatType=fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType=MediaUtils.getMediaType(formatType);
		
		if(mType!=null) {
			String prefix=fileName.substring(0,12);
			String subfix=fileName.substring(14);
			File f1 = new File(uploadPath+prefix+subfix);
			f1.delete();
			
			
		}
		File f2 = new File(uploadPath+fileName);
		f2.delete();
		
		entity = new ResponseEntity<String>("성공~",HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/displayfile")
	public ResponseEntity<byte[]> displayFile(String fileName){
		ResponseEntity<byte[]> entity =null;
		InputStream in =null;
		try {
			String formatName=fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
			MediaType mType=MediaUtils.getMediaType(formatName);
			HttpHeaders headers= new HttpHeaders();
			in=new FileInputStream(uploadPath+fileName);
			if(mType!=null) {
				headers.setContentType(mType);
			}else {
				fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition","attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		}catch(Exception e){
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}
		}
		return entity;
	}
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public void uploadForm(MultipartHttpServletRequest request,Model model) throws IOException {
		
		MultipartFile file=request.getFile("file");
		
		String id=request.getParameter("id");
		
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getContentType());
		System.out.println(id);
		
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+file.getOriginalFilename();
		
		File target = new File(uploadPath,savedName);
		FileCopyUtils.copy(file.getBytes(), target);
	}
	
	@RequestMapping(value="/uploadForm",method=RequestMethod.GET)
	public void uploadForm() {}
	
	
	
	@RequestMapping(value="/iuploadForm",method=RequestMethod.POST)
	public String iuploadForm(MultipartFile file,Model model) throws IOException {
		
		UUID uid= UUID.randomUUID();
		String savedName= uid.toString()+"_"+file.getOriginalFilename();
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
	@RequestMapping(value="/uploadAjax",method=RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartHttpServletRequest request,Model model) {
		ResponseEntity<String> entity =null;
		MultipartFile file=request.getFile("file");
		try {
			String msg=UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			entity=new ResponseEntity<String>(msg,HttpStatus.OK);
		}catch(Exception e) {
			
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
