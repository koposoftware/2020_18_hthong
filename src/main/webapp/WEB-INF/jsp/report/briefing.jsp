<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>금융리포트</title>
<!--Custom Theme files-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="My Music Player Widget template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css?family=Prompt&display=swap');

@import url('https://use.fontawesome.com/releases/v5.6.3/css/solid.css');

@import
	url('https://use.fontawesome.com/releases/v5.6.3/css/fontawesome.css');

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Prompt', sans-serif;
	-webkit-tap-highlight-color: transparent;
}

main {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100vw;
	height: 100vh;
}

.ui {
	width: 320px;
	height: 500px;
	padding: 5px 15px;
	border-radius: 4px;
	background: linear-gradient(45deg, #d2dfed 0%, #c8d7eb 26%, #bed0ea 51%, #a6c0e3 51%
		, #afc7e8 62%, #bad0ef 75%, #99b5db 88%, #799bc8 100%);
}

.ui-toolbar {
	height: 10%;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.ui-cover {
	height: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.ui-cover-art {
	width: 120px;
}

.ui-cover-title {
	text-align: center;
}

.ui-actions {
	height: 15%;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}

.ui-seekbar {
	height: 10%;
	text-align: center;
}

.ui-seekbar .ui-slider {
	width: 100%;
	height: 6px;
	border-radius: 8px;
	-webkit-appearance: none;
	appearance: none;
	outline: none;
	box-shadow: 0 0 3px rgba(0, 0, 0, .6);
	background: #FFF;
}

.ui-seekbar .ui-slider::-webkit-slider-thumb {
	-webkit-appearance: none;
	appearance: none;
	width: 14px;
	height: 14px;
	border-radius: 50%;
	background: #09F;
	cursor: pointer;
}

.ui-controls {
	height: 15%;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}
</style>
<script>
const seekbar = document.querySelector('.ui-slider');
const seekbarMax = seekbar.max;

setInterval(() => {
	let position = (parseInt(seekbar.value));
	
	if(position < seekbarMax) {
		seekbar.value = parseInt(position) + 1;
	}
	else {
		seekbar.value = 0;
	}
}, 1000);
</script>

</head>
<body>
	<main>
		<div class="ui">
			<div class="ui-toolbar" style="margin-bottom: 50px;">
				<i class="fas fa-chevron-left"></i><strong style="font-weight: 700;">금융브리핑</strong><i
					class="fas fa-bars"></i>
			</div>

			<div class="ui-cover" style="margin-bottom: 80px;">
				<div style="margin-top: 20px; margin-bottom: 20px;">
				</div>
				<div class="card" style="width: 17rem; ">
					<div class="card-body">
						<h6 class="card-title">${ ttsPathList.name }님 안녕하세요?</h6>
						<p class="card-text">${ systemDate }  하나원픽<br> 금융브리핑입니다.</p>
						<button type="button" onclick="location.href='http://localhost:9999/product/onepick/budget'" class="btn btn-dark" style=" width: 230px; height: 40px; font-size: 13px; text-align: left;">예산조회 바로가기 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fas fa-arrow-right"></i></button> 
					</div>
				</div>
			</div>
			<div>
			</div>
			<div class="ui-seekbar" style="margin-top: 40px;">
				<audio controls>
					<source src=${ ttsPathList.path } type="audio/ogg" />
				</audio>
			</div>

		</div>
	</main>
</body>
</html>