<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link href="/resources/css/table.css" rel="stylesheet">
<link
	href="/resources/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
href="/resources/images/fav.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}


.input-idCheck {
	width: 150px;
	height: 35px;
	margin-right: 15px;	
	vertical-align: middle;
}
</style>

<script type="text/javascript">
	let httpRequest = null;
	
    // httpRequest 객체 생성
    function getXMLHttpRequest(){
        var httpRequest = null;
    
        if(window.ActiveXObject){
            try{
                httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
            } catch(e) {
                try{
                    httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e2) { httpRequest = null; }
            }
        }
        else if(window.XMLHttpRequest){
            httpRequest = new window.XMLHttpRequest();
        }
        return httpRequest;    
    }

	// 아이디 중복체크 버튼 누르면 기존 창의 아이디 입력값을 가져온다.
	function pValue(){
		document.getElementById("userId").value = opener.document.signUpForm.id.value;
	}
	
	
	// 아이디 입력 제약사항( 특수문자 불가, 6자리 이상)
	function idCheck() {
		let id = document.getElementById("userId").value;
		
		if(!id) {
			alert("아이디를 입력하지 않았습니다.");
			return false;
		}
		else if( (id <"0" || id >"9") && (id < "A" || id > "Z") && (id < "a" || id > "z" ) ) {
			alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
			return false;
		}
		else if(id.length < 4){
			alert("아이디는 4자리 이상 입력하세요.");
			return false;
		}
		else{
			let param = "id=" + id;
			
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = callback;
			httpRequest.open("POST", "memberIdCheck.do", true);
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			httpRequest.send(param);
		}
	}
	
	function callback() {
		if(httpRequest.readyState == 4){
			
			let resultText = httpRequest.responseText;
			
			console.log("result :" + resultText);
			
			if(resultText == 0){
				alert("사용할 수 없는 아이디입니다.");
				$("#cancleBtn").attr("disabled", false);
				$("#useBtn").attr("disabled", true);
				document.getElementById("msg").innerHTML ="";
			}
			else if(resultText == 1) {
				$("#cancleBtn").attr("disabled", true);
				$("#useBtn").attr("disabled", false);
				document.getElementById("msg").innerHTML ="사용 가능한 아이디입니다.";
			}
		}
	}
	
	function sendCheckValue() {
		opener.document.signUpForm.idDuplication.value="idCheck";
		opener.document.signUpForm.id.value= document.getElementById("userId").value;
		
		if(opener != null){
			opener.chkForm = null;
			self.close();
		}
	}
</script>
</head>
<body onload="pValue()">
	<div id="wrap">
		<br> <b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr>
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="id_input" class="input-idCheck" id="userId"> 
				<input type="button" value="중복확인"
					class="btn btn-outline-info" onclick="idCheck()">
			</form>
			<div id="msg"></div>
			<br> <input id="useBtn" type="button" value="사용하기"
				class="btn btn-outline-info" onclick="sendCheckValue()" disabled> <input
				id="cancleBtn" type="button" value="취소" class="btn btn-outline-info"
				onclick="window.close()">
		</div>
	</div>

</body>
</html>