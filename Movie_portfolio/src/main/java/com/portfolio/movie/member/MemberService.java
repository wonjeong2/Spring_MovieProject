package com.portfolio.movie.member;

import java.nio.charset.Charset;	
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.portfolio.movie.common.Const;
import com.portfolio.movie.common.KakaoAuth;
import com.portfolio.movie.common.KakaoUserInfo;
import com.portfolio.movie.common.MyUtils;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	public int join(MemberVO mvo) {
		int result = 0;
		String salt = MyUtils.gensalt();
		String pw = mvo.getCpw();
		String hashPw = MyUtils.hashPassword(pw, salt);
		
		mvo.setSalt(salt);
		mvo.setCpw(hashPw);
		
		result = mapper.join(mvo);
		return result;
	}
	public int login(MemberVO mvo,HttpSession hs) {
		int result =0;
		MemberVO db = mapper.login(mvo);
		System.out.println("Ser_id:"+mvo.getCid());
		System.out.println("Ser_pw:"+mvo.getCpw());
		
		if(db != null) {
			String pw = mvo.getCpw();
			String salt = db.getSalt();
			String hashPw = MyUtils.hashPassword(pw, salt);
			if(db.getCpw().equals(hashPw)) {
				db.setCpw(null);
				hs.setAttribute("loginUser", db);
				result = 1;
			}else {
				result=3;
			}
		}else {
			result=2;
		}
		System.out.println("result:"+result);
		return result;
	}
	public int kakaoLogin(String code,HttpSession hs) {
		int result =0;
		//---------------------------------사용자 토큰 받기(access_token,refresh_token)-----------------------//
			//인코딩
			Charset utf8 = Charset.forName("UTF-8");
			//헤더 설정(auth통신 설정)
			HttpHeaders headers = new HttpHeaders();
			MediaType mediaType = new MediaType(MediaType.APPLICATION_JSON, utf8);		
			headers.setAccept(Arrays.asList(mediaType));
			headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);		
				
			//파라미터설정
			MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
			map.add("grant_type", "authorization_code");
			map.add("client_id", Const.KAKAO_CLIENT_ID);
			map.add("redirect_uri", Const.KAKAO_AUTH_REDIRECT_URI);
			map.add("code", code);
						
			HttpEntity<LinkedMultiValueMap<String, Object>> entity = new HttpEntity(map, headers);
				
			//결과값 가져옴
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<String> respEntity 
			= restTemplate.exchange(Const.KAKAO_ACCESS_TOKEN_HOST, HttpMethod.POST, entity, String.class);
				
			String data = respEntity.getBody();
				
			System.out.println("result : " + data);
				
				
			ObjectMapper om = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
				
			KakaoAuth auth = null;
				
			try {
				auth = om.readValue(data, KakaoAuth.class);
					
				System.out.println("access_token: " + auth.getAccess_token());
				System.out.println("refresh_token: " + auth.getRefresh_token());
				System.out.println("expires_in: " + auth.getExpires_in());
				System.out.println("refresh_token_expires_in: " + auth.getRefresh_token_expires_in());
					
			} catch (JsonMappingException e) {			
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
				
			//------------------------------사용자 토큰 받기 (END)--------------------------------//
				
				
			//----------------------------사용자 정보 가져오기-------------------------------------//
			HttpHeaders headers2 = new HttpHeaders();		
			MediaType mediaType2 = new MediaType(MediaType.APPLICATION_JSON, utf8);		
			headers2.setAccept(Arrays.asList(mediaType2));
			headers2.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
			headers2.set("Authorization", "Bearer " +  auth.getAccess_token());
						
			HttpEntity<LinkedMultiValueMap<String, Object>> entity2 = new HttpEntity("", headers2);
				
			//결과값을 가져오기 위해 result2에 담음
			ResponseEntity<String> respEntity2 
			= restTemplate.exchange(Const.KAKAO_API_HOST + "/v2/user/me", HttpMethod.GET, entity2, String.class);
				
			//JSON에 담겨져 와서 jackson으로 필요한값만 받아서 오게 해야한다.
			String result2 = respEntity2.getBody();
			System.out.println("result2 : " + result2);
				
			KakaoUserInfo kui = null;
			KakaoUserInfo kui2 = null;
			
			try {
				//jackson으로 필요한 정보만 받아온다.
				kui = om.readValue(result2, KakaoUserInfo.class);
				kui2 = om.readValue(result2, KakaoUserInfo.class);
					
				System.out.println("id: " + kui.getId());
				System.out.println("connected_at: " + kui.getConnected_at());
				System.out.println("nickname:"+kui2.getProperties().getNickname());
					
			} catch (JsonMappingException e) {			
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			//-------------------------- 사용자 정보 가져오기(END)--------------------------//
			
			//id존재 check
			MemberVO uvo = new MemberVO();
			uvo.setCid(String.valueOf(kui.getId()));
			
			MemberVO dbResult = mapper.login(uvo);
			
			//회원가입
			if(dbResult == null) {
				uvo.setNm(kui2.getProperties().getNickname());
				uvo.setCpw("");
				uvo.setSalt("");
				uvo.setEmail("");
				
				mapper.join(uvo);
				
				dbResult = uvo;
			}
			//로그인 처리(세션에 값 추가)
			//내장객체에 dbResult에 담긴 값을 담는다.
			hs.setAttribute("loginUser", dbResult);
			
			return result;
	}
	public int chkId(String cid) {
		return mapper.chkId(cid);
	}
}
