package com.andamiro.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.andamiro.domain.recipe.RecipeDTO;
import com.andamiro.domain.recipe.RecipeDetailVO;
import com.andamiro.domain.recipe.RecipeIngreVO;
import com.andamiro.domain.recipe.RecipeOrderVO;
import com.andamiro.domain.recipe.RecipePicVO;
import com.andamiro.domain.recipe.RecipeVO;
import com.andamiro.security.domain.CustomUserDetails;
import com.andamiro.service.recipe.RecipeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recipe/*")
@AllArgsConstructor
public class RecipeController {
	
	private final RecipeService recipeService;
	
	private String getFolder() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = simpleDateFormat.format(date);
		
		return str.replace("-", File.separator);
	}
	
	@GetMapping("recipe_reg")
	public void recipe_reg_Get(Principal principal , Model model) {
		
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        Object principalObject = authentication.getPrincipal();

        if (principalObject instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) principalObject;

            Long memberNumber = userDetails.getMemberNumber();

            model.addAttribute("memberNumber", memberNumber);
            model.addAttribute("id", userDetails.getUsername());
        } else {
            model.addAttribute("errorMessage", "사용자 정보를 찾을 수 없습니다.");
        }
		
	}
	
	@PostMapping("recipe_reg")
	public void recipe_reg_Post(@ModelAttribute RecipeVO recipeVO,
								@ModelAttribute RecipeDetailVO recipeDetailVO,
								@ModelAttribute	RecipeIngreVO recipeIngreVO,
								@ModelAttribute RecipeOrderVO recipeOrderVO,
								@RequestParam("mainPicture") MultipartFile mainPicture,
								@RequestParam("pic1") MultipartFile pic1,
								@RequestParam("pic2") MultipartFile pic2,
								@RequestParam("pic3") MultipartFile pic3,
								@RequestParam("pic4") MultipartFile pic4,
								@RequestParam("pic5") MultipartFile pic5)  {
        // 폴더 만들기
		String uploaderFolder = "C:\\Users\\YONSAI\\git\\SpringAnda\\Andamiro2\\src\\main\\webapp\\resources\\upload";
		
		File uploadPath = new File(uploaderFolder, getFolder());
		log.info("upload path : " + uploadPath);
		System.out.println("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		// 파일 업로드 처리
		RecipePicVO recipePicVO = new RecipePicVO();

		  // MultipartFile 필드들을 배열로 저장
	    MultipartFile[] picFiles = {mainPicture, pic1, pic2, pic3, pic4, pic5};
	    String[] picFileNames = new String[6];

	    // MultipartFile 필드들을 반복문으로 처리
	    for (int i = 0; i < picFiles.length; i++) {
	        MultipartFile picFile = picFiles[i];
	        if (picFile != null && !picFile.isEmpty()) {
	            // 파일 업로드 처리 로직
	            picFileNames[i] = picFile.getOriginalFilename();
	            UUID uuid = UUID.randomUUID();
	            picFileNames[i] = uuid.toString() + "_" + picFileNames[i];
	            log.info("only-file-name" + picFileNames[i]);
	            System.out.println("only-file-name" + picFileNames[i]);
	            File saveFile = new File(uploadPath, picFileNames[i]);
	            
	            try {
					picFiles[i].transferTo(saveFile);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	    }
	    
	    recipePicVO.setMainPicture(picFileNames[0]);
	    recipePicVO.setPic1(picFileNames[1]);
	    recipePicVO.setPic2(picFileNames[2]);
	    recipePicVO.setPic3(picFileNames[3]);
	    recipePicVO.setPic4(picFileNames[4]);
	    recipePicVO.setPic5(picFileNames[5]);
	    recipePicVO.setUploadPath(getFolder());
	    RecipeDTO recipeDTO = new RecipeDTO();
	    recipeDTO.setRecipeVO(recipeVO);
	    recipeDTO.setRecipeDetailVO(recipeDetailVO);
	    recipeDTO.setRecipeOrderVO(recipeOrderVO);
	    recipeDTO.setRecipeIngreVO(recipeIngreVO);
	    recipeDTO.setRecipePicVO(recipePicVO);
		recipeService.registRecipe(recipeDTO);
	}
	
	@GetMapping("recipe_list")
	public void recipe_list_get(Model model) {
		List<RecipeDTO> recipeList = recipeService.getRecipeList();
		model.addAttribute("recipeList" , recipeList);
	}
	
	@RequestMapping(value = "ajax_recipe_getList")
	@ResponseBody
	public List<RecipeDTO> ajaxRecipeGetList(Model model) {
		List<RecipeDTO> list = recipeService.getRecipeList();
		model.addAttribute("list" , list);
		return list;
	}
	
	@GetMapping("recipe_detail")
	public void recipe_detail_get(@RequestParam("recipeId") int recipeId, Model model) {
	    RecipeDTO recipeDTO = recipeService.selectOneRecipeByRecipeId(recipeId);
	    System.out.println(recipeDTO);

	    List<String> ingreList = new ArrayList<String>();
	    if (recipeDTO.getRecipeIngreVO() != null) {
	        RecipeIngreVO recipeIngreVO = recipeDTO.getRecipeIngreVO();
	        for (int i = 1; i <= 12; i++) {
	            String ingredient = getIngredientValue(recipeIngreVO, i);
	            if (ingredient != null) {
	                ingreList.add(ingredient);
	            }
	        }
	    }
	    RecipePicVO recipePicVO = recipeDTO.getRecipePicVO();
		List<String> recipePicList = new ArrayList<>();
		if (recipePicVO != null) {
			for (int i = 1; i <= 5; i++) {
				String recipePicture = getPictureValue(recipePicVO, i);
				if (recipePicture != null) {
					recipePicList.add(recipePicture);
				}
			}
		}

		RecipeOrderVO recipeOrderVO = recipeDTO.getRecipeOrderVO();
		List<String> recipeOrderList = new ArrayList<>();
		if (recipeOrderVO != null) {
			for (int i = 0; i <= 5; i++) {
				String recipeOrder = getOrderValue(recipeOrderVO, i);
				if (recipeOrder != null) {
					recipeOrderList.add(recipeOrder);
				}
			}
		}
	    
	    
	    
	    model.addAttribute("recipe", recipeDTO);
	    model.addAttribute("ingreList", ingreList);
	    model.addAttribute("recipeOrderList", recipeOrderList);
	    model.addAttribute("recipePicList", recipePicList);
	}
	
	private String getOrderValue(RecipeOrderVO recipeOrderVO, int i) {
		switch (i) {
		case 1:
			return recipeOrderVO.getOrder1();
		case 2:
			return recipeOrderVO.getOrder2();
		case 3:
			return recipeOrderVO.getOrder3();
		case 4:
			return recipeOrderVO.getOrder4();
		case 5:
			return recipeOrderVO.getOrder5();
		default:
			return null;
		}
	}

	private String getPictureValue(RecipePicVO recipePicVo, int i) {
		switch (i) {
		case 1:
			return recipePicVo.getPic1();
		case 2:
			return recipePicVo.getPic2();
		case 3:
			return recipePicVo.getPic3();
		case 4:
			return recipePicVo.getPic4();
		case 5:
			return recipePicVo.getPic5();
		default:
			return null;
		}
	}

	private String getIngredientValue(RecipeIngreVO recipeIngreVO, int i) {
		switch (i) {
		case 1:
			return recipeIngreVO.getIngre1();
		case 2:
			return recipeIngreVO.getIngre2();
		case 3:
			return recipeIngreVO.getIngre3();
		case 4:
			return recipeIngreVO.getIngre4();
		case 5:
			return recipeIngreVO.getIngre5();
		case 6:
			return recipeIngreVO.getIngre6();
		case 7:
			return recipeIngreVO.getIngre7();
		case 8:
			return recipeIngreVO.getIngre8();
		case 9:
			return recipeIngreVO.getIngre9();
		case 10:
			return recipeIngreVO.getIngre10();
		case 11:
			return recipeIngreVO.getIngre11();
		case 12:
			return recipeIngreVO.getIngre12();
		default:
			return null;
		}
	}
}
