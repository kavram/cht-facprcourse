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
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;

@Controller
@RequestMapping("/wall-certificate")
public class WallCertificateController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(WallCertificateController.class);
	
	
	@RequestMapping(method = RequestMethod.GET)	
	public ResponseEntity<byte[]> getQuiz(HttpServletRequest request){
		ResponseEntity<byte[]> response = null;
		try {
			User user = getUser(request);
			if(user == null)
				new ModelAndView("redirect:index");
			UserCourse course = (UserCourse) request.getSession().getAttribute(QuizController.COURSE);
			//if(course == null || !course.isPaid() || !course.isCompleted())
			//	return null;   // new ModelAndView("redirect:courses");
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
		SimpleDateFormat dateForm = new SimpleDateFormat("MMMMM d, yyyy");
		Calendar cal = Calendar.getInstance();
		String curDate = dateForm.format(cal.getTime());
		cal.add(Calendar.YEAR, 1);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		String expDate = dateForm.format(cal.getTime());
		Rectangle rect = new Rectangle(PageSize._11X17); 
		//rect.setRotation(90);
		Document document = new Document(rect, 0, 0, 0, 0);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfWriter writer = PdfWriter.getInstance(document, baos);
		document.open();
		FileSystemResource backgrFile = new FileSystemResource("/cht/Wall-Certificate-Template.png");
		Image bkrnd = Image.getInstance(backgrFile.getURL());
		bkrnd.scaleToFit(rect);
		//bkrnd.setAbsolutePosition(0, 100);
		document.newPage();
		document.add(bkrnd);
		Font helvetica = new Font(FontFamily.HELVETICA, 12);
		BaseFont bf_helv = helvetica.getCalculatedBaseFont(false);
		Font pal = new Font(FontFamily.TIMES_ROMAN, 12);
		BaseFont bf_pal = pal.getCalculatedBaseFont(false);
		PdfContentByte over = writer.getDirectContent();
	    over.saveState();
	    over.beginText();
	    over.setFontAndSize(bf_helv, 12);
	    over.showTextAligned(Element.ALIGN_CENTER, curDate, 360, 415, 0);
	    over.showTextAligned(Element.ALIGN_CENTER, "Expiration Date: " + expDate, 370, 377, 0);
	    over.setFontAndSize(bf_pal, 11);
	    setCourseText(course, over);
	    Font cour = new Font(FontFamily.TIMES_ROMAN, 15);
	    cour.setStyle(Font.BOLD);
	    BaseFont bf_cour = cour.getCalculatedBaseFont(false);
	    over.setFontAndSize(bf_cour, 15);
	    over.showTextAligned(Element.ALIGN_CENTER, user.getFirstName() + " " + user.getLastName(), 265, 526, 0);
	    over.endText();
	    over.restoreState();		
		document.close();
		return baos;
	}
	
	private void setCourseText(UserCourse course, PdfContentByte pdfContent){
	    String courseText1 = "HAS SUCCESSFULLY COMPLETED HEALTHCARE BASIC LIFE SUPPORT";
	    String courseText2 = "TRAINING WITH FIRSTAIDCPRCOURSE.COM WHICH ADHERES TO THE";
	    String courseText3 = "GUIDELINES SET FORTH BY THE AMERICAN HEART ASSOCIATION AND THE";
	    String courseText4 = "ECC/ILCOR NATIONAL CONSENSUS OF 2010.";
	    if(course.getCourseId().longValue() == 1){
		    courseText1 = "HAS SUCCESSFULLY COMPLETED HEALTHCARE BASIC FIRST AID";
		    courseText2 = "TRAINING WITH FIRSTAIDCPRCOURSE.COM WHICH ADHERES TO THE";
		    courseText3 = "GUIDELINES SET FORTH BY THE AMERICAN HEART ASSOCIATION AND THE";
		    courseText4 = "ECC/ILCOR NATIONAL CONSENSUS OF 2010.";
	    }else if(course.getCourseId().longValue() == 4){
		    courseText1 = "HAS SUCCESSFULLY COMPLETED HEALTHCARE BASIC CPR";
		    courseText2 = "TRAINING WITH FIRSTAIDCPRCOURSE.COM WHICH ADHERES TO THE";
		    courseText3 = "GUIDELINES SET FORTH BY THE AMERICAN HEART ASSOCIATION AND THE";
		    courseText4 = "ECC/ILCOR NATIONAL CONSENSUS OF 2010.";
	    }else if(course.getCourseId().longValue() == 2){
		    courseText1 = "HAS SUCCESSFULLY COMPLETED HEALTHCARE BASIC CPR AND FIRST AID";
		    courseText2 = "TRAINING WITH FIRSTAIDCPRCOURSE.COM WHICH ADHERES TO THE";
		    courseText3 = "GUIDELINES SET FORTH BY THE AMERICAN HEART ASSOCIATION AND THE";
		    courseText4 = "ECC/ILCOR NATIONAL CONSENSUS OF 2010.";
	    }
	    pdfContent.showTextAligned(Element.ALIGN_CENTER, courseText1, 265, 500, 0);
	    pdfContent.showTextAligned(Element.ALIGN_CENTER, courseText2, 265, 490, 0);
	    pdfContent.showTextAligned(Element.ALIGN_CENTER, courseText3, 265, 480, 0);
	    pdfContent.showTextAligned(Element.ALIGN_CENTER, courseText4, 265, 470, 0);
	}
	
}
