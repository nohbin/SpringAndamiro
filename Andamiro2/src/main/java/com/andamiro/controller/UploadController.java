package com.andamiro.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.andamiro.domain.board.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	/* 상위 폴더 명(스트링) 생성 */
	private String getFolderName() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		String str = sdf.format(nowDate);
		return str.replace("-", File.separator);
	}
	/* 이미지 파일인지 확인 */
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("★" + file.toPath() + "★");
			log.info("★" + contentType + "★");
			return contentType.startsWith("image");
		} catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	
	
	/* 아작스를 이용하여 파일 업로드 */
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	
	/* DTO 객체 배열 만들기, 실제 파일 저장하기, 썸네일 만들기 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolderName();
		File uploadPath = new File(uploadFolder, uploadFolderPath);	
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs(); 
		}

		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO afDto = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			afDto.setFileName(uploadFileName); // 원본 파일명 문자열 셋팅
			UUID uuid = UUID.randomUUID();
			afDto.setUuid(uuid.toString()); // uuid 문자열 셋팅

			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			log.info("♥ uploadFileName: " + uploadFileName + "♥");

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); /*** 실제로 파일을 저장하기 ***/
				afDto.setUploadPath(uploadFolderPath); // 업로드패스 문자열 셋팅 ("2023\00\00")
				if (checkImageType(saveFile)) {
					afDto.setImage(true); // 이미지 여부 boolean셋팅
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100); // 썸네일 만들기
					thumbnail.close();
				}
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			list.add(afDto);
		}
		return new ResponseEntity<>(list, HttpStatus.OK); /* 각 파일에 해당하는 AttachFileDTO를 만든다. 리스트에 담는다. 리스트를 JSON 데이터 형태로 반환한다. */
	}
	
	
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		log.info("fileName: " + fileName); //uploadCallPath
		File file = new File("C:\\upload\\" + fileName);
		log.info("file:" + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE) //MIME타입은 applicatiln/octat-stream으로 지정하여 다운로드할 수 있도록 한다.
	@ResponseBody									// HttpServletRequest에 포함된 헤더 메시지 중 'User-Agent'의 값을 이용하여 디바이스의 정보를 알 수 있다. (IE, Edge, Cㅗrome 등)
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		
		Resource resource = new FileSystemResource("C:\\upload\\" + fileName); // resource가 실제 파일을 갖고 있는 듯!!
		if(!resource.exists()) { return new ResponseEntity<>(HttpStatus.NOT_FOUND); }
		String resourceName = resource.getFilename();
		String resourceOriginalName = resourceName.substring(resourceName.lastIndexOf("_")+1); // _의 하나 뒤부터 끝까지 추출해서 새로운 문자열로 반환한다
		String downloadName = null;
		HttpHeaders headers = new HttpHeaders();//HttpHeaders 객체를 이용해서 다운로드 시 파일의 이름을 (한글?)처리!!
		
		try {				//다운로드 시 저장되는 이름은 Content-Disposition을 이용하여 지정한다.
			if(userAgent.contains("Trident")) {//InternetExplorer
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if(userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			headers.add("Content-Disposition", "attachment; filename = " + downloadName); //스트링 생성자에 파라미터가 둘일떄																		// byte[]를 특정한 캐릭터셋으로 디코딩하여 문자열을 생성한다.
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile : " + fileName);
		File file;
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName : " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	

}
