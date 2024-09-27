package com.green.connect.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.connect.dao.LevelupDao;
import com.green.connect.dto.LevelUp;

@Controller
public class LevelupController {
	
	@Autowired
	private LevelupDao dao;
	
	@Value("${file.upload.directory}")
    private String uploadDirectory;
	
	@RequestMapping("/levelupManageList")
	public String levelupList(Model model) {
		
		List<LevelUp> level = dao.levelupList();
		
		// 원본 파일명 추출
        level.forEach(levels -> {
            String fullFileName = levels.getLevelIcon();
            String originalFileName = fullFileName.substring(fullFileName.indexOf('_') + 1);
            levels.setLevelIcon(originalFileName);
        });
		
		model.addAttribute("level", level);
		
		return "admin/levelupManageList";
	}
	
	@RequestMapping("/levelupManageUpdateForm")
	public String levelupManageUpdateForm(@RequestParam("levelno") int levelno, Model model) {
		
		LevelUp levelup = dao.getLevelup(levelno);
		
		// 원본 파일명 추출
            String fullFileName = levelup.getLevelIcon();
            String originalFileName = fullFileName.substring(fullFileName.indexOf('_') + 1);
            levelup.setLevelIcon(originalFileName);
		
		model.addAttribute("levelup", levelup);
		
		return "admin/levelupManageUpdateForm";
	}
	
	@RequestMapping("/levelupManageInsertForm")
	public String levelupManageInsertForm() {
		
		
		return "admin/levelupManageInsertForm";
	}
	
	@RequestMapping("/insertLevelUp")
	public String levelupInsert(@ModelAttribute LevelUp levelup,
			@RequestParam("levelIconFile") MultipartFile file) throws IOException{
		
		if (!file.isEmpty()) {
	        File directory = new File(uploadDirectory);
	        if (!directory.exists()) {
	            directory.mkdirs();
	        }

	        String originalFilename = file.getOriginalFilename();
	        String fileNameWithoutExtension = "";
	        String fileExtension = "";

	        if (originalFilename != null && originalFilename.contains(".")) {
	            fileNameWithoutExtension = originalFilename.substring(0, originalFilename.lastIndexOf("."));
	            fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
	        }

	        Path filePath = Paths.get(uploadDirectory, originalFilename);
	        int count = 1;

	        // 파일명 중복 확인 및 처리
	        while (Files.exists(filePath)) {
	            String newFileName = fileNameWithoutExtension + "(" + count + ")" + fileExtension;
	            filePath = Paths.get(uploadDirectory, newFileName);
	            count++;
	        }

	        // 파일 저장
	        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	        // 데이터베이스에 저장할 고유한 파일명 생성
	        String uniqueFileName = UUID.randomUUID().toString() + "_" + filePath.getFileName().toString();
	        
	        levelup.setLevelIcon(uniqueFileName);
	    }
		
		dao.insertLevelUp(levelup);
		
		return "redirect:levelupManageList";
	}
	
	@RequestMapping("/updateLevelUp")
	public String updateLevelUp(@ModelAttribute LevelUp levelup,
			@RequestParam(value = "levelIconFile", required = false) MultipartFile file) throws IOException{
		
		// 기존 LevelUp 객체 조회
	    LevelUp existingLevelUp = dao.getLevelup(levelup.getLevelno());

	    if (file != null && !file.isEmpty()) {
	        File directory = new File(uploadDirectory);
	        if (!directory.exists()) {
	            directory.mkdirs();
	        }

	        String originalFilename = file.getOriginalFilename();
	        String fileNameWithoutExtension = "";
	        String fileExtension = "";

	        if (originalFilename != null && originalFilename.contains(".")) {
	            fileNameWithoutExtension = originalFilename.substring(0, originalFilename.lastIndexOf("."));
	            fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
	        }

	        Path filePath = Paths.get(uploadDirectory, originalFilename);
	        int count = 1;

	        // 파일명 중복 확인 및 처리
	        while (Files.exists(filePath)) {
	            String newFileName = fileNameWithoutExtension + "(" + count + ")" + fileExtension;
	            filePath = Paths.get(uploadDirectory, newFileName);
	            count++;
	        }

	        // 파일 저장
	        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	        // 기존 파일 삭제
	        if (existingLevelUp.getLevelIcon() != null) {
	            Path oldFilePath = Paths.get(uploadDirectory, existingLevelUp.getLevelIcon());
	            Files.deleteIfExists(oldFilePath);
	        }

	     // 데이터베이스에 저장할 고유한 파일명 생성
	        String uniqueFileName = UUID.randomUUID().toString() + "_" + filePath.getFileName().toString();
	        
	        levelup.setLevelIcon(uniqueFileName);
	    } else {
	        // 새 파일이 업로드되지 않은 경우, 기존 파일 정보 유지
	        levelup.setLevelIcon(existingLevelUp.getLevelIcon());
	    }

	    // 나머지 필드 업데이트
	    levelup.setLevelName(levelup.getLevelName() != null ? levelup.getLevelName() : existingLevelUp.getLevelName());
	    levelup.setRank(levelup.getRank() != 0 ? levelup.getRank() : existingLevelUp.getRank());
	    levelup.setDescription(levelup.getDescription() != null ? levelup.getDescription() : existingLevelUp.getDescription());

	    dao.updateLevelUp(levelup);
		
		return "redirect:levelupManageList";
	}

	@RequestMapping("/deleteLevelup")
	public String deleteLevelUp(@RequestParam("levelno") int levelno) {
		
		dao.deleteLevelUp(levelno);
		
		return "redirect:levelupManageList";
	}
	
	@RequestMapping("/getRanks")
	@ResponseBody
	public List<LevelUp> duplicationRank() {
		
		return dao.getRank();
	}
	
	
	
	
	
}
