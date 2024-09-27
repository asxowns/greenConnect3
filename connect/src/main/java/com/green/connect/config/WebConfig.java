package com.green.connect.config;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
   
	 @Value("${file.upload.directory}")
	    private String uploadDirectory;

	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        exposeDirectory("images", registry);
	    }

	    private void exposeDirectory(String dirName, ResourceHandlerRegistry registry) {
	        Path uploadDir = Paths.get(uploadDirectory);
	        String uploadPath = uploadDir.toFile().getAbsolutePath();

	        if (dirName.startsWith("../")) dirName = dirName.replace("../", "");

	        registry.addResourceHandler("/" + dirName + "/**")
	                .addResourceLocations("file:" + uploadPath + "/");
	    }
	    
	    
	    
	    
}
