package com.nt.nothing.controller;

import com.nt.nothing.AliOSSUpload.AliOSSUtils;
import com.nt.nothing.pojo.Result;
import com.nt.nothing.pojo.User;
import com.nt.nothing.service.UserService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @Description 图片上传操作
 * @Author HeavenDirt
 * @Date 2024/7/5 15:25
 */

@Slf4j
@RestController
@Tag(name = "图片上传管理")
@CrossOrigin(origins = "*")
public class UploadController {
    @Autowired
    private AliOSSUtils aliOSSUtils;

    @Autowired
    private UserService userService;

    @PostMapping("/upload/{id}")
    public Result<String> upload(@PathVariable Integer id, @RequestParam("file") MultipartFile image) throws IOException {
        log.info("文件上传:{}",image.getOriginalFilename());
        //调用阿里云OSS工具类进行文件上传
        String url = aliOSSUtils.upload(image);
        log.info("文件上传成功，文件访问的url:{}", url);
        User u =  new User();
        u.setId(id);
        u.setImage(url);
        userService.userUpdate(u);

        return new Result<String>().success(url);
    }
}
