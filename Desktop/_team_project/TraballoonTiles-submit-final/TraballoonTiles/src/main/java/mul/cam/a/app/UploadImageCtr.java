package mul.cam.a.app;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
public class UploadImageCtr {

    @RequestMapping(value="/uploadImage.do", produces = "application/json; charset=utf8")
    @ResponseBody
    public String uploadImage(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req)  {

        String contPath = req.getContextPath();

        JsonObject jsonObject = new JsonObject();

        // 내부경로로 저장
        String rootPath = req.getServletContext().getRealPath("/uploadImage");

        String fileRoot = rootPath+File.separator; // File.separator 는 운영체제에 따라 간결하게 (/,\,.) 등으로 변환해준다.

        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
        String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

        // SubString 메소드를 이용하여, 파일 이름의 전체에서 . 이라는 기준으로 .뒤에있는 값을 잘라, 확장자로 사용.
        // 파일을 업로드 하다보면 이름이 같아 문제가 발생하는 경우가 있으니 UUID 이를 이용하여 파일이름을 다른이름으로 변경.

        File targetFile = new File(fileRoot + savedFileName);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);	  //파일 저장
            jsonObject.addProperty("url", File.separator+"TraballoonTiles/uploadImage"+File.separator+savedFileName);  // 파일이 저장된 경로를 "URL" 이라는 이름으로 파일 경로를 넣습니다.
            jsonObject.addProperty("responseCode", "success");            // 문제가 없으면 "responseCode"라는 이름으로 "success" 값을 넣습니다.

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");              // 문제가 발생하였으면 error 값이 저장됩니다.
            e.printStackTrace();
        }
        String result = jsonObject.toString();         // Json 안에 있는 전체의 파일을 String 으로 변환 후 리턴 시킵니다.


        System.out.println("context-path : " + contPath);
        System.out.println("upLoadImage result : "+result);
        return result;
    }
}