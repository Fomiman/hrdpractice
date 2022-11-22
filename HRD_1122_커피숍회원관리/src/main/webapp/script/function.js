/**
 * 
 */
 
 function insertCust(){
	 if(!f.custno.value||f.custno.value==0){
		 alert("회원번호가 입력되지 않았습니다.");
		 return;
	 }
	 
	 if(!f.custname.value){
		 alert("회원번호가 입력되지 않았습니다.");
		 return f.custname.focus();
	 }
	 
	 if(!f.gender[0].checked && !f.gender[1].checked){
		 alert("성별이 선택되지 않았습니다.");
		 return f.gender.focus();
	 }
	 
	 if(!f.phone.value){
		 alert("회원전화가 입력되지 않았습니다.");
		 return f.phone.focus();
	 }
	 
	 if(!f.address.value){
		 alert("주소가 입력되지 않았습니다.");
		 return f.address.focus();
	 }
	 
	 if(!f.joindate.value){
		 alert("가입일자가 입력되지 않았습니다.");
		 return f.joindate.focus();
	 }
	 
	 if(!f.grade.value){
		 alert("고객등급이 입력되지 않았습니다.");
		 return f.grade.focus();
	 }
	 
	 if(!f.city.value){
		 alert("거주도시가 입력되지 않았습니다.");
		 return f.city.focus();
	 }
	 
	 f.action="insertMemberPro.jsp";
	 f.submit();
 }
 
 
 function rewrite() {
	 alert("모든 항목의 정보를 지웠습니다. 다시 입력해주세요.");
	 f.reset();
 }
 
  function insertCoffee(){
	 if(!f.pcode.value){
		 alert("상품번호가 입력되지 않았습니다.");
		 return f.pcode.focus();
	 }
	 
	 if(!f.pname.value){
		 alert("상품명이 입력되지 않았습니다.");
		 return f.pname.focus();
	 }
	 
	 if(!f.pcost.value){
		 alert("상품단가가 입력되지 않았습니다.");
		 return f.pcost.focus();
	 }
	 
	 f.action="insertCoffeePro.jsp";
	 f.submit();
 }

 function updateCoffee(){
	 if(!f.pcode.value){
		 alert("상품번호가 입력되지 않았습니다.");
		 return f.pcode.focus();
	 }
	 
	 if(!f.pname.value){
		 alert("상품명이 입력되지 않았습니다.");
		 return f.pname.focus();
	 }
	 
	 if(!f.pcost.value){
		 alert("상품단가가 입력되지 않았습니다.");
		 return f.pcost.focus();
	 }
	 
	 f.action="updateCoffeePro.jsp";
	 f.submit();
 }
 
 function deleteCoffee(){
	 if(confirm("삭제하시겠습니까?")){
		  f.action="deleteCoffeePro.jsp"
		  f.submit();
	 }
	
 }