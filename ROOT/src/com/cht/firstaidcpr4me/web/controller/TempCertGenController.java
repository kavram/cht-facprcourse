package com.cht.firstaidcpr4me.web.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;


@Controller
@RequestMapping("/gen-temp-cert-pdf")
public class TempCertGenController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(TempCertGenController.class);

	
	@RequestMapping(method = RequestMethod.GET)	
	public ResponseEntity<byte[]> getQuiz(HttpServletRequest request){
		ResponseEntity<byte[]> response = null;
		try {
			User user = getUser(request);
			UserCourse course = (UserCourse) request.getSession().getAttribute(QuizController.COURSE);
			ByteArrayOutputStream  str = generateCertificatePDF(user, course);
		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.parseMediaType("application/pdf"));
		    headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
		    response = new ResponseEntity<byte[]>(str.toByteArray(), headers, HttpStatus.OK);
			
		} catch (NumberFormatException e) {
			log.error(e.getMessage(), e);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return response;
	}


	private ByteArrayOutputStream generateCertificatePDF(User user, UserCourse course) throws DocumentException, MalformedURLException, IOException {
		SimpleDateFormat dateForm = new SimpleDateFormat("MM/dd/yyyy");
		Calendar cal = Calendar.getInstance();
		String curDate = dateForm.format(cal.getTime());
		cal.add(Calendar.YEAR, 2);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		String expDate = dateForm.format(cal.getTime());
		Rectangle rect = new Rectangle(PageSize.HALFLETTER); 
		//rect.setRotation(90);
		Document document = new Document(rect, 0, 0, 0, 0);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfWriter writer = PdfWriter.getInstance(document, baos);
		document.open();
		FileSystemResource backgrFile = null;
		if(course.getCourseId().longValue() == 1)
			backgrFile = new FileSystemResource("/cht/FirstAidWallet.jpg");
		else if(course.getCourseId().longValue() == 3)
			backgrFile = new FileSystemResource("/cht/blsWallet.jpg");
		else if(course.getCourseId().longValue() == 4 || course.getCourseId().longValue() == 2)
			backgrFile = new FileSystemResource("/cht/CPRWalletCard.jpg");
		
		Image bkrnd = Image.getInstance(backgrFile.getURL());
		bkrnd.scaleToFit(rect);
		//bkrnd.setAbsolutePosition(0, 100);
		document.newPage();
		document.add(bkrnd);
		Font helvetica = new Font(FontFamily.HELVETICA, 9);
		BaseFont bf_helv = helvetica.getCalculatedBaseFont(false);
		Font pal = new Font(FontFamily.TIMES_ROMAN, 9);
		pal.setStyle(Font.BOLD);
		BaseFont bf_pal = pal.getCalculatedBaseFont(false);
		PdfContentByte over = writer.getDirectContent();
	    over.saveState();
	    over.beginText();
	    over.setFontAndSize(bf_helv, 9);
	    over.showTextAligned(Element.ALIGN_CENTER, curDate, 40, 502, 0);
	    over.showTextAligned(Element.ALIGN_CENTER, expDate, 145, 502, 0);
	    over.setFontAndSize(bf_pal, 11);
	    Font cour = new Font(FontFamily.TIMES_ROMAN, 8);
	    cour.setStyle(Font.BOLD);
	    BaseFont bf_cour = cour.getCalculatedBaseFont(false);
	    over.setFontAndSize(bf_cour, 11);
	    over.showTextAligned(Element.ALIGN_CENTER, user.getFirstName() + " " + user.getLastName(), 95, 553, 0);
	    over.endText();
	    over.restoreState();
	    //Add second image for course# 2
	    if(course.getCourseId().longValue() == 2){
	    	backgrFile = new FileSystemResource("/cht/FirstAidWallet.jpg");
			bkrnd = Image.getInstance(backgrFile.getURL());
			bkrnd.scaleToFit(rect);
			document.add(bkrnd);
			over = writer.getDirectContent();
		    over.saveState();
		    over.beginText();
		    over.setFontAndSize(bf_helv, 9);
		    over.showTextAligned(Element.ALIGN_CENTER, curDate, 40, 375, 0);
		    over.showTextAligned(Element.ALIGN_CENTER, expDate, 145, 375, 0);
		    over.setFontAndSize(bf_pal, 11);
		    over.setFontAndSize(bf_cour, 11);
		    over.showTextAligned(Element.ALIGN_CENTER, user.getFirstName() + " " + user.getLastName(), 95, 426, 0);
		    over.endText();
		    over.restoreState();			
	    }
	    
		document.close();
		return baos;
	}
	
}
