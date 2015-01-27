package com.cht.firstaidcpr4me.web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/sitemap.htm")
public class SitemapController {
	private static final Logger log = LoggerFactory.getLogger(SitemapController.class);
	
	
	@RequestMapping(method = RequestMethod.GET)	
	public void getSiteMap(HttpServletRequest request, HttpServletResponse response) {
		String ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">" +
				"<url><loc>https://www.firstaidcprcourse.com</loc><changefreq>weekly</changefreq><priority>1.0</priority></url>" +
				"<url><loc>https://www.firstaidcprcourse.com/certify</loc><changefreq>weekly</changefreq><priority>1.0</priority></url>" +
				"<url><loc>https://www.firstaidcprcourse.com/courses</loc><changefreq>weekly</changefreq><priority>1.0</priority></url>" +
				"<url><loc>https://www.firstaidcprcourse.com/faq</loc><changefreq>weekly</changefreq><priority>0.5</priority></url>" +
				"<url><loc>https://www.firstaidcprcourse.com/aboutus</loc><changefreq>weekly</changefreq><priority>0.5</priority></url>" +
				"<url><loc>https://www.firstaidcprcourse.com/contact</loc><changefreq>weekly</changefreq><priority>0.5</priority></url></urlset>";
			try {
				response.setContentType("text/xml");
				response.getWriter().write(ret);
			} catch (UnsupportedEncodingException e) {
				log.error(e.getMessage(), e);
			} catch (IOException e) {
				log.error(e.getMessage(), e);
			}
	}

	
}
