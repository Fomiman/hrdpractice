/**
 * 
 */
 
 function insertSubmit1(){
	if(!insertForm.EMPLOYEE_NO.value){
		alert("사원번호를 입력해주세요");
		return insertForm.EMPLOYEE_NO.focus();
	}
	if(!insertForm.EMPLOYEE_NAME.value){
		alert("사원명을 입력해주세요");
		return insertForm.EMPLOYEE_NAME.focus();
	}
	if(!insertForm.DEPT_NO.value){
		alert("부서번호를 입력해주세요");
		return insertForm.DEPT_NO.focus();
	}
	if(!insertForm.HIRE_DATE.value){
		alert("입사일자를 입력해주세요");
		return insertForm.HIRE_DATE.focus();
	}
	
	insertForm.submit();
	
};

function toUpdatePage(){
	if(!updateForm.EMPLOYEE_NO.value){
		alert("사원번호를 입력해주세요");
		return updateForm.EMPLOYEE_NO.focus();
	}
	if(!updateForm.EMPLOYEE_NAME.value){
		alert("사원명을 입력해주세요");
		return updateForm.EMPLOYEE_NAME.focus();
	}
	if(!updateForm.DEPT_NO.value){
		alert("부서번호를 입력해주세요");
		return updateForm.DEPT_NO.focus();
	}
	if(!updateForm.HIRE_DATE.value){
		alert("입사일자를 입력해주세요");
		return updateForm.HIRE_DATE.focus();
	}
	
	updateForm.submit();
	
};

function selectMember1(){
	location.href="selectEmployee.jsp";
	return;
}