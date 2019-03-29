<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" href="../resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="card-main mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h3 class="card-title text-center">REGISTER</h3>
						<form action="/member/insert" method="post">

							<div class="form-group">
								<label for="mb_Id">ID</label> 
								<input required placeholder="ID를 입력해주세요" class="form-control" name="mb_Id" id="mb_Id">
							</div>

							<div class="form-group">
								<label for="mb_Pw">비밀번호</label> 
								<input type="password" required placeholder="PassWord를 입력해주세요" class="form-control" name="mb_Pw" id="mb_Pw">
							</div>

							<div class="form-group">
								<label for="mb_Pw_ok">비밀번호확인</label> 
								<input type="password" required placeholder="PassWord 확인을 입력해주세요" class="form-control" name="mb_Pw_ok" id="mb_Pw_ok">
							</div>

							<div class="form-group">
								<label for="mb_Name">이름</label> 
								<input required placeholder="이름" class="form-control" name="mb_Name" id="mb_Name">
							</div>

							<div class="form-group">
								<label for="mb_Birth">생년월일</label> 
								<input placeholder="ex)1990101" class="form-control" name="mb_Birth" id="mb_Birth">
							</div>

							<div class="form-group">
								<label for="mb_Zip">우편번호 <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></label> 
								<input placeholder="우편번호" class="form-control" readonly name="mb_Zip" id="mb_Zip"> 
							</div>

							<div class="form-group">
								<label for="mb_Addr1">주소</label> 
								<input placeholder="주소" class="form-control" readonly name="mb_Addr1" id="mb_Addr1">
							</div>

							<div class="form-group">
								<label for="mb_Addr2">기타주소</label> 
								<input placeholder="기타주소" class="form-control" readonly name="mb_Addr2" id="mb_Addr2">
							</div>

							<div class="form-group">
								<label for="mb_Addr3">상세주소</label> 
								<input placeholder="상세주소" class="form-control" name="mb_Addr3" id="mb_Addr3">
							</div>


							<div class="form-group">
								<label for="mb_Hp">핸드폰번호</label> 
								<input type="tel" required placeholder="핸드폰번호를 입력해주세요" class="form-control" name="mb_Hp" id="mb_Hp">
							</div>

							<div class="form-group">
								<label for="mb_Email">이메일</label> 
								<input type="email" placeholder="이메일를 입력해주세요" class="form-control" name="mb_Email" id="mb_Email">
							</div>

							<div class="form-group">
								<label for="mb_Bank">은행</label>
								<select name="mb_Bank" id="mb_Bank">
									<option value="농협은행">농협은행</option>
									<option value="기업은행">기업은행</option>
									<option value="하나은행">하나은행</option>
									<option value="우리은행">우리은행</option>
									<option value="신한은행">신한은행</option>
									<option value="KEB은행">KEB은행</option>
									<option value="SC은행">SC은행</option>
									<option value="신협">신협</option>
									<option value="수협">수협</option>
									<option value="우체국">우체국</option>
									<option value="새마을금고">새마을금고</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</select>

							</div>

							<div class="form-group">
								<label for="mb_Account">계좌번호</label> 
								<input placeholder="계좌번호" class="form-control" name="mb_Account" id="mb_Account">
							</div>


							<!-- <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div> -->
							<!-- <a class="btn btn-lg btn-success btn-block text-uppercase"
								href="/member/insert">Register</a> -->
							<!-- <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button> -->
						</form>
							<button id="in" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("mb_Addr2").value = extraAddr;

							} else {
								document.getElementById("mb_Addr2").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('mb_Zip').value = data.zonecode;
							document.getElementById("mb_Addr1").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("mb_Addr3").focus();
						}
					}).open();

			$(document).ready(function() {
				$("#in").click(function() {
					$("form").submit();
				});
			});

		}
	</script>
</body>
</html>