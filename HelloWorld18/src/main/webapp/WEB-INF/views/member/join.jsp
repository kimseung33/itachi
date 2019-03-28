<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
	<html lang="ko-KR">
	<head>
		<meta http-equiv="content-type" content="text/html;charset=KSC5601">
    <title>아카츠키 경매</title>
		<link rel="stylesheet" href="https://script.auction.co.kr/pc/style/css/member_join.css">
		<script type="text/javascript" src="https://script.auction.co.kr/common/jquery.js"></script>
		<script type="text/javascript" src="js/beta.fix.js"></script>
		<script src="https://script.auction.co.kr/style/js/ui.header.js"></script>
		<script type="text/javascript" src="https://script.auction.co.kr/style/js/common.js"></script>		
		<script type="text/javascript" src="https://script.auction.co.kr/common/kdfense_object.js"></script>
		<script type="text/javascript" src="https://script.auction.co.kr/MembersApp/Membership/Signup/MemberSignup.js"></script>
		<script type="text/javascript" src="js/json2.js"></script>		
		<script type="text/javascript" src="https://script.auction.co.kr/style/js/jquery.selectbox.js"></script>		
		<script type="text/javascript">
			//document.domain = "auction.co.kr";
			window.name = "Parent_window";

			//var keyFix = new beta.fix('txt_nickname');
			var keyFix = new beta.fix('ucStoreName_txtStoreNickName');
			 
			$(document).ready(function () {
      
				// input 밸류값 설정
				$("input[type='text'].placeholder").focusout(function () {
					if ($(this).val() == "") {
						$(this).val(this.title);
					}
				});

				$("input[type='text'].placeholder").focus(function () {
					if (this.value == $(this).attr('title')) {
						this.value = '';
					}
				});

        // 공백입력방지 keypress 이벤트로 등록 (#txt_nickname)
		$("#txt_enterid, #txt_enterpw, #txt_enterpw_confirm, #mobile_tel2, #mobile_tel3, #email1, #ucStoreName_txtStoreNickName, #hometel2, #hometel3, #cellphone2_seller, #cellphone3_seller, #txt_account, #ucStoreName_txtStoreUrl").bind("keypress", function (e) {
          Events.PreventSpace(e);
        });

        // 숫자만 입력받을 수 있도록 keypress 이벤트로 등록
        $("#mobile_tel2, #mobile_tel3, #hometel2, #hometel3, #cellphone2_seller, #cellphone3_seller, #txt_account").bind("keypress", function (e) {
          Events.CheckDigit(e);
        });

        // 한글입력방지
        $("#txt_enterid, #txt_enterpw, #txt_enterpw_confirm, #mobile_tel2, #mobile_tel3, #email1, #hometel2, #hometel3, #cellphone2_seller, #cellphone3_seller, #txt_account, #ucStoreName_txtStoreUrl").css("ime-mode", "disabled");

				//$("#txt_enterpw").val("");
				if ($("#htxtCertData").val() != "")
				{
			
					$(".cert-cont").addClass("certified");
					
					$("#txt_name").val($("#htxtpMemberName").val()); 
					if(document.getElementById("ddlEmailDomain").value == "direct_input")
						$("#email2").show();
					$("#txt_name").attr("disabled",true);			

					if($("#htxtAuthType").val() == "F")
					{
						$(".auth").show();
						$(".cert-cont .foreign").addClass("selected");
					}
					else if($("#htxtAuthType").val() == "I")
					{
						$(".auth").show();
						$(".cert-cont .ipin").addClass("selected");
					}
					else if($("#htxtAuthType").val() == "M")
					{
						$(".auth").show();
						$(".cert-cont .cell").addClass("selected");
						$("#ddlMobileTel1").attr("disabled",true);
						$("#mobile_tel2").attr("disabled",true);
						$("#mobile_tel3").attr("disabled",true);
					}
					else if($("#htxtAuthType").val() =="N")
					{
						$(".noauth").show();
						$(".cert-cont .cs-center").addClass("selected");
						$("#txt_name").attr("disabled", false);
						$("#btn_signup").hide();
						$("#temp_signup").show();			
					}
									
					
					$("#txt_enterid").focus();
					$("#txt_enterid").blur();
					
					ConfirmProvision(document.getElementById("cbProvision1"), "provision");
					ConfirmProvision(document.getElementById("cbFinance"), "finance");
					ConfirmProvision(document.getElementById("cbIndividualInfo"), "individual_info_treatment");
					ConfirmProvision(document.getElementById("cbTaxConfirm"), "tax_payment_notice");
					ConfirmProvision(document.getElementById("cbThirdParty"), "agree_to_provide_personal_info");
					//ConfirmProvision(document.getElementById("cbConsignment"), "privacy_consignment");
					ConfirmProvision(document.getElementById("cbLicensee"), "check-set");
				
				}	
				else
				{
						DisableEveryInputArea(true); 
				}

				if ("IS" == "IB1") {			 
					//$(".seller_info").hide();
					$(".tax_payment_notice").hide();
					$("#img_agree03").show();
					
				}
				else
				{
					$("#img_agree04").show();
					$(".cert-cont").addClass("cert-cont-seller");
					$(".cert-cont .foreign").hide();
					$(".cert-cont .cs-center").hide();
				}
				$("#AvoidPostTwice").val("");
				CallbackIDCheck();

			});

			// 약관동의 체크시 색상변경
			window.onload = $(function (){
				var $checkbox = $('.terms-cont input[type=checkbox]');
				$checkbox.removeAttr('checked');
				$checkbox.bind('click onfocus',function chked (){
					if($(this).is(':checked')){$(this).closest('.check-set').next('.terms-box').addClass('check');}
					else{$(this).closest('.check-set').next('.terms-box').removeClass('check');};
				});
			});

			// 약관내용보기
			$(document).ready(function(){
				$('.terms-cont-inner').find('.toggle').click(function(){
					//alert('dd');
					if($(this).attr('class') == 'btn-close toggle'){	
						$(this).attr('class','btn-open toggle');
						$(this).parent().next('.terms-box').slideDown();
					} else {
						$(this).attr('class','btn-close toggle');
						$(this).parent().next('.terms-box').slideUp();
					}
				});
			});

      function Events() { }

      // 공백막기
      Events.PreventSpace = function (e) {

        if (e.which && (e.which == 13 || e.which == 32)) {
          e.preventDefault();
        }
      }

      // 숫자만 입력받을 수 있도록 keypress 이벤트로 처리
      Events.CheckDigit = function (e) {

        if (e.which && (e.which > 47 && e.which < 58 || e.which == 8)) {

        }
        else {
          e.preventDefault();
        }
      }

			function DisableEveryInputArea(isOn)
			{
				$("#txt_name").attr("disabled",isOn);		
				$("#txt_enterid").attr("disabled",isOn);
				$("#txt_enterpw").attr("disabled", isOn);
				$("#txt_enterpw_confirm").attr("disabled", isOn);
				$("#ddlMobileTel1").attr("disabled",isOn);
				if(!isOn)
				{
					$("#mobile_tel1_span .selectbox").removeClass("selectbox-disabled");
					$("#email_span .selectbox").removeClass("selectbox-disabled");
					$("#home_tel1_span .selectbox").removeClass("selectbox-disabled");
					$("#cellphone1_seller_span .selectbox").removeClass("selectbox-disabled");
					$("#bankcode_span .selectbox").removeClass("selectbox-disabled");
				}
				else
				{
					$("#mobile_tel1_span .selectbox").addClass("selectbox-disabled");
					$("#email_span .selectbox").addClass("selectbox-disabled");
					$("#home_tel1_span .selectbox").addClass("selectbox-disabled");
					$("#cellphone1_seller_span .selectbox").addClass("selectbox-disabled");
					$("#bankcode_span .selectbox").addClass("selectbox-disabled");
				}
					

				$("#mobile_tel2").attr("disabled",isOn);
				$("#mobile_tel3").attr("disabled",isOn);
				$("#email1").attr("disabled",isOn);
				$("#ddlEmailDomain").attr("disabled",isOn);
				$("#sms_yn").attr("disabled",isOn);
				$("#email_yn").attr("disabled",isOn);				

				//$("#txt_nickname").attr("disabled",isOn);
				$("#ucStoreName_txtStoreNickName").attr("disabled",isOn);
				$("#ucStoreName_txtStoreUrl").attr("disabled",isOn);
				$("#ucStoreName_txtStoreInfo").attr("disabled",isOn);

				$("#ddlHomeTel1").attr("disabled",isOn);
				$("#hometel2").attr("disabled",isOn);
				$("#hometel3").attr("disabled",isOn);
				$("#ddlCellphone1Seller").attr("disabled",isOn);
				$("#cellphone2_seller").attr("disabled",isOn);
				$("#cellphone3_seller").attr("disabled",isOn);
				$("#txt_postno").attr("disabled",isOn);
				$("#txtAddress1").attr("disabled",isOn);
				$("#txtAddressDetail").attr("disabled",isOn);
				$("#ddlBankCode").attr("disabled",isOn);
				$("#txt_account").attr("disabled",isOn);
				$("#rdoSellRemitMethodA").attr("disabled",isOn);
				$("#rdoSellRemitMethodB").attr("disabled",isOn);
				$("#cbProvision1").attr("disabled",isOn);
				$("#cbFinance").attr("disabled",isOn);
				$("#cbIndividualInfo").attr("disabled",isOn);
				$("#cbTaxConfirm").attr("disabled",isOn);
				$("#cbThirdParty").attr("disabled",isOn);
				//$("#cbConsignment").attr("disabled",isOn);
				$("#cb_agreeall").attr("disabled",isOn);
				$("#cb_agreeall_1").attr("disabled",isOn);
				$("#cbLocation").attr("disabled", isOn);
				$("#cbLicensee").attr("disabled", isOn);
				$("#rdoOtherNumber").attr("disabled",isOn);
				$("#rdoCertMobile").attr("disabled",isOn);
				$("#rdoLater").attr("disabled",isOn);
			}

			function AutoSetForDEBUGGING()
			{

			}

			function FocusIn_IDForm(obj) {
				if (obj.value == '아이디')
					obj.value = '';

				$(obj).addClass('focus');
				if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
					$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
				}
				else {
					$('.info-enter .info-cont ul .enterid_area .enter-guide').show();
				}
				CallbackIDCheck();
			}

			function FocusOut_IDForm(obj) {
				$(obj).removeClass('focus');
				$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
				CheckIDValidation(obj);
			}

			function FocusIn_PwdForm(obj) {
				if (obj.value == '비밀번호')
					obj.value = '';

				$(obj).addClass('focus');
				if ($(obj).hasClass('incorrect') || $(obj).hasClass('usable')) {
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
				}
				else {
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
				}
			}

			function FocusOut_PwdForm(obj) {
				$(obj).removeClass('focus');
				$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
				CheckPasswordOnFocusOut(obj);

				if ($("#txt_enterpw_confirm").val()) {
					CheckPasswordConfirm();
				}
			}

			function CheckPasswordConfirm() {
				var passwdObj = $("#txt_enterpw");
				var passwdConfirmObj = $("#txt_enterpw_confirm");
				var errDisplayObj = $('#password_confirm_err');
				var hdnPwdObj = $("#htxtPassword");

				passwdConfirmObj.removeClass("incorrect");
				passwdConfirmObj.removeClass("usable");

				if (!passwdConfirmObj.val() || passwdConfirmObj.val().length == 0) {
					errDisplayObj.text("비밀번호를 재입력해주세요");
					errDisplayObj.show();

					passwdConfirmObj.addClass("incorrect");
					hdnPwdObj.val("");
				}
				else if (passwdObj.val() != passwdConfirmObj.val()) {
					errDisplayObj.text("비밀번호가 일치하지 않습니다.");
					errDisplayObj.show();

					passwdConfirmObj.addClass("incorrect");
					passwdConfirmObj.val("");
					hdnPwdObj.val("");
				} else {
					passwdConfirmObj.addClass("usable");
					errDisplayObj.hide();
					hdnPwdObj.val(passwdObj.val());
				}
			}

			jQuery(function ($) {
				$('select.styled').selectbox();

				$('.selectbox').hover(function () {
					$(this).addClass('over');
				}).mouseleave(function () {
					$(this).removeClass('over');
				});

				$('.selectbox-dropdown').each(function (index) {
					$(this).hover(function () {
						$('.selectbox').eq(index).addClass('over');
					}).mouseleave(function () {
						$('.selectbox').eq(index).removeClass('over');
					});
				});
			});

			function SuccessValidation(mobilePhone, isForeign) {
				isExistAutenticationPopup = false;
				$(".auth").show();
				$(".cert-cont").addClass("certified");	// 인증 완료
				DisableEveryInputArea(false);
				$("#txt_name").attr("disabled",true);	// 이름입력창은 여전히 disabled 되어야 한다

				if($("#htxtOldMemberID").val() !="")
				{
					$("#txt_enterid").val($("#htxtOldMemberID").val());
					$("#txt_enterid").attr("readonly",true);
					$("#txt_enterid").blur();
					$("#txt_enterid").focus();
				}

				/*
        if($("#htxtOldNickName").val() !="")
				{
					$("#txt_nickname").val($("#htxtOldNickName").val());
					$("#txt_nickname").attr("readonly",true);
					$("#txt_nickname").blur();
					$("#txt_nickname").focus();
				}
				*/
				//////////////////////////////////////////////////////////////
				if($("#htxtOldNickName").val() !="")
				{
					$("#ucStoreName_txtStoreNickName").val($("#htxtOldNickName").val());
					//$("#ucStoreName_txtStoreNickName").attr("readonly",true);
					$("#ucStoreName_txtStoreNickName").blur();
					$("#ucStoreName_txtStoreNickName").focus();
				}				
				if($("#htxtOldStoreUrl").val() !="")
				{
					$("#ucStoreName_txtStoreUrl").val($("#htxtOldStoreUrl").val());
					//$("#ucStoreName_txtStoreUrl").attr("readonly",true);
					$("#ucStoreName_txtStoreUrl").blur();
					$("#ucStoreName_txtStoreUrl").focus();
				}
				if($("#htxtOldStoreInfo").val() !="")
				{
					$("#ucStoreName_txtStoreInfo").val($("#htxtOldStoreInfo").val());
					//$("#ucStoreName_txtStoreInfo").attr("readonly",true);
					$("#ucStoreName_txtStoreInfo").blur();
					$("#ucStoreName_txtStoreInfo").focus();
				}
				//////////////////////////////////////////////////////////////


				if(isForeign)																		// 외국인 인증 완료 시
				{
					$(".cert-cont .foreign").addClass("selected");
					$("#txt_name").val($("#htxtpMemberName").val()); 
					$("#htxtAuthType").val("F");
					$("#htxtCertData").val("dummy_for");
					return;
				}

				if(mobilePhone =="")														// 아이핀 인증 완료 시
				{
					//$(".cert-cont .ipin").addClass("selected");
					$("#htxtAuthType").val("I");
					{
						var inArg = { requestSeqNo: $("#htxtRequestSeqNo").val() , ipinData:$("#htxtCertData").val()};
						var settings = {
							type: "POST",
							url: "SignupIndivisual.aspx/GetMemberInfoByIPin",
							contentType: "application/json; charset=utf-8",
							data: JSON.stringify(inArg),
							dataType: "json"
						};

						settings.success = function (result) {
							switch (result.d.GETINFO_ERROR) {
								case "NO_ERROR":
								{
									$("#txt_name").val(result.d.MEMBER_NAME);
									$("#htxtpMemberName").val(result.d.MEMBER_NAME);
									break;
								}
								default:
									break;
							}
						};

						$.ajax(settings);
					}
					return;
				}

				//$(".cert-cont .cell").addClass("selected");			// 이곳에 적중하였다면 핸드폰 인증 완료 된것
				$("#htxtAuthType").val("M");
				// 이름을 얻어오기위해 AJAX호출
				{
					var ajaxMethodName;
					if($("#htxtCertModule").val() == "KMC")
						ajaxMethodName = "SignupIndivisual.aspx/GetMemberInfoByMobileBackup";
					else
						ajaxMethodName = "SignupIndivisual.aspx/GetMemberInfoByMobile";
				
					var inArg = { requestSeqNo: $("#htxtRequestSeqNo").val() , certData:$("#htxtCertData").val()};
					var settings = {
						type: "POST",
						url: ajaxMethodName,
						contentType: "application/json; charset=utf-8",
						data: JSON.stringify(inArg),
						dataType: "json"
					};

					settings.success = function (result) {
						switch (result.d.GETINFO_ERROR) {
							case "NO_ERROR":
							{
								$("#txt_name").val(result.d.MEMBER_NAME);
								$("#htxtpMemberName").val(result.d.MEMBER_NAME);
								break;
							}
							default:
								break;
						}
					};

					$.ajax(settings);
				}
				var mtel1 = mobilePhone.substr(0,4);						// 최대 4자리일수도 있는 국번을 추출
				var offset1 = 0;
				var offset2 = 0;

				for (var i = 0; i < document.form1.ddlMobileTel1.length; i++) {
					if (mtel1.indexOf(document.form1.ddlMobileTel1.options[i].value) != -1) // 일치하는 국번이 발견되면
					{
						document.form1.ddlMobileTel1.options[i].selected = true;
						$("#mobile_tel1_span").hide();
						$("#mobile_tel1_temp").show();
						$("#mobile_tel1_temp").val(document.form1.ddlMobileTel1.options[i].value);
						offset1 = document.form1.ddlMobileTel1.options[i].value.length;
						break;
					}
				}

				if ($("#ddlMobileTel1 option:selected").val() == "")	// 선택된 국번이 없으면 리턴
					return;

				$("#mobile_tel3").val(mobilePhone.substr(mobilePhone.length - 4, 4));
				offset2 = mobilePhone.length - 4;
				$("#mobile_tel2").val(mobilePhone.substring(offset1, offset2));

				//$("#mobile_tel1_temp").attr("contenteditable", false);
				//$("#mobile_tel2").attr("contenteditable", false);
				//$("#mobile_tel3").attr("contenteditable", false);
				$("#mobile_tel1_temp").attr("disabled", true);
				$("#mobile_tel2").attr("disabled", true);
				$("#mobile_tel3").attr("disabled", true);
			}

			function modal(){
				var back = document.getElementById("back");
				back.style.filter = 'Alpha(Opacity=50)';
				$(back).show();
			}

			// 휴대폰번호 인증 팝업
			var isExistAutenticationPopup;
			var popupInstance;
			function PopupVerifyIdentity() {

				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// 인증 팝업이 열려있을 경우 닫음
				
				var nextUrl = "https%3a%2f%2fmemberssl.auction.co.kr%2fMembership%2fSignup%2fIPinReturnPopup.aspx%3fCertType%3dM%26param_r1%3dIS%26ReturnType%3d";
				var popupUrl = "https://memberssl.auction.co.kr/Common/popup/VerifyIdentityPopup.aspx?mtype=M&ctype=K&next=" + nextUrl;
				popupInstance = window.open(popupUrl,'verifyPop','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=500,height=461,left=120,top=160');
				popupInstance.focus();
				isExistAutenticationPopup = true;

				$(".cert-cont .cell").addClass("selected");						// 인증 선택 상태
				$(".cert-cont .ipin").removeClass("selected");				
				$(".cert-cont .foreign").removeClass("selected");			
				CallbackAuthenticationPopUpCheck();										// 팝업창 종료 감지 핸들러 (콜백 함수)
			}

			// 휴대폰 인증 팝업 - 예비용 (현재 KMC모듈 사용)
			function PopupVerifyIdentityBackup() {

				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// 인증 팝업이 열려있을 경우 닫음
				
				var popupUrl = "https://memberssl.auction.co.kr/Common/popup/VerifyIdentityPopupBackup.aspx?mtype=M&ctype=K&memberType=IS";
				popupInstance = window.open(popupUrl,'verifyPop','width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250');
				popupInstance.focus();
				isExistAutenticationPopup = true;

				$(".cert-cont .cell").addClass("selected");						// 인증 선택 상태
				$(".cert-cont .ipin").removeClass("selected");				
				$(".cert-cont .foreign").removeClass("selected");			
				CallbackAuthenticationPopUpCheck();										// 팝업창 종료 감지 핸들러 (콜백 함수)
			}

			// NICE상태를 판단하여 선택적으로 휴대폰 인증 페이지 호출
			function PopupVerifyIdentityDual(mtype) {
			
			if ("NOMAL" != "NOMAL" || GetCookie("OnlyKMC") == "true")
				PopupVerifyIdentityBackup(mtype);
			else
				PopupVerifyIdentity(mtype);
			}

			// 아이핀 팝업
			function IPinPopup() {

				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// 인증 팝업이 열려있을 경우 닫음
				
				popupInstance = window.open("", "popupIPIN2", "width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no");
				document.frmIPinV2.target = "popupIPIN2";
				document.frmIPinV2.action = "https://cert.vno.co.kr/ipin.cb";
				document.frmIPinV2.param_r1.value = document.getElementById("htxtMemberType").value;
				document.frmIPinV2.param_r2.value = "";	
				document.frmIPinV2.param_r3.value = "";
				document.frmIPinV2.submit();
				isExistAutenticationPopup = true;
				//$(".cert-cont").addClass("certified");								// 인증 완료 상태(버튼 이미지 고정)
				$(".cert-cont .ipin").addClass("selected");						// 인증 선택 상태
				$(".cert-cont .cell").removeClass("selected");				
				$(".cert-cont .foreign").removeClass("selected");			
				CallbackAuthenticationPopUpCheck();										// 팝업창 종료 감지 핸들러 (콜백 함수)
				
			}

			// 외국인등록번호 가입 체크 팝업
			function ForeignLayer() {
				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// 인증 팝업이 열려있을 경우 닫음

				$(".cert-cont .cell").removeClass("selected");				// 인증 선택 상태
				$(".cert-cont .foreign").removeClass("selected");			// 인증 선택 상태
				$(".pop-foreigner").show();
				if (GetCookie("KeySecurity") == 'Y')
					document.getElementById("key_sec").checked = true;
					
			}

			function CallAuthenticateForeigner() {

				if ("IS" == 'IB1') {
					if (!document.getElementById("rbIdentityInfoY").checked) {
						alert('기본적인 서비스를 사용을 위하여 고유식별정보 처리에 동의해 주셔야 합니다.');
						return false;
					}
				}

				var inArg = { foreignSsn:$("#txtSsn").val(), foreignMemberName:$("#txtForeignMemberName").val()};
				var settings = {
					type: "POST",
					url: "SignupIndivisual.aspx/AuthenticateForeigner",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(inArg),
					dataType: "json"
				};

				settings.success = function (result) {
					switch(result.d.ERROR_CODE)
					{
						case "1":
							alert(result.d.ERROR_MSG); 
							break;
						case "2":
							window.open("Popup/ImpossibleSignup.aspx?ResignupDate="+result.d.WITHDRAW_DATE,"popup", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=490,height=265,left=500,top=0");
							break;
						case "3":
							AlertForDuplication();
							break;
						case "0":
							$("#htxtCertType").val(result.d.htxtCertType);
							$("#htxtMemberType").val(result.d.htxtMemberType);
							$("#htxtpSsn1").val(result.d.htxtpSsn1);
							$("#htxtpSsn2").val(result.d.htxtpSsn2)
							$("#htxtOldMemberID").val(result.d.htxtOldMemberID);
							$("#htxtpMemberName").val(result.d.htxtpMemberName);
							$("#htxtOldNickName").val(result.d.htxtOldNickName);
							$(".pop-foreigner").hide();
							SuccessValidation("",true);												
					}

				};

				$.ajax(settings);
			}

			function ChangeMailDomain(obj) {
				if (obj.value == "direct_input") {
					$("#email2").show();
				}
				else
					$("#email2").hide();
			}

			////// 사용자ID 유효성 체크 ////////////

			/*[입력한 ID 유효성 검사 후 중복확인 팝업 표시] membersignup.js에 있는 함수의 수정 버젼*/
			function CheckID(TextBoxControl, valueReset, messageControl)
			{
				inputValue = TextBoxControl.value.replace(/ /g, "") ;
				if (inputValue.length ==0)
				{
					messageControl.innerHTML ="사용자 아이디를 입력하세요.";	// 실제로는 노출되지 않는다.
					if(valueReset){TextBoxControl.value="";}
					//TextBoxControl.focus();
					return false;
				}
				//1.입력값체크
				if(inputValue.replace(/[A-Za-z0-9]/g,"").length!=0){
					messageControl.innerHTML ="아이디는 영문, 숫자만 사용하실 수 있습니다.";
					if(valueReset){TextBoxControl.value="";}
					//TextBoxControl.focus();
					return false;
				}
			
				//1.공백문자체크
				if(TextBoxControl.value.indexOf(' ') >= 0)
				{
					messageControl.innerHTML = "아이디에 띄어쓰기는 사용할 수 없습니다.";
					TextBoxControl.value = TextBoxControl.value.replace(/ /g, "") ;
					//TextBoxControl.focus();
		
					return false;
				}

				//2.길이체크
				if (inputValue.length < 4 || inputValue.length > 12) {
					messageControl.innerHTML ="아이디는 4~12자를 사용해 주세요.";
					if(valueReset){TextBoxControl.value="";}
					//TextBoxControl.focus();
					return false;
				}
				return true;
			}
			
			
			// 타이머 콜백 - ID체크용 
			var previousTick = 0;
			var remainTick = 0;
			var eventSignal = false;
			function CallbackIDCheck() {
				eventSignal = false;
				var inputForm = document.getElementById("txt_enterid");
				// 포커스가 없거나 remainTick이 0이면 타이머콜백 종료
				if (!($(inputForm).hasClass('focus')) || remainTick == 0)
					return;
				var currentTick = new Date().getTime();
				var elapsedTick = currentTick - previousTick;
				remainTick -= elapsedTick;
				if(remainTick <= 0)
				{
					remainTick = 0;
					CheckIDValidation(inputForm);
					//$("#tickcount").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick); // 디버그 메세지
					return;
				}
				//$("#tickcount").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick); // 디버그 메세지
				previousTick = currentTick;

				// 포커스를 가지고 있다면 다시 타이머 콜백 세팅
				if ($(inputForm).hasClass('focus') && !eventSignal) {
					setTimeout("CallbackIDCheck()", 100);
					eventSignal = true;
				}
			}

			//남은 시간을 재설정 - 타이머 콜백 세트
			function SetTickCount(milliSec) {
				remainTick = milliSec;
				previousTick = new Date().getTime();
				if(!eventSignal)
					setTimeout("CallbackIDCheck()", 100);
			}
			
			// 서버에 유효성 체크 요청(AJAX) - 타이머 콜백
			function CheckIDValidation(obj) {
				// 결과 처리는 비동기 호출이므로 우선 입력폼을 노멀 상태로 세팅
				var current = $('.info-enter .info-cont .enter-id');
				current.removeClass('incorrect');
				current.removeClass('usable');
				$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
				$('.info-enter .info-cont ul .enterid_area .txt01').hide();
				$('.info-enter .info-cont ul .enterid_area .txt02').hide();

				// 공란일때는 기본 안내 메세지 출력
				if (obj.value == '')
				{
					$('.info-enter .info-cont ul .enterid_area .enter-guide').show();
					return;
				}

				if (!CheckID(obj, false, $('.info-enter .info-cont ul .enterid_area .txt02').get(0))) {
					$('.enter-id').addClass('incorrect');
					$('.info-enter .info-cont ul .enterid_area .txt02').show();
					return;
				}
				
				var inArg = { memberID: obj.value };
				var settings = {
					type: "POST",
					url: "SignupIndivisual.aspx/CheckIDValidation",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(inArg),
					dataType: "json"
				};

				settings.success = function (result) {
					switch (result.d) {
						case "IDCHECK_INVALID":
						case "IDCHECK_DUPLICATED":
							if($("#htxtOldMemberID").val() != "")
							{
								current.addClass('usable');
								$('.info-enter .info-cont ul .enterid_area .txt01').show();
								break;
							}
							$('.info-enter .info-cont ul .enterid_area .txt02').text("이미 사용중인 아이디입니다.");
							current.addClass('incorrect');
							$('.info-enter .info-cont ul .enterid_area .txt02').show();
							break;
            case "IDCHECK_CANNOT_USE_ANYMORE":
						case "IDCHECK_NOCELLPHONE":
							$('.info-enter .info-cont ul .enterid_area .txt02').text("사용 불가능한 아이디입니다.");
							current.addClass('incorrect');
							$('.info-enter .info-cont ul .enterid_area .txt02').show();
							break;
						case "IDCHECK_GOOD":
							current.addClass('usable');
							$('.info-enter .info-cont ul .enterid_area .txt01').show();
							break;
						default:
							$('.info-enter .info-cont ul .enterid_area .enter-guide').show();
							break;
					}

				};

				$.ajax(settings);
			}
			//////////////////////////////////////////////////////////////////////////////

			/////// 패스워드 체크 ////////////////////////////////////////////////////////

			// 매 키입력시 호출. 구버젼을 개량하여 적용
			function validatePasswordType(objPassWord) {
				
				var current = $('#txt_enterpw');

				var resultType = objPw.getType(objPassWord); //MemberSignup.js
				current.removeClass('incorrect');
				current.removeClass('usable');
				$('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
				$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
				$('#password_err').hide();
				var id = $('#txt_enterid').val();
				
				if (resultType != "" && resultType !="21" && resultType !="31") 
				{
					current.addClass('incorrect');
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
					$('#password_err').show();
					
					var message;
					switch (resultType) {
						case "00":
							message = "안전한 사용을 위해 " + passwordType + "자 이상 입력해주세요";
							break;
						case "01":
							message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
							break;
						case "02":
							message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
							break;
						case "03":
							message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
							break;
						case "04":
							message = "연속되는 문자와 숫자를 사용하실 수 없습니다.";
							break;
						case "05":
							message = "동일한 문자, 숫자를 반복해서 사용하실 수 없습니다.";
							break;
						case "11":
							message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
							break;
						case "12":
							message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
							break;
						case "13":
							message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
							break;
					}
					
					$('#password_err').text(message);
				}
				else if (!CheckPasswordWithID(objPassWord, id)) {
					current.addClass('incorrect');
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
					$('#password_err').show();
				}
				else {
					current.addClass('usable');
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').show();
					$('#password_err').hide();


					var message;
					switch (resultType) {
						case "21":
							message = "사용가능한 적정수준의 비밀번호입니다.";
							break;
						case "31":
							message = "매우 안전한 비밀번호 입니다.";
							break;
						
					}
					$('.info-enter .info-cont ul .enterpw_area .txt01').text(message);
				}

								
			}

			// 패스워드 입력창이 포커스 아웃될때 패스워드 유효성을 체크해줌
			function CheckPasswordOnFocusOut(objPassWord) {
				
				var id = $('#txt_enterid').val();
				var current = $('#txt_enterpw');
				current.removeClass('incorrect');
				current.removeClass('usable');
				$('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
				$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
				$('#password_err').hide();

				if (!CheckPasswordWithID(objPassWord, id)) {
					current.addClass('incorrect');
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
					$('#password_err').show();
					
				}
				else {
					current.addClass('usable');
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').show();
					$('#password_err').hide();
					//$('.info-enter .info-cont ul .enterpw_area .txt01').text("적절한 비밀번호 입니다.");
				}
			}
				

			// MemberSignup.js 에서 추출하여 개량
			function CheckPasswordWithID(passwordControl, id) {
				if (!CheckPassword(passwordControl))
					return false;

				var pwd1 = passwordControl.value;
				if (window.ActiveXObject && GetCookie('KeySecurity') == 'Y') //키보드 보안동작시
				{
					pwd1 = GetPwdValue_K(passwordControl.form, passwordControl, "KingsE2E", "", "");
				}

				//ID와 비밀번호가 4자 이상 중복되는지 체크
				if (checkDuplicate(id, pwd1, 4) == false) {
					objPw.strSecType = "";
					passwordControl.value = "";
					passwordControl.value = "";
					passwordControl.focus();
					$('#password_err').text("ID등의 개인정보가 포함된 비밀번호는 사용할 수 없습니다.");
					return false;
				}
				return true;
			}

			// MemberSignup.js 에서 추출하여 개량. 테스트 후 js파일에 삽입예정.
			function CheckPassword(passwordControl) {
				var bFlag = true;
				if (passwordControl.value.length == 0) { return false; }

				var secType = objPw.getType(passwordControl);
				if (secType.length == 2) {
					if (parseInt(secType.split("")[0]) < 2) //사용불가
					{
						bFlag = false;
					}
				}
				else {
					bFlag = false;

				}
				if (bFlag == false) {
					//$('.info-enter .info-cont ul .enterpw_area .txt02').text("비밀번호는 영문,숫자,특수문자중 두가지를 포함한\n" + passwordType + "~15자리 문자로 입력하셔야 합니다");
					objPw.strSecType = "";
					//passwordControl.value = "";
					//passwordControl.focus();
					return false;
				}
				return true;
			}

			//약관 체크 다했는지 확인
			function CheckAllProvisions() {
				if(document.getElementById("cbProvision1").checked && document.getElementById("cbFinance").checked && document.getElementById("cbIndividualInfo").checked &&
						document.getElementById("cbThirdParty").checked /*&& document.getElementById("cbConsignment").checked*/ && document.getElementById("cbLocation").checked && document.getElementById("cbLicensee").checked) {
						if("IS" != 'IS')
							return true;
						else if("IS" == 'IS' && document.getElementById("cbTaxConfirm").checked)
							return true;
				}
				return false;
			}

			// 약관 체크 박스 처리
			function ConfirmProvision(obj, classname){
				var termArea = $("."+classname);
				if (obj.checked == true) {
					termArea.addClass("check");

					if(CheckAllProvisions()) {
						document.getElementById("cb_agreeall_1").checked = true;
					document.getElementById("cb_agreeall").checked = true;
					}
				}
				else {
					termArea.removeClass("check");

					document.getElementById("cb_agreeall_1").checked = false;
					document.getElementById("cb_agreeall").checked = false;
				}

			}

			function OpenPasswordGuide()
			{
				window.open("https://memberssl.auction.co.kr/Membership/IDPW/popup_passhelp.html", "PasswordGuide", "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes,copyhistory=0");
			}


			/////////////////////////////////////////////////////////////////////////////

			/////// 은행 계좌 체크  //////////////////////////////////////////////////////
			function CheckBankAccount() {
				if (document.getElementById('ddlBankCode').value == '은행 선택') {
					alert('은행명을 선택하시기 바랍니다.');
					//document.getElementById('ddlBankCode').focus();
					return false;
				}

				var accountNo = document.getElementById('txt_account').value;

				var filter = /[^0-9]/;

				if (accountNo.replace(/ /g, "").length == 0) {
					alert('계좌번호를 입력하시기 바랍니다.');
					document.getElementById('txt_account').focus();
					return false;
				}

				if (filter.test(accountNo)) {
					alert("계좌번호는 '-'없이 숫자만 입력하시기 바랍니다.");
					document.getElementById('txt_account').focus();
					return false;
				}
			}

			// 송금방법 설정 체크
			function CheckRemitMethod() {
				if (document.getElementById("htxtRemitMethod").value == "") {
					alert("송금방법을 선택해주세요.");
					return false;
				}
			}

			// 서버에 유효성 체크
			function CheckAccountValidation() {
				
				var inArg = { memberID:$("#txt_enterid").val(), memberName:$("#txt_name").val(), 
											selectedBankCode:document.getElementById('ddlBankCode').value,
											selectedBankName:document.getElementById('ddlBankCode').options[document.getElementById('ddlBankCode').selectedIndex].text,
											accountNumber:$("#txt_account").val()  };
				var settings = {
					type: "POST",
					url: "SignupIndivisual.aspx/CheckAccountValidation",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(inArg),
					dataType: "json"
				};

				settings.success = function (result) {
					switch (result.d) {
						case "ACCOUNTAUTH_NO_ERROR":
							$(".enter_account_area .txt02").hide();
							break;
						default:
							$(".enter_account_area .txt02").show();
							break;
					}

				};

				$.ajax(settings);
			}
			////////////////////////////////////////////////////////////////////////////

			//휴대폰 인증 팝업 ie 버젼
			function goSMSVerification() {
				if (checkVerificatoinSMSValue() == false) return;
				phoneNo = document.getElementById('ddlCellphone1Seller').value + document.getElementById('cellphone2_seller').value + document.getElementById('cellphone3_seller').value;

				var myObject = new Object();

				myObject.window = window;
				myObject.phoneNo = phoneNo;

				var result;
				var url = "/Membership/Verification/VerificationPhoneSendSMSDialog.aspx";

				result = window.showModalDialog(url, myObject, "dialogWidth:470px; dialogHeight:276px; center:yes; help:no; resizable:no; scroll:no;");

				if (result != null) {
					document.getElementById("hdnVerfSeqNo").value = result.VERFSeqNo;
					document.getElementById("hdnSMSSeqNo").value = result.SMSSeqNo;
					document.getElementById("hdnCertMobileTel").value = result.VERFPhoneNo;
				}
			}

			//휴대폰 인증 팝업 union 버젼
			function goSMSVerification2() {
				if (checkVerificatoinSMSValue() == false) return;

				var url = "/Membership/Verification/VerificationPhoneSendSMSDialog.aspx?nomodal=Y";
				window.open(url, "SMSVerify", "width=470, height=300, toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes,copyhistory=0");
			}
			
			function callbackgoSMSVerification2(VERFSeqNo, SMSSeqNo, VERFPhoneNo)
			{				
					document.getElementById("hdnVerfSeqNo").value = VERFSeqNo;
					document.getElementById("hdnSMSSeqNo").value = SMSSeqNo;
					document.getElementById("hdnCertMobileTel").value = VERFPhoneNo;
			}

			//휴대폰 인증 정보 입력 여부
			function checkVerificatoinSMSValue() {
				if (document.getElementById('ddlCellphone1Seller').value == '' ||
				document.getElementById('cellphone2_seller').value.replace(/ /g, "").length == 0 ||
				document.getElementById('cellphone3_seller').value.replace(/ /g, "").length == 0) {
					alert('인증받을 휴대폰 번호를 입력하시기 바랍니다.');
					document.getElementById('ddlCellphone1Seller').focus();
					return false;
				}

				if (document.getElementById("txtCertCount").value == '')
					document.getElementById("txtCertCount").value = 1;
				else
					document.getElementById("txtCertCount").value++;

				if (document.getElementById("txtCertCount").value > 5) {
					alert('휴대폰인증은 5회까지만 허용됩니다.');
					return false;
				}
			}

			function ChangeMainNumberInfo() {
				document.getElementById("spnInfo").style.display = "none";

				if (document.getElementById("rdoLater").checked) {
					document.getElementById("spnInfo").style.display = "block";
				}
				else if (document.getElementById("rdoOtherNumber").checked) {					
					MainNumberValidationWindowOpen();
				}
			}

			function MainNumberValidationWindowOpen()
			{
				var url = "../../Common/Popup/MainNumberValidation.aspx?InputType=S&noUseModal=Y";
				window.open(url, "MainNumberValidation", "dialogWidth:470px; dialogHeight:620px; center:yes; help:no; resizable:no; scroll:no;");
			}

			function callbackGoMainNumber(MainNumberSeqno, MainNumberCert, MainNumberType)
			{
				document.getElementById("hdnMainNumber").value = MainNumberSeqno;
				document.getElementById("hdnMainNumberCert").value = MainNumberCert;
				document.getElementById("hdnMainNumberType").value = MainNumberType;
			}

			//대표번호 인증 팝업
			function MainNumberValidation() {
				var myObject = new Object();

				myObject.window = window;

				var result;
				var url = "../../Common/Popup/MainNumberValidation.aspx?InputType=S";


				if (navigator.appVersion.indexOf("MSIE 6.0") >= 0) {   // IE6.0인 경우				
					result = window.showModalDialog(url, myObject, "dialogWidth:470px; dialogHeight:620px; center:yes; help:no; resizable:no; scroll:no;");
				}
				else {
					result = window.showModalDialog(url, myObject, "dialogWidth:470px; dialogHeight:570px; center:yes; help:no; resizable:no; scroll:no;");
				}

				if (result != null) {					
					document.getElementById("hdnMainNumber").value = result.MainNumberSeqno;
					document.getElementById("hdnMainNumberCert").value = result.MainNumberCert;
					document.getElementById("hdnMainNumberType").value = result.MainNumberType;
				}
			}

			// 약관 동의
			function CheckProvisionAgreement() {

				if(document.getElementById("cbProvision1").checked == false){
					alert("옥션 이용약관에 동의하지 않으셨습니다.");
					$("#cbProvision1").select();
					$("#cbProvision1").focus();
					return false;
				}
								
				if(document.getElementById("cbFinance").checked == false){
					alert("옥션 전자금융서비스 이용약관에 동의하지 않으셨습니다.");
					$("#cbFinance").select();
					$("#cbFinance").focus();
					return false;
				}	
	
				if (document.getElementById("cbIndividualInfo").checked == false) {
					alert("개인정보 수집 및 이용약관에 동의하지 않으셨습니다.");
					$("#cbIndividualInfo").select();
					$("#cbIndividualInfo").focus();
					return false;
				}

				if("IS" == 'IS' && document.getElementById("cbTaxConfirm").checked == false) {
					alert("세금 납부 관련 유의사항을 확인하지 않으셨습니다.");
					$("#cbTaxConfirm").select();
					$("#cbTaxConfirm").focus();
					return false;
				}

				if ("IS" == 'IS' && document.getElementById("cbLicensee").checked == false) {
					alert("사업자 등록여부 확인해주세요. 본인명의로 등록한 사업자가 있다면 개인판매자로 가입할 수 없습니다. 사업자 판매회원으로 가입해주세요");
					$("#cbLicensee").select();
					$("#cbLicensee").focus();
					return false;
				}
				 
			return true;
		}

		// 모든 약관 동의 체크박스 토글
		function ToggleAllProvisions(caller) {
		if(caller.checked)
			{
				document.getElementById("cbProvision1").checked = true;
				document.getElementById("cbFinance").checked = true;
				document.getElementById("cbIndividualInfo").checked = true;
				if("IS" == 'IS')
					document.getElementById("cbTaxConfirm").checked = true;
				document.getElementById("cbThirdParty").checked = true;
				//document.getElementById("cbConsignment").checked = true;
				document.getElementById("cb_agreeall").checked = true;
				document.getElementById("cb_agreeall_1").checked = true;
				document.getElementById("cbLocation").checked = true;
				document.getElementById("cbLicensee").checked = true;
				$(".provision").addClass("check");
				$(".finance").addClass("check");
				$(".individual_info_treatment").addClass("check");
				$(".tax_payment_notice").addClass("check");
				$(".agree_to_provide_personal_info").addClass("check");
				$(".privacy_consignment").addClass("check");
				$(".provision3").addClass("check");
			}
		else
			{
				document.getElementById("cbProvision1").checked = false;
				document.getElementById("cbFinance").checked = false;
				document.getElementById("cbIndividualInfo").checked = false;
				if("IS" == 'IS')
					document.getElementById("cbTaxConfirm").checked = false;
				document.getElementById("cbThirdParty").checked = false;
				//document.getElementById("cbConsignment").checked = false;
				document.getElementById("cbLocation").checked = false;
				document.getElementById("cbLicensee").checked = false;
				document.getElementById("cb_agreeall_1").checked = false;
				document.getElementById("cb_agreeall").checked = false;
				
				$(".provision").removeClass("check");
				$(".finance").removeClass("check");
				$(".individual_info_treatment").removeClass("check");
				$(".tax_payment_notice").removeClass("check");
				$(".agree_to_provide_personal_info").removeClass("check");
				$(".privacy_consignment").removeClass("check");
				$(".provision3").removeClass("check");
				$("#cbLicensee").removeClass("check");
			}
		}

		// 가입 버튼 클릭
		function ClickSignupButton() {
			if($("#AvoidPostTwice").val() != '')
			{
				alert('처리중입니다. 잠시만 기다려주십시요');
				return false;
			}
			
			if($("#htxtAuthType").val()!="N" && $("#htxtCertType").val() =="")	// 인증 체크
			{
				alert("본인인증이 되지 않았습니다 인증을 완료해주세요.");
				return false;
			}

			if(!CheckInput())								// 입력값 체크
				return false;
			
			if(!CheckProvisionAgreement())	// 약관 체크
				return false;
						
			$("#AvoidPostTwice").val("POSTBACK");	// 가입버튼을 여러번 누르는것을 방지
			
			$("#ddlMobileTel1").attr("disabled",false);
			$("#mobile_tel2").attr("disabled",false);
			$("#mobile_tel3").attr("disabled",false);

			if($("#htxtAuthType").val() =="N")
			{
				$("#htxtpMemberName").val($("#txt_name").val());
			}
			$('#btnSignup').click();		// 가입 요청
		}






		//키보드 보안 버튼 클릭
		function ChangeKeyboardSecurity(obj) {
			if (obj.checked == true) {
				// do : 모양 변환
				Run_KeyBoard1("Y");

			} else {
				// do : 모양 변환
				Run_KeyBoard1("N");
			}
		}

		function Run_KeyBoard1(aa) {
			if (aa == "Y") {
				if (GetCookie("KeySecurity") == 'Y') return;
				if (KeyboardSecurity_installed() == false) {
					//팝업창을 뛰우고 페이지를 리로드 한다.
					winopen();
					return false;
				}
			}
			else {
				if (GetCookie("KeySecurity") != 'Y') return;

				KdefenseSetCookie('KeySecurity', 'N');
				window.location.reload();
			}
			return false;
		}

		//반복된 문자인지 체크
		function CheckPattern(value, name) {
			//반복 문자 3자 이상 입력 여부 체크
			if (checkRepetitionForAddress(value, 3) == false) {
				alert("정확한 정보를 입력해주세요.");
				return false;
			}

			//반복 초중종성문자 2자 이상 입력 여부 체크
			if (checkRepetitionHangeul(value) == false) {
				alert("정확한 정보를 입력해주세요.");
				return false;
			}

			//반복 숫자 6자 이상 입력 여부 체크
			if (checkNumRepetition(value, 6) == false) {
				alert("정확한 정보를 입력해주세요.");
				return false;
			}

			return true;
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*************************************************************************************************************
		// 타이머 콜백 - 닉네임 체크용
		var previousTick_NICK = 0;
		var remainTick_NICK = 0;
		var eventSignal_NICK = false;
		function CallbackNickNameCheck() {
			eventSignal_NICK = false;
			var inputForm = $("#txt_nickname");
			// 포커스가 없거나 remainTick이 0이면 타이머콜백 종료
			if (!(inputForm.hasClass('focus')) || remainTick_NICK == 0)
				return;
			var currentTick = new Date().getTime();
			var elapsedTick = currentTick - previousTick_NICK;
			remainTick_NICK -= elapsedTick;
			if(remainTick_NICK <= 0)
			{
				remainTick_NICK = 0;
				CheckNickNameValidation(inputForm);
				//$("#tickcount_NICK").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick_NICK); // 디버그 메세지
				return;
			}
			//$("#tickcount_NICK").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick_NICK); // 디버그 메세지
			previousTick_NICK = currentTick;

			// 포커스를 가지고 있다면 다시 타이머 콜백 세팅
			if (inputForm.hasClass('focus') && !eventSignal_NICK) {
				setTimeout("CallbackNickNameCheck()", 100);
				eventSignal_NICK = true;
			}
		}

		//닉네임 체크 요청까지 남은 시간을 재설정 
		function SetNickNameTickCount(milliSec) {
			remainTick_NICK = milliSec;
			previousTick_NICK = new Date().getTime();
			if(!eventSignal_NICK)
				setTimeout("CallbackNickNameCheck()", 100);
		}
		
		// 서버에 닉네임 유효성 체크 요청(AJAX) 
		function CheckNickNameValidation(obj) {
			// 결과 처리는 비동기 호출이므로 우선 입력폼을 노멀 상태로 세팅
			var current = $('#txt_nickname');
			current.removeClass('incorrect');
			$(".enternickname_area .txt01").hide();
			$(".enternickname_area .txt02").hide();
			$(".enternickname_area .enter-guide").hide();
			
			
			// 공란일때는 기본 안내 메세지 출력
			if (obj.val() == '')
			{
				$(".enternickname_area .enter-guide").show();
				return;
			}

			//공백문자체크
			if(current.val().indexOf(' ') >= 0)
			{
				$(".enternickname_area .txt02").text("닉네임에 띄어쓰기는 사용할 수 없습니다.");
				$(".enternickname_area .txt02").show();
				current.val(current.val().replace(/ /g, ""));
				current.focus();
				return;
			}
			
			var inArg = { nickName: obj.val() };
			var settings = {
				type: "POST",
				url: "SignupIndivisual.aspx/CheckNickValidation",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(inArg),
				dataType: "json"
			};

			settings.success = function (result) {
				switch (result.d) {
					case "NICKCHECK_INVALID":
						break;	
					case "NICKCHECK_TOO_LONG":
						current.addClass('incorrect');
						$(".enternickname_area .txt02").text("닉네임은 1~10자를 사용해 주세요.");
						$(".enternickname_area .txt02").show();
						break;
					case "NICKCHECK_NOT_ALLOWED_SPECIAL_CHAR":
						current.addClass('incorrect');
						$(".enternickname_area .txt02").text("닉네임은 특수문자를 사용할 수 없습니다.");
						$(".enternickname_area .txt02").show();
						break;
					case "NICKCHECK_ALREADY_USED_NICKNAME":
						if($("#htxtOldNickName").val() != "")
						{
						  $(".enternickname_area .txt01").show();
						  current.removeClass('incorrect');
						  current.addClass('usable');
							break;
						}
						current.addClass('incorrect');
						$(".enternickname_area .txt02").text("이미 사용중인 닉네임입니다.");
						$(".enternickname_area .txt02").show();
						break;
					case "NICKCHECK_NO_ERROR":
						$(".enternickname_area .txt01").show();
						current.removeClass('incorrect');
						current.addClass('usable');
						break;
					default:
						$(".enternickname_area .enter-guide").show();
						break;
				}
			};

			$.ajax(settings);
		}

		// 닉네임 입력폼에 포커스인
		function FocusIn_NickNameForm() {
			var obj = $("#txt_nickname");
			if (obj.val() == '판매자 닉네임')
				obj.val('');
			obj.addClass('focus');

			if (obj.hasClass('incorrect') || obj.hasClass('usable')) {
				$('.info-enter .info-cont ul .enternickname_area .enter-guide').hide();
			}
			else {
				$('.info-enter .info-cont ul .enternickname_area .enter-guide').show();
			}

			CallbackNickNameCheck();
		}
		// 닉네임 입력폼에서 포커스아웃
		function FocusOut_NickNameForm() {
			
      if($("#txt_nickname").attr("ReadOnly") == "readonly")
      {
        return;
      }
      
      var obj = $("#txt_nickname");
			obj.removeClass('focus');
			$('.info-enter .info-cont ul .enternickname_area .enter-guide').hide();
			CheckNickNameValidation(obj);
		}
		*********************************************************************************************/
		//////////////////////////////////////////////////////////////////////////////////////////////

		// 대표전화 체크
		function IsRepresentationTelNumber(telNumber1)
		{
			var arr = new Array('070','080','1522','1544','1566','1577','1588','1599','1600','1644','1661','1666','1670','1688','1800','1833','1855','1877','1899');
			
			if (telNumber1.length < 1) return false;
			
			for (var i=0; i < arr.length; i++)
			{
				if (arr[i] == telNumber1) return true;
			}
			
			return false;
		}

		function CheckInput()
		{	
			if($("#txt_name").val() =='' || $("#txt_name").val() =='이름')
			{
				alert("이름을 입력해주세요.");
				$("#txt_name").focus();
				return false;
			}
			
			if($("#txt_enterid").val() =='')
			{
				alert("ID를 입력해주세요.");
				$("#txt_enterid").focus();
				return false;
			}
			
			if($("#htxtPassword").val() == "")
			{
				alert("비밀번호를 입력해주세요.");
				$("#txt_enterpw").focus();
				return false;
			}

			if ($("#txt_enterpw_confirm").val() == "") {
				alert("비밀번호를 재입력해주세요.");
				$("#txt_enterpw_confirm").focus();
				return false;
			}

			if ($("#htxtPassword").val() != $("#txt_enterpw_confirm").val()) {
				alert("비밀번호가 일치하지  않습니다.");
				$("#txt_enterpw_confirm").focus();
				return false;
			}
		
			if(CheckMobilePhone(document.getElementById('ddlMobileTel1'), document.getElementById("mobile_tel2"), document.getElementById("mobile_tel3"),false,false)==false) return false;
			//핸드폰 번호 국번 입력시 000, 0000, 111, 1111 입력 차단 필터링
			if ((checkRepetitionForTel(document.getElementById("mobile_tel2").value, 3) == false) 
				|| (checkRepetitionForTel(document.getElementById("mobile_tel2").value, 4) == false))
			{
				alert("정확한 정보를 입력해주세요.");
				document.getElementById('mobile_tel2').focus();				
				return false;
			}

			if (CheckEmail(document.getElementById('email1'), document.getElementById("email2"), document.getElementById("ddlEmailDomain"), false, false) == false) return false;

			//판매 권한인 경우 인증 여부를 체크한다.
			if ("IS" == 'IS')
			{
				if(document.getElementById('txtAddress1').value.replace(/ /g, "").length == 0 )
				{
					alert("우편번호를 선택하세요") ;
					document.getElementById('txtAddress1').focus();
					document.getElementById('txtAddress1').click();
					return false;
				}
				if(document.getElementById('txtAddressDetail').value.replace(/ /g, "").length == 0 
					|| document.getElementById('txtAddressDetail').value == "나머지 주소 입력"
				)
				{
					alert("나머지 주소를 입력해 주세요.") ;
					document.getElementById('txtAddressDetail').value = '';
					document.getElementById('txtAddressDetail').focus();
					return false;
				}
				//주소정보 입력 시 비정상적인 단어입력 차단 필터링
				if(CheckPattern(document.getElementById('txtAddressDetail').value, "내용") == false)
				{
					document.getElementById('txtAddressDetail').focus();
					return false;
				}

				// 전화번호 체크
				if (document.getElementById("ddlHomeTel1").value.length > 0
					|| TrimString(document.getElementById("hometel2").value).length > 0
					|| TrimString(document.getElementById("hometel3").value).length > 0)
				{
					if (document.getElementById("ddlHomeTel1").value.length < 1)
					{
						alert("전화번호를 선택해 주세요");
						document.getElementById("ddlHomeTel1").focus();
						return false;
					}
					if (document.getElementById("hometel2").value.length < 1)
					{
						alert("전화번호를 입력해 주세요");
						document.getElementById("hometel2").focus();
						return false;
					}
				
					// 1588과 같은 국번은 마지막 번호가 없어도 가능
					if (!IsRepresentationTelNumber(document.getElementById("ddlHomeTel1").value))
					{
						if (document.getElementById("hometel3").value.length < 1)
						{
							alert("전화번호를 입력해 주세요");
							document.getElementById("hometel3").focus();
							return false;
						}
					}
				
					//유선전화번호 국번 입력시 000, 0000, 111, 1111 입력 차단 필터링
					if ((checkRepetitionForTel(document.getElementById("hometel2").value, 3) == false) 
						|| (checkRepetitionForTel(document.getElementById("hometel2").value, 4) == false))
					{
						alert("정확한 정보를 입력해주세요.");
						document.getElementById('hometel2').focus();				
						return false;
					}
				}
				
				if(CheckLinePhone(document.getElementById('ddlHomeTel1'), document.getElementById("hometel2"), document.getElementById("hometel3"),false,"전화번호")==false) return false;

				//핸드폰 인증 여부 -> 확인중
				if(CheckSMSCert() == false) return false;
			
				//송금 계좌 입력 여부
				if(CheckBankAccount() == false) return false;
				
				// 송금방법 체크
				if (CheckRemitMethod() == false) return false;
			}
			
			
			
			//키보드 보안 작동시 변환
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y')
			{
				var len = form1.elements.length;
				for (i = 0; i < len; i++)
				{
					if ( form1.elements[i].type == "password" )
					{
						value = GetPwdValue_K(form1, Form1.elements[i],"KingsE2E", "", "");
						form1.elements[i].value  = value;
					}
				}
			}
			return true;
		}

		function OpenPostSearch()
		{
		  mywin = window.open("/Common/PostSearch/PostSearchByRoadName.aspx?SearchType=5", "PostNo", "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes,resizable=0,copyhistory=0,width=450 ,height=420");
			mywin.focus();
		}


		// 도로명 새주소 팝업 콜백함수
		function Callback_PostAddressInfo(postNo1, postNo2, address1, roadNameAddress, addressDetail, uID)
		{
		  document.getElementById("txt_postno").value = postNo1 + postNo2.replace(/ /g, "");
		  document.getElementById("txtPostNo").value = postNo1 + postNo2.replace(/ /g, "");
			document.getElementById("txtAddress1").value = address1;
			document.getElementById("txtAddressDetail").value = addressDetail;
		}

		// 신버전(Fulfillment ver.) 새주소 팝업 Open
		function postPopup() {
			var x = 1104,
				y = 650,
				centeredX,
				centeredY;

			centeredY = (screen.height - y) / 2;
			centeredX = (screen.width - x) / 2;

			var myWindow = window.open("/Common/AddressSearch/AddressSearchBridge.aspx?pageType=popup", "addressSearch", "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=1104,height=650,left=" + centeredX + ",top=" + centeredY);
			myWindow.focus();
		}

		// 신버전(Fulfillment ver.) 새주소 팝업 result callback
		function setCommonAddress(zipCode, roadAddr, lotAddr) {
		    document.getElementById("txt_postno").value = zipCode;
		    document.getElementById("txtPostNo").value = zipCode;

		    document.getElementById("txtAddress1").value = roadAddr;
		    document.getElementById("txtAddressDetail").value = ""; //초기화
		}

		// 신버전(Fulfillment ver.) 새주소 팝업 close callback
		function setCommonClose() {

		}

		function CheckNumber(obj){
			var keycode = event.keyCode;
 
			if( !((48 <= keycode && keycode <=57) || keycode == 13 || keycode == 46) ){
				//alert("숫자만 입력 가능합니다.!");
				event.keyCode = 0;  // 이벤트 cancel
			}
		}

		function CheckNumberWithKeyupEvent(obj){
			var keycode = event.keyCode;
 
			if( !((48 <= keycode && keycode <=57) || (96 <= keycode && keycode <=105 ) ||
						keycode == 13 || keycode == 46 || keycode == 8 || keycode == 32 || keycode == 9) ){
				alert("숫자만 입력 가능합니다. 다시 입력해주세요");
				$(obj).val("");
			}
		}

		function CheckKeyInput(obj)
		{	
			return keycheck(this.event);
		}

		function CheckKeyIDInputForm(obj)
		{
			if($("#htxtOldMemberID").val() != "")
			{
				event.keyCode = 0;
				return false;
			}

			return true;
		}

		// 타이머 콜백 - 인증팝업 종료 이벤트 핸들러로 사용 
		function CallbackAuthenticationPopUpCheck() {
			if (!isExistAutenticationPopup)													// 인증팝업이 없다고 기록되어있으면 즉시 종료
				return;
			if(typeof(popupInstance) == 'undefined' || popupInstance.closed)
			{
				isExistAutenticationPopup = false;
				$(".cert-cont").removeClass("certified");							// 인증 완료 상태 취소
				$(".cert-cont .cell").removeClass("selected");				// 모바일 인증 상태 취소
				$(".cert-cont .ipin").removeClass("selected");				// 아이핀 인증 상태 취소
				$(".cert-cont .foreign").removeClass("selected");			// 외국인 인증 상태 취소
			}
			setTimeout("CallbackAuthenticationPopUpCheck()", 300);	// 0.3초후 다시 호출
		}

	//계좌 인증 여부 체크
	function CheckSMSCert()
	{
		if(document.getElementById("hdnCertMobileTel").value == '')
		{
			alert('휴대폰 인증을 받아 주세요.');
			
			//document.getElementById("__Page_ddlCertMobileTel1").focus();
			return false;
		}
		
		return true;
	}

	// 실명인증 실패 오류메시지 팝업
	function ShowIncorrectRealnamePopup() {
		alert("실명이 아니거나 실명등록이 되어있지 않습니다.\n실명인증기관에 문의해주세요.");
	}

	function AuthenticateLater(){
		isExistAutenticationPopup = false;
		$(".noauth").show();
		$(".cert-cont").addClass("certified");					// 인증 완료
		DisableEveryInputArea(false);

		$(".cert-cont .cs-center").addClass("selected");
		//$("#htxtpMemberName").val($("#txt_name").val()); 
		$("#htxtAuthType").val("N");
		$("#htxtCertData").val("dummy_for");
		$("#btn_signup").hide();
		$("#temp_signup").show();
	}

	function Cancel_AuthenticateLater(){
		isExistAutenticationPopup = false;
		$(".noauth").hide();
		$(".cert-cont").removeClass("certified");					// 인증 완료
		DisableEveryInputArea(true);

		$(".cert-cont .cs-center").removeClass("selected");
		//$("#htxtpMemberName").val($("#txt_name").val()); 
		$("#htxtAuthType").val("");
		$("#htxtCertData").val("");
		$("#btn_signup").show();
		$("#temp_signup").hide();
	}

	function AlertForDuplication() {
		if (confirm('회원님께서는 이미 옥션에 가입하셨습니다.\n아이디/비밀번호 찾기로 이동하시겠습니까?')) {
			document.location.href = 'https://memberssl.auction.co.kr/Membership/IDPW/FindID.aspx';
		}
		else {
		}
	}

	// 2014-06-18 회원가입 인증선택 탭 버튼 변경건
	$(function () {
		$('.cert-cont').find('.btn').bind('click focus', function(){
			$('.cert-cont li').removeClass( 'selected' );
			$(this).parent().addClass('selected');
		});
	});
	
	</script>
</head>
<body>
	<!-- header -->
	<script type="text/javascript" src="https://script.auction.co.kr/common/header.js"></script>
	<script type="text/javascript">
<!--
if(typeof(System) == "undefined") document.writeln("<script type='text/javascript' src='https://script.auction.co.kr/arche.main.js'></" + "script>");
//-->
</script>
<script type="text/javascript">
<!--
	var gnbChannelCodeCPP = "";
	var gnbChannelCodeLP = "";
	var gnbChannelCodeHome = "";
//-->
</script>
<script type="text/javascript">
<!--
	if (typeof(jQuery) == "undefined") System.loadFile("https://script.auction.co.kr/common/jquery.js");
	System.loadFile("https://script.auction.co.kr/style/js/common.js");
	System.loadFile("https://script.auction.co.kr/style/js/ui.header.js");
//-->
</script>
<script type="text/javascript">
<!--
	function NavigationBar() {}
	NavigationBar.goUrl = function(category){
		var lcode = category/1000000;
		var lmotors = 'http://www.auction.co.kr/motors/';
		var tour = 'http://tour.auction.co.kr';
		var lcotegory36 = 'http://www.auction.co.kr/category/category36.html';
		var lcontents = 'http://contents.auction.co.kr';
		var ticket = 'http://ticket.auction.co.kr/Home/Main.aspx';
		var ldefault = ''
	lcode = (lcode < 10) ? "0" + lcode : "" + lcode;
	var pageName ="category" + lcode + ".html";
  ldefault = 'http://www.auction.co.kr/category/' + pageName ;
		if (lcode == 56) {
			self.document.location.href = NavigationBar.SafeRedirectUrl(lmotors, '', '', '');
		} else if (lcode == 24) {
			self.document.location.href = NavigationBar.SafeRedirectUrl(tour, '', '', '');
		} else if (lcode == 81) {
			self.document.location.href = NavigationBar.SafeRedirectUrl(lcotegory36, '', '', '');
		} else if (lcode == 82) {
			self.document.location.href = NavigationBar.SafeRedirectUrl(lcontents, '', '', '');
		} else if (lcode == 97) {
			self.document.location.href = NavigationBar.SafeRedirectUrl(ticket, '', '', '');
		} else {
			lcode = (lcode < 10) ? "0" + lcode : "" + lcode;
			var pageName ="category" + lcode + ".html";
		self.location.href = NavigationBar.SafeRedirectUrl(ldefault, '', '', '');
		}
	}
	NavigationBar.goLPUrl = function(category) {
		if ((category % 1000000) == 0) {
			NavigationBar.goUrl(category);
		} else {
		    var ldefault = ''
		}
	}
	NavigationBar.setUrl = function(category) {
		if ((category % 1000000) == 0) {
			NavigationBar.goUrl(category);
		} else {
			var lcode = category/1000000;
		    var ldefault = ''
		    var lhome = 'http://www.auction.co.kr/?redirect=1'
			if(lcode == 56 || lcode == 81 || lcode == 82) {
				self.document.location.href = NavigationBar.SafeRedirectUrl(lhome, '', '', '');
			} else {
	ldefault =	'http://browse.auction.co.kr/list?category=' + category;
		self.document.location.href = NavigationBar.SafeRedirectUrl(ldefault, '', '', '');
			}
		}
	}
	NavigationBar.SafeRedirectUrl = function(url, fwc, cc, fwk) {
		if (!url)  return 'javascript:;'
		return "http://through.auction.co.kr/common/SafeRedirect.aspx?" + ((fwc == null || fwc == "") ? "" : "Fwc=" + fwc) + "&cc=" + ((cc != null) ? cc : "") + ((fwk == null || fwk == "") ? "" : "&Fwk=" + fwk)+ "&next=" + escape(url);
	}
//-->
</script>
<div id="locbar" class="crop">
	<div class="holder">
		<div class="loc">
<a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http://www.auction.co.kr/?redirect=1" class="home">홈</a>
		</div>
	</div>
</div>

	<!-- header //-->

	<form name="frmIPinV2" method="post" action="">
		<input type="hidden" name="m" value="pubmain" />
		<input type="hidden" name="enc_data" value="AgEEQTI5Obsu1aBrD3LC6ZOczhxP9pIVgENWUhr8zHkblMGsWGFplzrhB5E1LmsXuoNqL8RSzfgAOnhZkFq6JOI5fN6Pdh5b9tHTWKFaUIC6TSFqo3tVyt5c+XmyQIipnKStX4VR+/mIhPDhAtda5+S9g8OiE67GJ5ftM8ff5EwkxIZmlidskO2H2UX53GsQayqSn8Fb10d6BV+oPFPGn3to0AfKUOLClRVDwy1brHXW/1uq7ZgBA3NYREib9bCWlWKFWKBcFa24pahf2JzntNCUS/gOQzK/oQH0upCAIxPSDu6Cc6w9TUTUyIfLAmKTQmUeeRoyXFhwKDH5shJq8kGgrdvM+UT1VoGdwSv+BdtC1W3w9Uhr+lMovbOqmlMHYdUQ8y4hAKZgPiQ+oQDJ3YNR1Wk3PUg=" />
		<input type="hidden" name="param_r1" value="" />
		<input type="hidden" name="param_r2" value="" />
		<input type="hidden" name="param_r3" value="" />
	</form> 

	
		
  <form name="form1" method="post" action="./SignupIndivisual.aspx?pMemberType=IS&amp;ReturnType=&amp;AfterRegistUrl=" id="form1">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTgyMjI1MDQ3MA8WAh4TVmFsaWRhdGVSZXF1ZXN0TW9kZQIBFgQCAQ8WAh4HVmlzaWJsZWhkAgIPZBYGAhwPEGQQFQgX7Zy064yA7Y+wIOuyiO2YuCDshKDtg50DMDEwAzAxMQQwMTMwAzAxNgMwMTcDMDE4AzAxORUIF+2ctOuMgO2PsCDrsojtmLgg7ISg7YOdAzAxMAMwMTEEMDEzMAMwMTYDMDE3AzAxOAMwMTkUKwMIZ2dnZ2dnZ2dkZAIhDxBkEBUIBuyEoO2DnQluYXZlci5jb20LaGFubWFpbC5uZXQIZGF1bS5uZXQIbmF0ZS5jb20JZ21haWwuY29tC2hvdG1haWwuY29tDOyngeygkeyeheugpRUIAAluYXZlci5jb20LaGFubWFpbC5uZXQIZGF1bS5uZXQIbmF0ZS5jb20JZ21haWwuY29tC2hvdG1haWwuY29tDGRpcmVjdF9pbnB1dBQrAwhnZ2dnZ2dnZ2RkAiQPZBYGAgMPEGQQFS4M7KCE7ZmU67KI7Zi4AjAyBDAzMDMDMDMxAzAzMgMwMzMDMDQxAzA0MgMwNDMDMDQ0AzA0OQQwNTAyBDA1MDMEMDUwNAQwNTA1BDA1MDYEMDUwNwQwNTA4AzA1MQMwNTIDMDUzAzA1NAMwNTUDMDYxAzA2MgMwNjMDMDY0AzA3MAMwODAEMTUyMgQxNTQ0BDE1NjYEMTU3NwQxNTg4BDE1OTkEMTYwMAQxNjQ0BDE2NjEEMTY2NgQxNjcwBDE2ODgEMTgwMAQxODMzBDE4NTUEMTg3NwQxODk5FS4M7KCE7ZmU67KI7Zi4AjAyBDAzMDMDMDMxAzAzMgMwMzMDMDQxAzA0MgMwNDMDMDQ0AzA0OQQwNTAyBDA1MDMEMDUwNAQwNTA1BDA1MDYEMDUwNwQwNTA4AzA1MQMwNTIDMDUzAzA1NAMwNTUDMDYxAzA2MgMwNjMDMDY0AzA3MAMwODAEMTUyMgQxNTQ0BDE1NjYEMTU3NwQxNTg4BDE1OTkEMTYwMAQxNjQ0BDE2NjEEMTY2NgQxNjcwBDE2ODgEMTgwMAQxODMzBDE4NTUEMTg3NwQxODk5FCsDLmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dkZAIJDxBkEBUIEO2ctOuMgO2PsCDrsojtmLgDMDEwAzAxMQQwMTMwAzAxNgMwMTcDMDE4AzAxORUIEO2ctOuMgO2PsCDrsojtmLgDMDEwAzAxMQQwMTMwAzAxNgMwMTcDMDE4AzAxORQrAwhnZ2dnZ2dnZ2RkAhsPEGQQFTIN7J2A7ZaJIOyEoO2DnQ9ITUPtiKzsnpDspp3qtowOTkjtiKzsnpDspp3qtowIU0PsnYDtlokIU0vspp3qtowM6rK964Ko7J2A7ZaJDOq0keyjvOydgO2WiQzqtZDrs7Tspp3qtowM6rWt66+87J2A7ZaJDOq4sOyXheydgO2WiQbrho3tmJEM64yA6rWs7J2A7ZaJDOuMgOyLoOymneq2jAzrjIDsmrDspp3qtowJ64+E7J207LmYDOuPmeu2gOymneq2jBjrj5nslpHsooXtlanquIjsnLXspp3qtowP66mU66as7Lig7Kad6raMEuuvuOuemOyXkOyFi+ymneq2jAzrtoDqta3spp3qtowM67aA7IKw7J2A7ZaJDOyCsOyXheydgO2WiQzsgrzshLHspp3qtowM7IOB7Zi47KCA7LaVD+yDiOuniOydhOq4iOqzoAbsiJjtmJEM7Iug7JiB7Kad6raMEuyLoOyaqe2YkeuPmeyhsO2VqRLsi6DtlZzquIjsnLXtiKzsnpAM7Iug7ZWc7J2A7ZaJDOyUqO2LsOydgO2WiQzslKjti7DsnYDtlokM7Jm47ZmY7J2A7ZaJDOyasOumrOydgO2WiQnsmrDssrTqta0S7Jyg7KeE7Yis7J6Q7Kad6raMDOyghOu2geydgO2WiQzsoJzso7zsnYDtlokM7KGw7Z2l7J2A7ZaJBuy2le2YkQ/subTsubTsmKTrsYXtgawM7LyA7J2067GF7YGsEu2VmOuCmOuMgO2IrOymneq2jAztlZjrgpjsnYDtlokS7ZWY7J207Yis7J6Q7Kad6raMEu2VnOq1re2IrOyekOymneq2jAztlZztmZTspp3qtowM7ZiE64yA7Kad6raMD+2Zjey9qeyDge2VmOydtBPtmozrho1f64uo7JyE64aN7ZiRFTIN7J2A7ZaJIOyEoO2DnQRBMjYzBEEyNDcEMTUyMwRBMjY2BDE1MzkEMTUzNARBMjYxBDE1MDQEMTUwMwQxNTExBDE1MzEEQTI2NwRBMjM4BDE1NTUEQTI3OQRBMjA5BEEyODcEQTIzMARBMjkwBDE1MzIEMTUwMgRBMjQwBDE1NTAEMTU0NQQxNTA3BEEyOTEEMTU0OARBMjc4BDE1MjYEMTUyNwQxNTUzBDE1MDUEMTUyMAQxNTcxBEEyODAEMTUzNwQxNTM1BDE1MjEEMTUxNgQxNTkwBDE1ODkEQTI3MAQxNTgxBEEyNjIEQTI0MwRBMjY5BEEyMTgEMTU1NAQxNTEyFCsDMmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgwFBnNtc195bgUIZW1haWxfeW4FDXJkb0NlcnRNb2JpbGUFDnJkb090aGVyTnVtYmVyBQhyZG9MYXRlcgUMY2JQcm92aXNpb24xBQljYkZpbmFuY2UFEGNiSW5kaXZpZHVhbEluZm8FDGNiVGF4Q29uZmlybQUMY2JUaGlyZFBhcnR5BQpjYkxvY2F0aW9uBQ9yYklkZW50aXR5SW5mb1kraskdwfPlPsj7o10K7eH7xSazcA==" />
</div>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="1FA9B245" />
</div>
		<div id="hidden_area" style="display:none">
			<!-- 본인인증 설정 -->
			<input name="htxtCertType" type="hidden" id="htxtCertType" />				
			<input name="htxtCertData" type="hidden" id="htxtCertData" />		
			<input name="htxtRequestSeqNo" type="hidden" id="htxtRequestSeqNo" />
			<input name="htxtOldMemberID" type="text" id="htxtOldMemberID" />

      <input name="htxtOldNickName" type="text" id="htxtOldNickName" />
			<input name="htxtOldStoreSellerId" type="text" id="htxtOldStoreSellerId" />
			<input name="htxtOldStoreName" type="text" id="htxtOldStoreName" />
			<input name="htxtOldStoreUrl" type="text" id="htxtOldStoreUrl" />
			<input name="htxtOldStoreInfo" type="text" id="htxtOldStoreInfo" />
			<input name="htxtCertModule" type="hidden" id="htxtCertModule" />	

			<!-- //-->
			<input name="htxtAuthMemberID" type="hidden" id="htxtAuthMemberID" />	
			<input name="htxtMemberType" type="hidden" id="htxtMemberType" />	
			<input name="htxtPassword" type="hidden" id="htxtPassword" />
			<input name="htxtRemitMethod" type="hidden" id="htxtRemitMethod" />

			<!-- 판매자 휴대폰 번호 인증 -->
			<input name="txtCertCount" type="hidden" id="txtCertCount" />
			<input name="hdnVerfSeqNo" type="hidden" id="hdnVerfSeqNo" />
			<input name="hdnSMSSeqNo" type="hidden" id="hdnSMSSeqNo" />
			<input name="hdnCertMobileTel" type="hidden" id="hdnCertMobileTel" />
			<!-- -->

			<!-- 판매자 대표 번호 설정 -->
			<input name="hdnMainNumber" type="text" id="hdnMainNumber" />				
			<input name="hdnMainNumberType" type="text" id="hdnMainNumberType" />		
			<input name="hdnMainNumberCert" type="text" id="hdnMainNumberCert" />	
			<!-- -->

			<input name="htxtpSsn1" type="hidden" id="htxtpSsn1" />
			<input name="htxtpSsn2" type="hidden" id="htxtpSsn2" />
			<input name="htxtpMemberName" type="text" id="htxtpMemberName" />
			<input name="htxtAuthType" type="text" id="htxtAuthType" />

			<!-- 가입버튼 연타 방지 -->
			<input id="AvoidPostTwice" name="AvoidPostTwice" value="" >

			<!-- 가입 버튼 -->
			<input type="submit" name="btnSignup" value="" id="btnSignup" />
			

		</div>
		
    <div id="body">
			<h2 class="tit-join"><img src="https://pics.auction.co.kr/join/h2_tit_join.png" alt="옥션 회원가입"></h2>
				<div class="identi-cert">
					<div class="inner">
						<h3><img src="https://pics.auction.co.kr/join/h3_tit_identi_cert.gif" alt="본인인증"></h3>
						<div id="back" style="color:gray; display:none"></div>
						<div class="cert-cont">
              <!-- 2014-07-30 상담원가입삭제 -->
								<ul>
									<li class="cell">
										<a class="btn" href="#none">휴대폰 인증하기</a>
										<ul>
											<li class="btn_area"><a href="javascript:PopupVerifyIdentityDual();"><img src="https://pics.auction.co.kr/join/btn_certification.png" alt="인증하기"></a></li>
											<!-- 2014-07-23 회원가입 인증선택 탭 버튼 변경건 -->
											<li>옥션은 개정 정보통신망법 제23조에 따라 회원 가입시에는 주민등록번호를 수집하지 않습니다.</li>
											<li>휴대폰 인증은 가입하시는 분 명의의 휴대폰으로만 인증이 가능합니다. (14세 미만 가입 불가)</li>
											<li>인증이 되지 않을 경우, 옥션 고객센터(1588-0184) 혹은 나이스신용평가정보(1588-2486)로 문의하시기 바랍니다.</li>
											<!-- //2014-07-23 회원가입 인증선택 탭 버튼 변경건 -->
										</ul>
									</li>
									<li class="ipin">
										<a class="btn" href="#none">아이핀 인증하기</a>
										<ul>
											<li class="btn_area"><a href="javascript:IPinPopup();"><img src="https://pics.auction.co.kr/join/btn_certification.png" alt="인증하기"></a></li>
											<li>아이핀(i-PIN)은 방송통신위원회에서 주관하는 주민등록번호 대체 수단으로 옥션에 주민등록번호를 입력하지 않고 가입할 수 있는 서비스 입니다.</li>
											<li>아이핀 가입을 위해서는 아이핀 ID가 있어야 합니다. <a target="_blank" href="http://i-pin.kisa.or.kr/kor/issue/method.jsp">아이핀 ID 발급받기</a></li>
											<li>아이핀(i-PIN)에 대해서 아직도 잘 모르신다면? <a target="_blank" href="http://i-pin.kisa.or.kr/kor/about/about.jsp">아이핀 소개 플래시보기</a></li>
										</ul>
									</li>
									<li class="foreign">
										<a class="btn" href="#none">외국인 등록번호 인증하기</a>
										<ul>
											<li class="btn_area"><a href="javascript:ForeignLayer();"><img src="https://pics.auction.co.kr/join/btn_certification.png" alt="인증하기"></a></li>
											<li>
												실명인증이 되지 않는 경우 아래의 실명인증기관에 실명등록을 요청할 수 있습니다.<br />
												<a style="margin-left:0;" target="_blank" href="https://www.namecheck.co.kr/front/personal/register_howtoonline.jsp?menu_num=1&page_num=0&page_num_1=1">나이스신용평가정보</a>(1600-1522)
											</li>
										</ul>
									</li>
								</ul>
								<!-- //2014-07-30 상담원가입삭제 -->
							<p class="cert-finish auth" style="display:none""><strong>본인인증이 완료되었습니다.</strong><br />회원가입을 진행해주세요.</p><!-- 인증완료되었을 경우 메시지 -->
							<p class="cert-finish noauth" style="display:none""><strong>정보입력 후 상담원 인증 신청하기 버튼을 눌러주세요.</strong><br />고객센터(1588-0184)에서 1일 이내(공휴일 제외) 고객님께 연락 드립니다.<br />빠른 인증을 원할 경우 바로 전화주세요.<br /><input type="button" onclick="Cancel_AuthenticateLater();" value="취소" /></p> <!-- 임시가입 클릭 후 메시지 -->
						</div>
					</div>
				</div>
				<div class="info-enter">
					<div class="inner">
						<h3><img src="https://pics.auction.co.kr/join/h3_tit_info_enter.gif" alt="정보입력"></h3>
						<div class="info-cont">
							<ul>
								<li class="entername_area">
									<input name="txt_name" type="text" id="txt_name" class="enter-name placeholder" value="이름" style="width:427px;" maxlength="12" title="이름" placeholder="이름" onfocus="if(this.value == &#39;이름&#39;) 	this.value = &#39;&#39;;" />
								</li>
								<li class="enterid_area">
									<input name="txt_enterid" type="text" id="txt_enterid" onfocus="FocusIn_IDForm(this);" onkeyup="SetTickCount(600);" placeholder="아이디" value="아이디" maxlength="12" class="enter-id placeholder" onblur="FocusOut_IDForm(this)" style="width:427px;" onkeydown="CheckKeyIDInputForm(this);" title="아이디" />

									<!-- 사용가능한 아이디인 경우 input에 class="usable" 추가, 아이디가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<!--p id="tickcount">tickcount =</p-->
									<p class="enter-guide">띄어쓰기 없이 영문과 숫자를 혼합하여 4~12자를 사용할 수 있습니다.</p>
									<p class="txt01" style="display:none">사용가능한 아이디입니다.</p><!-- 사용가능한 아이디인 경우 -->
									<p class="txt02" style="display:none">아이디를 넣어주세요.</p><!-- 아이디가 조건에 맞지않는 경우 -->
								</li>
								<li class="enterpw_area">
									<input type="password" id="txt_enterpw" class="enter-pw placeholder" style="width:427px;" title="비밀번호 입력" maxlength="15" 
									onkeydown="CheckKeyInput(this);" onkeyup="validatePasswordType(this);" 
									onfocus="FocusIn_PwdForm(this);" onblur="FocusOut_PwdForm(this)" >
									<!-- 비밀번호가 안전한 경우 input에 class="usable" 추가, 비밀번호가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<span class="pw-guide"><a href="#" onclick="OpenPasswordGuide();" title="새창으로 열림">비밀번호 도움말</a></span><!-- 2013-06-20 eun -->
									<p class="enter-guide">안전한 사용을 위해 영문, 숫자, 특수문자 조합 6~15자를 사용해 주세요.</p>
									<p class="txt01" style="display:none">완벽한 비밀번호 입니다.</p><!-- 비밀번호가 안전한 경우 -->
									<p class="txt02" style="display:none" id="password_err">유추하기 쉬운 비밀번호 입니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
								</li>
								<li class="enterpw_area">
									<input type="password" onblur="CheckPasswordConfirm();" maxlength="15" title="방금 입력한 비밀번호와 같은 비밀번호를 한번 더 입력해주세요" 
										style="width: 427px;" value="" class="enter-pw enter-repw" id="txt_enterpw_confirm">
									<!-- 비밀번호가 안전한 경우 input에 class="usable" 추가, 비밀번호가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<p style="display:none" class="txt02" id="password_confirm_err">비밀번호가 일치하지 않습니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
								</li>
								<li>
									<span id="mobile_tel1_span">
									<select name="ddlMobileTel1" id="ddlMobileTel1" class="styled" title="휴대폰 앞자리 선택" style="width:133px;">
	<option value="휴대폰 번호 선택">휴대폰 번호 선택</option>
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="0130">0130</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>

</select>
									</span>
									<input type="text" id="mobile_tel1_temp" style="width:123px; display:none" title="선택된 휴대폰 앞자리" />
									<span class="dash">-</span> 
									<input name="mobile_tel2" type="text" id="mobile_tel2" style="width:123px;" maxlength="4" title="휴대폰 중간자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="mobile_tel3" type="text" id="mobile_tel3" style="width:123px;" maxlength="4" title="휴대폰 뒷자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" />
								</li>
								<li>
									<input name="email1" type="text" id="email1" class="placeholder" value="이메일" title="이메일" style="width:120px;" onfocus="this.value=&#39;&#39;;" placeholder="이메일" /> 
									<span class="gol">@</span> 
									<input name="email2" type="text" id="email2" title="이메일 계정 입력" style="width:123px; margin-right:7px; display:none;" />
									<span id="email_span">
										<select name="ddlEmailDomain" id="ddlEmailDomain" class="styled" onchange="ChangeMailDomain(this);" style="width:136px;">
	<option value="">선택</option>
	<option value="naver.com">naver.com</option>
	<option value="hanmail.net">hanmail.net</option>
	<option value="daum.net">daum.net</option>
	<option value="nate.com">nate.com</option>
	<option value="gmail.com">gmail.com</option>
	<option value="hotmail.com">hotmail.com</option>
	<option value="direct_input">직접입력</option>

</select>
									</span>
									<p><label for="sms_yn" ><input name="sms_yn" type="checkbox" id="sms_yn" /> 이벤트/쇼핑정보 SMS 수신에 동의합니다.</label></p>
									<p class="check"><label for="email_yn"><input name="email_yn" type="checkbox" id="email_yn" /> 이벤트/쇼핑정보 이메일 수신에 동의합니다.</label></p>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="divSellerInfo" class="info-enter seller_info">
					<div class="inner">
						<h3><img src="https://pics.auction.co.kr/join/h3_tit_seller_info.gif" alt="판매자 정보입력"></h3>
						<div class="info-cont">
							<ul>
								<!--
								<li class="enternickname_area">
									<input name="txt_nickname" type="text" id="txt_nickname" class="enter-nick" value="판매자 닉네임" style="width:427px;" title="판매자 닉네임 입력" onkeyup="SetNickNameTickCount(600);" onfocus="FocusIn_NickNameForm();" onblur="FocusOut_NickNameForm();" />
									<!--p id="tickcount_NICK">tickcount =</p--
									<p class="enter-guide">띄어쓰기 없이 한글과 영문,숫자를 혼합하여 1~10자를 사용해 주세요.</p>
									<p class="txt01" style="display:none">사용가능한 닉네임입니다.</p>
									<p class="txt02" style="display:none">닉네임을 넣어주세요.</p>
									<ul>										
										<li>등록하신 닉네임은 <span>상품 판매와 관련된 판매자 정보가 노출되는 모든 공간에서 아이디를 대신해 노출</span>됩니다.</li>
										<li>당사의 약관에 위배되는 불법물이나 사회적 도덕적으로 부적합한 문구등은 사용 불가합니다.</li>
									</ul>
								</li>
								//-->
								<li>
									<span id="home_tel1_span">
										<select name="ddlHomeTel1" id="ddlHomeTel1" class="styled" title="전화번호 지역번호 선택" style="width:133px;">
	<option value="전화번호">전화번호</option>
	<option value="02">02</option>
	<option value="0303">0303</option>
	<option value="031">031</option>
	<option value="032">032</option>
	<option value="033">033</option>
	<option value="041">041</option>
	<option value="042">042</option>
	<option value="043">043</option>
	<option value="044">044</option>
	<option value="049">049</option>
	<option value="0502">0502</option>
	<option value="0503">0503</option>
	<option value="0504">0504</option>
	<option value="0505">0505</option>
	<option value="0506">0506</option>
	<option value="0507">0507</option>
	<option value="0508">0508</option>
	<option value="051">051</option>
	<option value="052">052</option>
	<option value="053">053</option>
	<option value="054">054</option>
	<option value="055">055</option>
	<option value="061">061</option>
	<option value="062">062</option>
	<option value="063">063</option>
	<option value="064">064</option>
	<option value="070">070</option>
	<option value="080">080</option>
	<option value="1522">1522</option>
	<option value="1544">1544</option>
	<option value="1566">1566</option>
	<option value="1577">1577</option>
	<option value="1588">1588</option>
	<option value="1599">1599</option>
	<option value="1600">1600</option>
	<option value="1644">1644</option>
	<option value="1661">1661</option>
	<option value="1666">1666</option>
	<option value="1670">1670</option>
	<option value="1688">1688</option>
	<option value="1800">1800</option>
	<option value="1833">1833</option>
	<option value="1855">1855</option>
	<option value="1877">1877</option>
	<option value="1899">1899</option>

</select>
									</span>
									<span class="dash">-</span> 
									<input name="hometel2" type="text" id="hometel2" style="width:123px;" maxlength="4" title="전화번호 국번 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="hometel3" type="text" id="hometel3" style="width:123px;" maxlength="4" title="전화번호 뒷자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" />
								</li>
								<li>
									<span id="cellphone1_seller_span">
										<select name="ddlCellphone1Seller" id="ddlCellphone1Seller" class="styled" title="휴대폰 앞지리 선택" style="width:103px;">
	<option value="휴대폰 번호">휴대폰 번호</option>
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="0130">0130</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>

</select>
									</span>
									<span class="dash">-</span> 
									<input name="cellphone2_seller" type="text" id="cellphone2_seller" style="width:93px;" maxlength="4" title="휴대폰 중간자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="cellphone3_seller" type="text" id="cellphone3_seller" style="width:93px;" maxlength="4" title="휴대폰 뒷자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> 
									<input type="button" value="휴대폰 인증" class="cell-cert" onclick="javascript:goSMSVerification2();">
									<p class="cell-option">
										<label for="rdoCertMobile"><input value="rdoCertMobile" name="option" type="radio" id="rdoCertMobile" onClick="ChangeMainNumberInfo()" />인증받은 휴대폰 번호를 대표번호로 사용</label>
										<label for="rdoOtherNumber"><input value="rdoOtherNumber" name="option" type="radio" id="rdoOtherNumber" onClick="ChangeMainNumberInfo()" />다른번호 등록</label>
										<label for="rdoLater"><input value="rdoLater" name="option" type="radio" id="rdoLater" onClick="ChangeMainNumberInfo()" />다음에 등록함</label>
										<p class="txt02" id="spnInfo" style="display:none">상품 등록 시에는 반드시 대표번호 인증을 받아야 합니다.</p>
									</p>
								</li>
								<li>
									<input type="text" id="txt_postno" value="우편번호" onkeydown="return false;" title="우편번호 입력" placeholder="우편번호" style="width:310px;"/>
									<input name="txtPostNo" type="hidden" id="txtPostNo" />
									<input type="button" onclick="postPopup();" value="우편번호 찾기" class="zipcode">
									<p class="address">
										<input name="txtAddress1" type="text" id="txtAddress1" title="기본 주소 입력" style="width:310px;" />
										<input name="txtAddressDetail" type="text" id="txtAddressDetail" valuㅕe="나머지 주소 입력" title="나머지 주소 입력" style="width:310px; margin-left:3px;" onfocus="this.value=&#39;&#39;;" />
									</p>
								</li>
								<li class="enter_account_area">
									<p class="noti-ment">판매대금을 송금받을 본인계좌를 등록해 주세요. (송금계좌 인증)</p>
									<span id="bankcode_span">
										<select name="ddlBankCode" id="ddlBankCode" class="styled" title="은행 선택" style="width:150px;">
	<option selected="selected" value="은행 선택">은행 선택</option>
	<option value="A263">HMC투자증권</option>
	<option value="A247">NH투자증권</option>
	<option value="1523">SC은행</option>
	<option value="A266">SK증권</option>
	<option value="1539">경남은행</option>
	<option value="1534">광주은행</option>
	<option value="A261">교보증권</option>
	<option value="1504">국민은행</option>
	<option value="1503">기업은행</option>
	<option value="1511">농협</option>
	<option value="1531">대구은행</option>
	<option value="A267">대신증권</option>
	<option value="A238">대우증권</option>
	<option value="1555">도이치</option>
	<option value="A279">동부증권</option>
	<option value="A209">동양종합금융증권</option>
	<option value="A287">메리츠증권</option>
	<option value="A230">미래에셋증권</option>
	<option value="A290">부국증권</option>
	<option value="1532">부산은행</option>
	<option value="1502">산업은행</option>
	<option value="A240">삼성증권</option>
	<option value="1550">상호저축</option>
	<option value="1545">새마을금고</option>
	<option value="1507">수협</option>
	<option value="A291">신영증권</option>
	<option value="1548">신용협동조합</option>
	<option value="A278">신한금융투자</option>
	<option value="1526">신한은행</option>
	<option value="1527">씨티은행</option>
	<option value="1553">씨티은행</option>
	<option value="1505">외환은행</option>
	<option value="1520">우리은행</option>
	<option value="1571">우체국</option>
	<option value="A280">유진투자증권</option>
	<option value="1537">전북은행</option>
	<option value="1535">제주은행</option>
	<option value="1521">조흥은행</option>
	<option value="1516">축협</option>
	<option value="1590">카카오뱅크</option>
	<option value="1589">케이뱅크</option>
	<option value="A270">하나대투증권</option>
	<option value="1581">하나은행</option>
	<option value="A262">하이투자증권</option>
	<option value="A243">한국투자증권</option>
	<option value="A269">한화증권</option>
	<option value="A218">현대증권</option>
	<option value="1554">홍콩상하이</option>
	<option value="1512">회농_단위농협</option>

</select>
									</span>
									<input name="txt_account" type="text" id="txt_account" class="placeholder" value="계좌번호(‘-’없이 숫자만 입력)" title="계좌번호(‘-’없이 숫자만 입력)" placeholder="계좌번호(‘-’없이 숫자만 입력)" style="width:265px; margin-left:6px;" onfocus="this.value=&#39;&#39;; $(&#39;.enter_account_area .txt02&#39;).hide()" />
									<p class="txt02" style="display:none">실명 계좌 인증에 실패했습니다. 예금주명, 은행명, 계좌번호를 확인해 주세요.</p>
									<p class="add-ment">개인회원의 경우 예금주명과 회원명이 일치해야 합니다. (예금주명=회원명)</p>
									<p class="remit-option">
										<label for="rdoSellRemitMethodA"><input type="radio" name="rdoSellRemitMethod" id="rdoSellRemitMethodA" value="A" onclick="document.getElementById('htxtRemitMethod').value = 'A'; CheckAccountValidation();" />인증받은 계좌번호로 온라인 송금 받겠습니다.</label>
										<label for="rdoSellRemitMethodB"><input type="radio" name="rdoSellRemitMethod" id="rdoSellRemitMethodB" value="B" onclick="document.getElementById('htxtRemitMethod').value = 'B'; CheckAccountValidation();" />판매예치금으로 적립 받겠습니다.</label>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>				
				
				<!-- 스토어 정보 -->
				<div id="divStoreInfo" class="info-enter">
					<div class="inner">					
							
<script type="text/javascript">
/*********************************************************************************************************************/
// 타이머 콜백 - 스토어 닉네임 체크용 
var previousTick_StoreName = 0;
var remainTick_StoreName = 0;
var eventSignal_StoreName = false;

function CallbackStoreNameCheck() {
	eventSignal_StoreName = false;
	var inputForm = $("#ucStoreName_txtStoreNickName");
	// 포커스가 없거나 remainTick이 0이면 타이머콜백 종료
	if (!(inputForm.hasClass('focus')) || remainTick_StoreName == 0)
		return;
	var currentTick = new Date().getTime();
	var elapsedTick = currentTick - previousTick_StoreName;
	remainTick_StoreName -= elapsedTick;
	if (remainTick_StoreName <= 0) {
		remainTick_StoreName = 0;
		CheckStoreNameValidation(inputForm);
		//$("#ucStoreName_txtStoreNickName").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick_StoreName); // 디버그 메세지
		return;
	}
	//$("#ucStoreName_txtStoreNickName").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick_StoreName); // 디버그 메세지
	previousTick_StoreName = currentTick;

	// 포커스를 가지고 있다면 다시 타이머 콜백 세팅
	if (inputForm.hasClass('focus') && !eventSignal_StoreName) {
		setTimeout("CallbackStoreNameCheck()", 100);
		eventSignal_StoreName = true;
	}
}

//닉네임 체크 요청까지 남은 시간을 재설정 
function SetStoreNameTickCount(milliSec) {
	remainTick_StoreName = milliSec;
	previousTick_StoreName = new Date().getTime();
	if (!eventSignal_StoreName)
		setTimeout("CallbackStoreNameCheck()", 100);
}

// 서버에 닉네임 유효성 체크 요청(AJAX) 
function CheckStoreNameValidation(obj) {
	// 결과 처리는 비동기 호출이므로 우선 입력폼을 노멀 상태로 세팅
	var current = $('#ucStoreName_txtStoreNickName');
	current.removeClass('incorrect');
	$(".storename_area #txt01").hide();
	$(".storename_area #txt02").hide();
	$(".storename_area #enter-guide").hide();

	// 공란일때는 기본 안내 메세지 출력
	if (obj.val() == '') {
		$(".storename_area #enter-guide").show();
		return;
	}

	//공백문자체크
	if (current.val().indexOf(' ') >= 0) {
		$(".storename_area #txt02").text("스토어 이름에 띄어쓰기는 사용할 수 없습니다.");
		$(".storename_area #txt02").show();
		current.val(current.val().replace(/ /g, ""));
		current.focus();
		return;
	}

	var inArg = { nickName: obj.val() };
	var settings = {
		type: "POST",
		url: "SignupIndivisual.aspx/CheckStoreNameValidation",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(inArg),
		dataType: "json"
	};

	settings.success = function (result) {
	  switch (result.d.GETINFO_ERROR) {
	    case "NICKCHECK_INVALID":
	      break;
	    case "NICKCHECK_TOO_LONG":
	      current.addClass('incorrect');
	      $(".storename_area #txt02").text("스토어 이름은 1~20 바이트까지 입력해 주세요.");
	      $(".storename_area #txt02").show();
	      
	      break;
	    case "NICKCHECK_NOT_ALLOWED_SPECIAL_CHAR":
	      current.addClass('incorrect');
	      $(".storename_area #txt02").text("스토어 이름은 특수문자를 사용할 수 없습니다.");
	      $(".storename_area #txt02").show();
	      break;
	    case "NICKCHECK_ALREADY_USED_NICKNAME":
	      if ($("#htxtOldNickName").val() != "") {	// 재가입시 기존 닉네임이 존재하면,
	        $(".storename_area #txt01").show();
	        current.removeClass('incorrect');
	        current.addClass('usable');
	        break;
	      }
	      current.addClass('incorrect');
	      $(".storename_area #txt02").text("이미 사용중인 이름입니다. 다른 이름을 입력해주세요");
	      $(".storename_area #txt02").show();
	      break;
	    case "NICKCHECK_NO_ERROR":
	      $(".storename_area #txt01").show();
	      current.removeClass('incorrect');
	      current.addClass('usable');
	      break;
	    default:
	      $(".storename_area #enter-guide").show();
	      break;
	  }
	};
	$.ajax(settings);
}

// 닉네임 입력폼에 포커스인
function FocusIn_StoreNameForm() {
	var obj = $("#ucStoreName_txtStoreNickName");
	if (obj.val() == '스토어이름(판매자닉네임)')
		obj.val('');
	obj.addClass('focus');
		if (obj.hasClass('incorrect') || obj.hasClass('usable')) {
		$('.info-enter .info-cont ul .storename_area #enter-guide').hide();
	}
	else {
		$('.info-enter .info-cont ul .storename_area #enter-guide').show();
	}
		CallbackStoreNameCheck();
}
// 닉네임 입력폼에서 포커스아웃
function FocusOut_StoreNameForm() {
	if ($("#ucStoreName_txtStoreNickName").attr("ReadOnly") == "readonly") {
		return;
	}
	var obj = $("#ucStoreName_txtStoreNickName");
	obj.removeClass('focus');
	$('.info-enter .info-cont ul .storename_area #enter-guide').hide();
	CheckStoreNameValidation(obj);
}
/*********************************************************************************************************************/


/*********************************************************************************************************************/
// 타이머 콜백 - 스토어 URL 체크용 
var previousTick_StoreUrl = 0;
var remainTick_StoreUrl = 0;
var eventSignal_StoreUrl = false;

function CallbackStoreUrlCheck() {
	eventSignal_StoreUrl = false;
	var inputForm = $("#ucStoreName_txtStoreUrl");
	// 포커스가 없거나 remainTick이 0이면 타이머콜백 종료
	if (!(inputForm.hasClass('focus')) || remainTick_StoreUrl == 0)
		return;
	var currentTick = new Date().getTime();
	var elapsedTick = currentTick - previousTick_StoreUrl;
	remainTick_StoreUrl -= elapsedTick;
	if (remainTick_StoreUrl <= 0) {
		remainTick_StoreUrl = 0;
		CheckStoreUrlValidation(inputForm);
		//$("#ucStoreName_txtStoreUrl").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick_StoreUrl); // 디버그 메세지
		return;
	}
	//$("#ucStoreName_txtStoreUrl").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick_StoreUrl); // 디버그 메세지
	previousTick_StoreUrl = currentTick;

	// 포커스를 가지고 있다면 다시 타이머 콜백 세팅
	if (inputForm.hasClass('focus') && !eventSignal_StoreUrl) {
		setTimeout("CallbackStoreUrlCheck()", 100);
		eventSignal_StoreUrl = true;
	}
}

//스토어 URL 체크 요청까지 남은 시간을 재설정 
function SetStoreUrlTickCount(milliSec) {
	remainTick_StoreUrl = milliSec;
	previousTick_StoreUrl = new Date().getTime();
	if (!eventSignal_StoreUrl)
		setTimeout("CallbackStoreUrlCheck()", 100);
}

// 서버에 스토어 URL 유효성 체크 요청(AJAX) 
function CheckStoreUrlValidation(obj) {
	// 결과 처리는 비동기 호출이므로 우선 입력폼을 노멀 상태로 세팅
	var current = $('#ucStoreName_txtStoreUrl');
	current.removeClass('incorrect');
	$(".storeurl_area #txt03").hide();
	$(".storeurl_area #txt04").hide();
	//$(".storeurl_area #enter-guide").hide();

	// 공란일때는 기본 안내 메세지 출력
	if (obj.val() == '') {
		//$(".storeurl_area #enter-guide").show();
		return;
	}

	//공백문자체크
	if (current.val().indexOf(' ') >= 0) {
		$(".storeurl_area #txt04").text("스토어 URL에 띄어쓰기는 사용할 수 없습니다.");
		$(".storeurl_area #txt04").show();
		current.val(current.val().replace(/ /g, ""));
		current.focus();
		return;
	}

	var inArg = { url: obj.val() };
	var settings = {
		type: "POST",
		url: "SignupIndivisual.aspx/CheckStoreUrlValidation",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(inArg),
		dataType: "json"
	};

	settings.success = function (result) {
		switch (result.d) {
			case "STOREURLCHECK_INVALID":
				break;
			case "STOREURL_CHECK_ALREADY_USED_URL":
				if ($("#htxtOldNickName").val() != "" && $("#htxtOldStoreUrl").val() != "") {	// 재가입시 기존 스토어 URL 이 존재하면,
					$(".storeurl_area #txt03").show();
					current.removeClass('incorrect');
					current.addClass('usable');
					break;
				}				
				current.addClass('incorrect');
				$(".storeurl_area #txt04").text("이미 사용중인 주소입니다. 다른 주소를 입력해주세요.");
				$(".storeurl_area #txt04").show();
				break;
			case "STOREURL_CHECK_NOT_ALLOWED_SPECIAL_CHAR":
				current.addClass('incorrect');
				$(".storeurl_area #txt04").text("특수문자를 사용할 수 없습니다. 다른 주소를 입력해주세요.");
				$(".storeurl_area #txt04").show();
				break;
			case "STOREURL_CHECK_WRONG_USED_URL":
				current.addClass('incorrect');
				$(".storeurl_area #txt04").text("사용할 수 없는 주소입니다. 다른 주소를 입력해주세요.");
				$(".storeurl_area #txt04").show();
				break;			
			case "STOREURL_CHECK_NO_ERROR":
				$(".storeurl_area #txt03").show();
				current.removeClass('incorrect');
				current.addClass('usable');
				break;
			default:
				//$(".storeurl_area #enter-guide").show();
				break;
		}
	};
	$.ajax(settings);
}

// 스토어 URL 입력폼에 포커스인
function FocusIn_StoreUrlForm() {
	var obj = $("#ucStoreName_txtStoreUrl");
	if (obj.val() == '스토어주소')
		obj.val('');
	obj.addClass('focus');
	if (obj.hasClass('incorrect') || obj.hasClass('usable')) {
		//$('.info-enter .info-cont ul .storeurl_area #enter-guide').hide();
	}
	else {
		//$('.info-enter .info-cont ul .storeurl_area #enter-guide').show();
	}
	CallbackStoreUrlCheck();
}
// 스토어 URL 입력폼에서 포커스아웃
function FocusOut_StoreUrlForm() {
	if ($("#ucStoreName_txtStoreUrl").attr("ReadOnly") == "readonly") {
		return;
	}
	var obj = $("#ucStoreName_txtStoreUrl");
	obj.removeClass('focus');
	//$('.info-enter .info-cont ul .storeurl_area #enter-guide').hide();
	CheckStoreUrlValidation(obj);
}

/*********************************************************************************************************************/

// 특수문자 입력 금지 == > 40:(,	41:),	45:-,	46:.,	95:_
function validate_SpecialChar() {
	if ((event.keyCode > 32 && event.keyCode < 40) ||
			(event.keyCode > 41 && event.keyCode < 45) ||
			(event.keyCode > 46 && event.keyCode < 48) ||
			(event.keyCode > 57 && event.keyCode < 65) ||
			(event.keyCode > 90 && event.keyCode < 94) ||			
			(event.keyCode > 96 && event.keyCode < 97) ||			
			(event.keyCode > 122 && event.keyCode < 127)) {
		event.returnValue = false;
	}
}

function checkMaxNickNameLengthByKeyPress(obj, maxByte) {
  var string = obj.value;
  var b, i, c, increase, increase_prev;
  for (b = i = 0; i < string.length; i++) {
    c = string.charCodeAt(i);
    if (c >= 0x0080 && c <= 0xffff)
      increase = 2;
    else
      increase = 1;
    b += increase;

    if (b > maxByte) {
     /*if (navigator.userAgent.toLowerCase().indexOf('msie') > 0) 
        alert("최대 20바이트까지만 입력할 수 있습니다");*/
      //obj.value = string.substr(0, i);
      //b -= increase_prev;
      $(".storename_area #txt01").hide();
      $(".storename_area #txt02").text("스토어 이름은 1~20 바이트까지 입력해 주세요.");
      $(".storename_area #txt02").show();

      break;
    }
  }
}

// 입력 문자 길이 체크 함수
function check_Strlen(obj, obj2, val) {
	obj2.value = obj.value.length;

	if (obj2.value > val) {
		alert(val + "자를 초과 입력할 수 없습니다.");
		obj.value = obj.value.substring(0, val);
		obj2.value = val;
	}
}
</script>
<h3><img src="https://pics.auction.co.kr/join/h3_tit_store_info.gif" alt="스토어 정보입력"></h3>
<div class="info-cont">
<ul>
	<li class="storename_area">
		<input name="ucStoreName$txtStoreNickName" type="text" id="ucStoreName_txtStoreNickName" onfocus="FocusIn_StoreNameForm();" onkeyup="SetStoreNameTickCount(600); checkMaxNickNameLengthByKeyPress(this,20);" value="스토어이름(판매자닉네임)" maxlength="20" class="placeholder" onblur="FocusOut_StoreNameForm();" style="width:206px;" onkeydown="validate_SpecialChar();" title="스토어이름(판매자닉네임)" />
		<span class="count-txt">(한글, 영문, 숫자만 입력가능)</span>
		<ul>
			<li>등록하신 스토어 이름은 판매자 닉네임으로 활용되어 상품 판매와 관련된 판매자 정보가 노출되는 모든 공간에서<br>아이디를 대신해 노출됩니다.</li>
			<li>당사의 약관에 위배되는 불법물이나 사회적 도덕적으로 부적합한 문구등은 사용 불가합니다.</li>
		</ul>		
		<p class="txt01" id="enter-guide">띄어쓰기 없이 한글과 영문,숫자를 혼합하여 1~20바이트까지 입력해 주세요.</p>		 
		<p class="txt01" id="txt01" style="display:none"><span>사용가능한 이름입니다.</span></p>
		<p class="txt02" id="txt02" style="display:none"><span>스토어 이름을 넣어주세요.</span></p>
	</li>
	<li class="storeurl_area">
		<span>http://stores.auction.co.kr/<span>&nbsp;</span>		
		<input name="ucStoreName$txtStoreUrl" type="text" id="ucStoreName_txtStoreUrl" onkeyup="SetStoreUrlTickCount(600);" onpaste="return false;" value="스토어주소" maxlength="20" title="스토어주소" style="ime-mode:disabled;" onblur="FocusOut_StoreUrlForm();" onkeypress="validate_SpecialChar(); if (event.keyCode == 13) { return checkStoreUrl(); }" onfocus="FocusIn_StoreUrlForm();" class="placeholder" />
		</span>
		<span class="count-txt">영문, 숫자 20자 이내(한글, 특수문자 제외)</span>
		<p class="txt01" id="txt03" style="display:none"><span>사용가능한 주소입니다.</span></p>
		<p class="txt02" id="txt04" style="display:none"><span>주소를 입력해주세요.</span></p>
	</li>
	<li class="storeinfo_area">
		<textarea name="ucStoreName$txtStoreInfo" id="ucStoreName_txtStoreInfo" onkeydown="check_Strlen(this, this.form.txtStoreInfoTxtCnt, 90);" onkeyup="check_Strlen(this, this.form.txtStoreInfoTxtCnt, 90);" maxlength="90">스토어에 오신 것을 환영합니다.</textarea>
		<span class="count-txt"><input type="text" id="txtStoreInfoTxtCnt" class="count" title="현재 문자수" readonly value="18">/90</span>
		<ul>
			<li>줄바꿈은 적용되지 않습니다.(노출 영역에 따라 자동 적용)</li>
			<li>타 쇼핑몰 및 개인 사이트 등의 외부 URL 정보 입력 시 임의 삭제 될 수 있습니다.</li>
		</ul>
	</li>
</ul>
</div>
					</div>				
				</div>
				<!-- //스토어 정보 -->			

				<div class="terms-agree">
					<div class="inner">
						<h3>
							<img id="img_agree03" style="display:none;" src="https://pics.auction.co.kr/join/h3_tit_terms_agree03.gif" alt="약관동의"/><!-- 일반구매회원 일 경우 ~03.gif -->
							<img id="img_agree04" style="display:none;" src="https://pics.auction.co.kr/join/h3_tit_terms_agree05.gif" alt="약관동의"/><!-- 판구매 회원 일 경우 ~04.gif -->
						</h3>
						<div class="terms-cont">
							<div class="all-agree">
								<label for="cb_agreeall"><input type="checkbox" id="cb_agreeall_1" onclick="ToggleAllProvisions(this);" > [전체동의] 옥션 회원가입 약관에 모두 동의합니다.</label>
								<p>[옥션 이용약관, 전자금융거래 이용약관, 개인정보 수집 및 이용, 개인정보의 제3자 제공]<p>
							</div>

							<div class="terms-cont-inner">
								<div class="check-set">
									<label for="cbProvision1"><input name="cbProvision1" type="checkbox" id="cbProvision1" onclick="ConfirmProvision(this, &#39;provision&#39;);" />옥션 이용약관 동의(필수)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/provision1.aspx" class="txt-view-all" target="_blank">약관 전체보기</a>
									<a class="btn-open toggle" href="#none"><span class="hide">약관 보기 열기, 닫기</span></a>
								</div>
								<div class="terms-box provision" style="display:block;">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%"  src="provision1.html" title="옥션 이용약관" ></iframe>
								</div>

								<div class="check-set" >
									<label for="cbFinance"><input name="cbFinance" type="checkbox" id="cbFinance" onclick="ConfirmProvision(this, &#39;finance&#39;);" />전자금융거래 이용약관 동의(필수)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/finance.aspx" class="txt-view-all" target="_blank">약관 전체보기</a>
									<a class="btn-close toggle" href="#none"><span class="hide">약관 보기 열기, 닫기</span></a>
								</div>
								<div class="terms-box finance">
								<iframe scrolling="auto" height="100%" frameborder="0" width="100%" src="finance.html" title="전자금융거래 이용약관"></iframe>
								</div>
								 
								<div class="check-set">
									<label for="cbIndividualInfo"><input name="cbIndividualInfo" type="checkbox" id="cbIndividualInfo" onclick="ConfirmProvision(this, &#39;individual_info_treatment&#39;);" />개인정보 수집 및 이용 동의(필수)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/IndividualInfoTreatment.aspx" class="txt-view-all" target="_blank">약관 전체보기</a>
								<a class="btn-close toggle" href="#none"><span class="hide">약관 보기 열기, 닫기</span></a>
								</div>
								<div class="terms-box individual_info_treatment">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="IndividualInfoTreatment.html" title="개인정보수집 및 이용"></iframe>
								</div>

								<div class="check-set tax_payment_notice">
									<label for="cbTaxConfirm"><input name="cbTaxConfirm" type="checkbox" id="cbTaxConfirm" onclick="ConfirmProvision(this, &#39;tax_payment_notice&#39;);" />세금납부 관련 유의사항 확인(필수)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/TaxPaymentNotice.aspx" class="txt-view-all" target="_blank">약관 전체보기</a>
									<a class="btn-close toggle" href="#none"><span class="hide">약관 보기 열기, 닫기</span></a>
								</div>
								<div class="terms-box tax_payment_notice">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="TaxPaymentNotice.html" title="세금납부 관련 유의사항의 내용입니다."></iframe>
								</div>
							
								<div class="check-set">
									<label for="cbThirdParty"><input name="cbThirdParty" type="checkbox" id="cbThirdParty" onclick="ConfirmProvision(this, &#39;agree_to_provide_personal_info&#39;);" />개인정보의 제3자제공 동의(선택)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/AgreeToProvidePersonalInfo.aspx" class="txt-view-all" target="_blank">약관 전체보기</a>
									<a class="btn-close toggle" href="#none"><span class="hide">약관 보기 열기, 닫기</span></a>
								</div>	
								<div class="terms-box agree_to_provide_personal_info">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="AgreeToProvidePersonalInfo.html" title="개인정보의 제3자제공"></iframe>
								</div>
								

								

								<!-- WPRA-60 위치정보 약관 관련 코딩 요청 --> 
								<div class="check-set">
									<label for="cbLocation"><input name="cbLocation" type="checkbox" id="cbLocation" onclick="ConfirmProvision(this,&#39;cbLocation&#39;);" />옥션 위치정보 이용약관 동의(선택)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/provision3.aspx" class="txt-view-all" target="_blank">약관 전체보기</a>
									<a class="btn-close toggle" href="#none"><span class="hide">약관 보기 열기, 닫기</span></a>
								</div>
								
								<div class="terms-box provision3">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="provision3.html" title="옥션 위치정보 이용약관"></iframe>
								</div> <!-- // WPRA-60 위치정보 약관 관련 코딩 요청 -->
							
								<div class="check-set">
									<label for="cbLicensee"><input name="cbLicensee" type="checkbox" id="cbLicensee" onclick="ConfirmProvision(this, 'cbLicensee');"/>본인은 현재 사업자 등록을 하지 않은 사실을 확인합니다.(필수)</label>
								</div>

							</div>
							<div class="all-agree txt-none">
								<label for="cb_agreeall"><input type="checkbox" id="cb_agreeall" onclick="ToggleAllProvisions(this);" > [전체동의] 옥션 회원가입 약관에 모두 동의합니다.</label>
							</div>
						</div>
					</div>
				</div>
				<div class="use-notice">
					<p>옥션은 온라인 마켓플레이스(장터)로 거래는 모두 회원 간의 커뮤니케이션에 의해 결정됩니다. 따라서 정확한 전화번호 및 주소 (이메일 포함)를 입력하셔야 정상적인 거래가 가능하며, 부정확한 개인정보로 인한 책임과 불이익은 회원 본인이 감수하게 되오니 개인정보 입력 시 유의하시기 바랍니다.</p>
				</div>
				<div class="btns-box">
					<input id="btn_signup" type="button" value="회원가입" class="join" onclick="ClickSignupButton();">
					<a id="temp_signup" style="display:none;" href="#" onclick="javascript:ClickSignupButton();"><img src="https://pics.auction.co.kr/join/btn_temporary_join.gif" /></a>
					<input type="button" value="취소" class="cancel">
				</div>
				<!-- layer popup start -->
				<div class="popup-outter pop-foreigner" style="display:none;">
					<div class="dimmed"></div>
					<div class="popup-wrap" >
						<div class="popup-inner" >
							<div class="popup-head">
								<h2><img src="https://pics.auction.co.kr/join/h2_foreign_cert.png" alt="외국인 등록번호 인증"></h2>
							</div>
							<div class="popup-cont-outter">
								<div class="popup-cont">
									<label class="agree"><input value="rbIdentityInfoY" name="rbIdentityInfo" type="radio" id="rbIdentityInfoY" />고유식별정보 동의</label>
									<label class="noagree"><input type="radio" id="rbIdentityInfoN" name="rbIdentityInfo" >동의하지 않음</label>
									<div class="txt-box">
										<p class="first">※ 당사는 고유식별정보의 처리를 위하여 개인정보보호법 제 24조에 따라 별도의 동의를 득한 후처리를 합니다.</p>
										<p>1. 개인정보의 처리 목적<br />
										본인 실명확인, 미성년자와의 거래 확인</p>
										<p>2. 처리하려는 개인정보의 항목<br />
										외국인등록번호</p>
										<p>3. 개인정보의 보유 및 이용기간<br />
										원칙적으로 수집목적 및 제공받은 목적을 달성하기까지 보관하며, 목적이 달성되면 지체 없이<br />
										파기합니다. 따라서 회원가입 시 관련 법령에 의해 실명인증 및 연령확인 목적으로 수집한<br />
										외국인등록번호는 별도로 저장하지 않습니다.</p>
									</div>
									<ul class="enter-list">
										<li><input name="txtForeignMemberName" type="text" id="txtForeignMemberName" value="이름" onfocus="this.value=&#39;&#39;;" /> <label for="key_sec" ><input id="key_sec" type="checkbox" onchange="ChangeKeyboardSecurity(this);" > 키보드 보안 ON</label></li>
										<li><input name="txtSsn" type="text" id="txtSsn" value="외국인 등록번호(-없이 입력해주세요)" onfocus="this.value=&#39;&#39;;" onkeyUp="CheckNumberWithKeyupEvent(this);" /></li>
									</ul>
									<p class="guide-ment">※ 입력하신 외국인등록번호는 실명인증 및 연령확인을 위해서만 사용하며, 별도 DB로는 저장되지 않습니다.</p>
								</div>
								<div class="btn-bottom">
									<input type="button" value="인증하기" onclick="CallAuthenticateForeigner();">
								</div>
							</div>
							<input type="button" value="팝업창 닫기" class="close" onclick="$('.pop-foreigner').hide();" />
						</div>
					</div>
				</div>
				<!-- //layer popup end -->
				<!-- 상담원 인증 신청 팝업 -->
				<div id="div_cs_certified" class="popup-outter pop-cs-certified" style="display:none;">
					<div class="dimmed"></div>
					<div class="popup-wrap">
						<div class="popup-inner">
							<div class="popup-head">
								<h2>상담원 인증 신청 완료</h2>
							</div>
							<div class="popup-cont-outter">
								<div class="popup-cont">
									<strong>상담원 인증 신청이 완료되었습니다.</strong>
									<p>
										<strong>고객센터(<em class="num">1588-0184</em>)</strong>에서 1일 이내(공휴일 제외) 연락 드려 인증 및 최종가입을 도와 드립니다.<br />
										빠른 인증을 원하실 경우 바로 고객센터로 전화주세요.<br />
										<span>(로그인은 상담원 인증 완료 후 가능합니다.)</span>
									</p>
								</div>
								<div class="btn-bottom">
									<input type="button" value="닫기" onclick="location.href='http://www.auction.co.kr';">
								</div>
							</div>
							<input type="button" value="팝업창 닫기" class="close" onclick="location.href='http://www.auction.co.kr';" />
						</div>
					</div>
				</div>
				<!-- //상담원 인증 신청 팝업 -->
			</div>
    
<script type="text/javascript">
<!--
document.domain = 'auction.co.kr';//-->
</script>
</form>
		<script type="text/javascript" src="https://script.auction.co.kr/common/footer.js"></script>
	</body>
</html>