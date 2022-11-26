//유효성 검사 - 값이 비어있는지
	function check(){ //function=함수=메서드
		
		/**** ["간단"방법-1] input의 type="submit", type="button"인 경우 ****/
		if(!f.memno.value){ // if(f.memno.value == ""){ //javascript "" '' 둘다 문자열 취급
			alert("회원번호를 입력해주세요");//알림창
			return f.memno.focus(); // 리턴으로 메서드 종료시킬때 커서를 여기에다 두겠다는 것
		}
		
		if(f.name.value == ""){ 
			alert("회원이름을 입력해주세요");
			return f.name.focus();
		}
	
		if(f.address.value == ""){ 
			alert("주소를 입력해주세요");
			return f.address.focus();
		}
	 
		if(f.hiredate.value == ""){ 
			alert("가입일을 입력해주세요");
			return f.hiredate.focus();
		}
		
		// ★ 주의 radio, checkbox
		if(f.gender[0].checked == false && f.gender[1].checked == false){ 
			alert("성별을 선택해주세요");			
			return false;
		}
	 
		if(f.tel1.value == ""){ 
			alert("전화번호를 입력해주세요");
			return f.tel1.focus();
		}
	
		if(f.tel2.value == ""){ 
			alert("전화번호를 입력해주세요");
			return f.tel2.focus();
		}
	
		if(f.tel3.value == ""){ 
			alert("전화번호를 입력해주세요");
			return f.tel3.focus();
		}
	
		f.submit();
		
		 
		
		/**** [방법-2] type="submit", type="button"인 경우 : 정석적인 방법 ****/
		/* if(!f.memno.value){ // if(f.memno.value == ""){ //javascript "" '' 둘다 문자열 취급
			alert("회원번호를 입력해주세요");//알림창
			//f.memno.focus();//커서를 둠
			//return false;//return false로 주면 데이터 전송이 안됨
			return f.memno.focus(); // 리턴으로 메서드 종료시킬때 커서를 여기에다 두겠다는 것
		}
		
		else if(f.name.value == ""){ 
			alert("회원이름을 입력해주세요");
			// f.name.focus();
			// return false;
			return f.name.focus();
		}
	
		else if(f.address.value == ""){ 
			alert("주소를 입력해주세요");
			// f.address.focus();
			// return false;
			return f.address.focus();
		}
	 
		else if(f.hiredate.value == ""){ 
			alert("가입일을 입력해주세요");
			//f.hiredate.focus();
			//return false;
			return f.hiredate.focus();
		}
	
		else if(f.gender[0].checked == false && f.gender[1].checked == false){ 
			alert("성별을 선택해주세요");			
			return;
			
		}
	 
		else if(f.tel1.value == ""){ 
			alert("전화번호를 입력해주세요");
			//f.tel1.focus();
			//return false;
			return f.tel1.focus();
		}
	
		else if(f.tel2.value == ""){ 
			alert("전화번호를 입력해주세요");
			return f.tel2.focus();
			//f.tel2.focus();
			//return false;
		}
	
		else if(f.tel3.value == ""){ 
			alert("전화번호를 입력해주세요");
			return f.tel3.focus();
			//f.tel3.focus();
			//return false;
			// return ; ==> false 리턴값 안주고 그냥 리턴만 넣어서 메서드 종료 시켜도 됨
		}
	
		else {
			f.submit();
			// return true; //type="submit" 또는 "reset"인 경우 : true값을 리턴하면 데이터 전송됨(=submit됨)
			//즉, return값을 false로 주면 데이터 전송이 안되고 true를 줘야 전송됨
		} 
		 */
		
	} // check()의 끝