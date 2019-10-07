package com.btl.findjob.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.model.PersonInfoGraphDTO;
import com.btl.findjob.service.PersonGraphService;

@Controller
public class GraphController {

    @Inject
    PersonGraphService personGraphService;

    //월별 그래프
    @RequestMapping(value = "/graphajax")
    public @ResponseBody
    List AjaxView(PersonInfoGraphDTO pigdto) {
        List tmp = personGraphService.personGetGraph(pigdto.getCi_companyName());
        return tmp;
    }

    // 채용정보
    @RequestMapping(value = "/hireinfo", produces = "application/text; charset=utf8")
    public @ResponseBody
    String hireinfo(String ci_companyName) {
        return saraminData(ci_companyName);
    }

    public String saraminData(String comapany) {
        BufferedReader in = null;
        String json = "";
        try {
            // URL 생성
            String saraminUrl = "https://oapi.saramin.co.kr/job-search?";
            String accessKey = "&access-key=e8iNhZzwll1Rot7ie6H6eZSrzZ7YBwxczxmTF9on1TVL6pZkMiVW&keywords=";
            String keyword = URLEncoder.encode(comapany, "UTF-8");

            String URL = saraminUrl + accessKey + keyword;

            // 호출할 url
            URL obj = new URL(URL);

            // 값 요청및 저장.
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            json = in.readLine();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (in != null)
                try {
                    in.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
        }
        return json;
    }
}
