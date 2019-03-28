<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
	<html lang="ko-KR">
	<head>
		<meta http-equiv="content-type" content="text/html;charset=KSC5601">
    <title>��ī��Ű ���</title>
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
      
				// input ����� ����
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

        // �����Է¹��� keypress �̺�Ʈ�� ��� (#txt_nickname)
		$("#txt_enterid, #txt_enterpw, #txt_enterpw_confirm, #mobile_tel2, #mobile_tel3, #email1, #ucStoreName_txtStoreNickName, #hometel2, #hometel3, #cellphone2_seller, #cellphone3_seller, #txt_account, #ucStoreName_txtStoreUrl").bind("keypress", function (e) {
          Events.PreventSpace(e);
        });

        // ���ڸ� �Է¹��� �� �ֵ��� keypress �̺�Ʈ�� ���
        $("#mobile_tel2, #mobile_tel3, #hometel2, #hometel3, #cellphone2_seller, #cellphone3_seller, #txt_account").bind("keypress", function (e) {
          Events.CheckDigit(e);
        });

        // �ѱ��Է¹���
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

			// ������� üũ�� ���󺯰�
			window.onload = $(function (){
				var $checkbox = $('.terms-cont input[type=checkbox]');
				$checkbox.removeAttr('checked');
				$checkbox.bind('click onfocus',function chked (){
					if($(this).is(':checked')){$(this).closest('.check-set').next('.terms-box').addClass('check');}
					else{$(this).closest('.check-set').next('.terms-box').removeClass('check');};
				});
			});

			// ������뺸��
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

      // ���鸷��
      Events.PreventSpace = function (e) {

        if (e.which && (e.which == 13 || e.which == 32)) {
          e.preventDefault();
        }
      }

      // ���ڸ� �Է¹��� �� �ֵ��� keypress �̺�Ʈ�� ó��
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
				if (obj.value == '���̵�')
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
				if (obj.value == '��й�ȣ')
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
					errDisplayObj.text("��й�ȣ�� ���Է����ּ���");
					errDisplayObj.show();

					passwdConfirmObj.addClass("incorrect");
					hdnPwdObj.val("");
				}
				else if (passwdObj.val() != passwdConfirmObj.val()) {
					errDisplayObj.text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
				$(".cert-cont").addClass("certified");	// ���� �Ϸ�
				DisableEveryInputArea(false);
				$("#txt_name").attr("disabled",true);	// �̸��Է�â�� ������ disabled �Ǿ�� �Ѵ�

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


				if(isForeign)																		// �ܱ��� ���� �Ϸ� ��
				{
					$(".cert-cont .foreign").addClass("selected");
					$("#txt_name").val($("#htxtpMemberName").val()); 
					$("#htxtAuthType").val("F");
					$("#htxtCertData").val("dummy_for");
					return;
				}

				if(mobilePhone =="")														// ������ ���� �Ϸ� ��
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

				//$(".cert-cont .cell").addClass("selected");			// �̰��� �����Ͽ��ٸ� �ڵ��� ���� �Ϸ� �Ȱ�
				$("#htxtAuthType").val("M");
				// �̸��� ���������� AJAXȣ��
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
				var mtel1 = mobilePhone.substr(0,4);						// �ִ� 4�ڸ��ϼ��� �ִ� ������ ����
				var offset1 = 0;
				var offset2 = 0;

				for (var i = 0; i < document.form1.ddlMobileTel1.length; i++) {
					if (mtel1.indexOf(document.form1.ddlMobileTel1.options[i].value) != -1) // ��ġ�ϴ� ������ �߰ߵǸ�
					{
						document.form1.ddlMobileTel1.options[i].selected = true;
						$("#mobile_tel1_span").hide();
						$("#mobile_tel1_temp").show();
						$("#mobile_tel1_temp").val(document.form1.ddlMobileTel1.options[i].value);
						offset1 = document.form1.ddlMobileTel1.options[i].value.length;
						break;
					}
				}

				if ($("#ddlMobileTel1 option:selected").val() == "")	// ���õ� ������ ������ ����
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

			// �޴�����ȣ ���� �˾�
			var isExistAutenticationPopup;
			var popupInstance;
			function PopupVerifyIdentity() {

				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// ���� �˾��� �������� ��� ����
				
				var nextUrl = "https%3a%2f%2fmemberssl.auction.co.kr%2fMembership%2fSignup%2fIPinReturnPopup.aspx%3fCertType%3dM%26param_r1%3dIS%26ReturnType%3d";
				var popupUrl = "https://memberssl.auction.co.kr/Common/popup/VerifyIdentityPopup.aspx?mtype=M&ctype=K&next=" + nextUrl;
				popupInstance = window.open(popupUrl,'verifyPop','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=500,height=461,left=120,top=160');
				popupInstance.focus();
				isExistAutenticationPopup = true;

				$(".cert-cont .cell").addClass("selected");						// ���� ���� ����
				$(".cert-cont .ipin").removeClass("selected");				
				$(".cert-cont .foreign").removeClass("selected");			
				CallbackAuthenticationPopUpCheck();										// �˾�â ���� ���� �ڵ鷯 (�ݹ� �Լ�)
			}

			// �޴��� ���� �˾� - ����� (���� KMC��� ���)
			function PopupVerifyIdentityBackup() {

				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// ���� �˾��� �������� ��� ����
				
				var popupUrl = "https://memberssl.auction.co.kr/Common/popup/VerifyIdentityPopupBackup.aspx?mtype=M&ctype=K&memberType=IS";
				popupInstance = window.open(popupUrl,'verifyPop','width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250');
				popupInstance.focus();
				isExistAutenticationPopup = true;

				$(".cert-cont .cell").addClass("selected");						// ���� ���� ����
				$(".cert-cont .ipin").removeClass("selected");				
				$(".cert-cont .foreign").removeClass("selected");			
				CallbackAuthenticationPopUpCheck();										// �˾�â ���� ���� �ڵ鷯 (�ݹ� �Լ�)
			}

			// NICE���¸� �Ǵ��Ͽ� ���������� �޴��� ���� ������ ȣ��
			function PopupVerifyIdentityDual(mtype) {
			
			if ("NOMAL" != "NOMAL" || GetCookie("OnlyKMC") == "true")
				PopupVerifyIdentityBackup(mtype);
			else
				PopupVerifyIdentity(mtype);
			}

			// ������ �˾�
			function IPinPopup() {

				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// ���� �˾��� �������� ��� ����
				
				popupInstance = window.open("", "popupIPIN2", "width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no");
				document.frmIPinV2.target = "popupIPIN2";
				document.frmIPinV2.action = "https://cert.vno.co.kr/ipin.cb";
				document.frmIPinV2.param_r1.value = document.getElementById("htxtMemberType").value;
				document.frmIPinV2.param_r2.value = "";	
				document.frmIPinV2.param_r3.value = "";
				document.frmIPinV2.submit();
				isExistAutenticationPopup = true;
				//$(".cert-cont").addClass("certified");								// ���� �Ϸ� ����(��ư �̹��� ����)
				$(".cert-cont .ipin").addClass("selected");						// ���� ���� ����
				$(".cert-cont .cell").removeClass("selected");				
				$(".cert-cont .foreign").removeClass("selected");			
				CallbackAuthenticationPopUpCheck();										// �˾�â ���� ���� �ڵ鷯 (�ݹ� �Լ�)
				
			}

			// �ܱ��ε�Ϲ�ȣ ���� üũ �˾�
			function ForeignLayer() {
				if(typeof(popupInstance) != 'undefined' && !popupInstance.closed)
					popupInstance.window.close();												// ���� �˾��� �������� ��� ����

				$(".cert-cont .cell").removeClass("selected");				// ���� ���� ����
				$(".cert-cont .foreign").removeClass("selected");			// ���� ���� ����
				$(".pop-foreigner").show();
				if (GetCookie("KeySecurity") == 'Y')
					document.getElementById("key_sec").checked = true;
					
			}

			function CallAuthenticateForeigner() {

				if ("IS" == 'IB1') {
					if (!document.getElementById("rbIdentityInfoY").checked) {
						alert('�⺻���� ���񽺸� ����� ���Ͽ� �����ĺ����� ó���� ������ �ּž� �մϴ�.');
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

			////// �����ID ��ȿ�� üũ ////////////

			/*[�Է��� ID ��ȿ�� �˻� �� �ߺ�Ȯ�� �˾� ǥ��] membersignup.js�� �ִ� �Լ��� ���� ����*/
			function CheckID(TextBoxControl, valueReset, messageControl)
			{
				inputValue = TextBoxControl.value.replace(/ /g, "") ;
				if (inputValue.length ==0)
				{
					messageControl.innerHTML ="����� ���̵� �Է��ϼ���.";	// �����δ� ������� �ʴ´�.
					if(valueReset){TextBoxControl.value="";}
					//TextBoxControl.focus();
					return false;
				}
				//1.�Է°�üũ
				if(inputValue.replace(/[A-Za-z0-9]/g,"").length!=0){
					messageControl.innerHTML ="���̵�� ����, ���ڸ� ����Ͻ� �� �ֽ��ϴ�.";
					if(valueReset){TextBoxControl.value="";}
					//TextBoxControl.focus();
					return false;
				}
			
				//1.���鹮��üũ
				if(TextBoxControl.value.indexOf(' ') >= 0)
				{
					messageControl.innerHTML = "���̵� ����� ����� �� �����ϴ�.";
					TextBoxControl.value = TextBoxControl.value.replace(/ /g, "") ;
					//TextBoxControl.focus();
		
					return false;
				}

				//2.����üũ
				if (inputValue.length < 4 || inputValue.length > 12) {
					messageControl.innerHTML ="���̵�� 4~12�ڸ� ����� �ּ���.";
					if(valueReset){TextBoxControl.value="";}
					//TextBoxControl.focus();
					return false;
				}
				return true;
			}
			
			
			// Ÿ�̸� �ݹ� - IDüũ�� 
			var previousTick = 0;
			var remainTick = 0;
			var eventSignal = false;
			function CallbackIDCheck() {
				eventSignal = false;
				var inputForm = document.getElementById("txt_enterid");
				// ��Ŀ���� ���ų� remainTick�� 0�̸� Ÿ�̸��ݹ� ����
				if (!($(inputForm).hasClass('focus')) || remainTick == 0)
					return;
				var currentTick = new Date().getTime();
				var elapsedTick = currentTick - previousTick;
				remainTick -= elapsedTick;
				if(remainTick <= 0)
				{
					remainTick = 0;
					CheckIDValidation(inputForm);
					//$("#tickcount").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick); // ����� �޼���
					return;
				}
				//$("#tickcount").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick); // ����� �޼���
				previousTick = currentTick;

				// ��Ŀ���� ������ �ִٸ� �ٽ� Ÿ�̸� �ݹ� ����
				if ($(inputForm).hasClass('focus') && !eventSignal) {
					setTimeout("CallbackIDCheck()", 100);
					eventSignal = true;
				}
			}

			//���� �ð��� �缳�� - Ÿ�̸� �ݹ� ��Ʈ
			function SetTickCount(milliSec) {
				remainTick = milliSec;
				previousTick = new Date().getTime();
				if(!eventSignal)
					setTimeout("CallbackIDCheck()", 100);
			}
			
			// ������ ��ȿ�� üũ ��û(AJAX) - Ÿ�̸� �ݹ�
			function CheckIDValidation(obj) {
				// ��� ó���� �񵿱� ȣ���̹Ƿ� �켱 �Է����� ��� ���·� ����
				var current = $('.info-enter .info-cont .enter-id');
				current.removeClass('incorrect');
				current.removeClass('usable');
				$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
				$('.info-enter .info-cont ul .enterid_area .txt01').hide();
				$('.info-enter .info-cont ul .enterid_area .txt02').hide();

				// �����϶��� �⺻ �ȳ� �޼��� ���
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
							$('.info-enter .info-cont ul .enterid_area .txt02').text("�̹� ������� ���̵��Դϴ�.");
							current.addClass('incorrect');
							$('.info-enter .info-cont ul .enterid_area .txt02').show();
							break;
            case "IDCHECK_CANNOT_USE_ANYMORE":
						case "IDCHECK_NOCELLPHONE":
							$('.info-enter .info-cont ul .enterid_area .txt02').text("��� �Ұ����� ���̵��Դϴ�.");
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

			/////// �н����� üũ ////////////////////////////////////////////////////////

			// �� Ű�Է½� ȣ��. �������� �����Ͽ� ����
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
							message = "������ ����� ���� " + passwordType + "�� �̻� �Է����ּ���";
							break;
						case "01":
							message = "������ ����� ���� ���ڸ� ����� �� �����ϴ�.";
							break;
						case "02":
							message = "������ ����� ���� ������ ����� �� �����ϴ�.";
							break;
						case "03":
							message = "������ ����� ���� Ư�����ڸ� ����� �� �����ϴ�.";
							break;
						case "04":
							message = "���ӵǴ� ���ڿ� ���ڸ� ����Ͻ� �� �����ϴ�.";
							break;
						case "05":
							message = "������ ����, ���ڸ� �ݺ��ؼ� ����Ͻ� �� �����ϴ�.";
							break;
						case "11":
							message = "������ ����� ���� ���ڸ� ����� �� �����ϴ�.";
							break;
						case "12":
							message = "������ ����� ���� ������ ����� �� �����ϴ�.";
							break;
						case "13":
							message = "������ ����� ���� Ư�����ڸ� ����� �� �����ϴ�.";
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
							message = "��밡���� ���������� ��й�ȣ�Դϴ�.";
							break;
						case "31":
							message = "�ſ� ������ ��й�ȣ �Դϴ�.";
							break;
						
					}
					$('.info-enter .info-cont ul .enterpw_area .txt01').text(message);
				}

								
			}

			// �н����� �Է�â�� ��Ŀ�� �ƿ��ɶ� �н����� ��ȿ���� üũ����
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
					//$('.info-enter .info-cont ul .enterpw_area .txt01').text("������ ��й�ȣ �Դϴ�.");
				}
			}
				

			// MemberSignup.js ���� �����Ͽ� ����
			function CheckPasswordWithID(passwordControl, id) {
				if (!CheckPassword(passwordControl))
					return false;

				var pwd1 = passwordControl.value;
				if (window.ActiveXObject && GetCookie('KeySecurity') == 'Y') //Ű���� ���ȵ��۽�
				{
					pwd1 = GetPwdValue_K(passwordControl.form, passwordControl, "KingsE2E", "", "");
				}

				//ID�� ��й�ȣ�� 4�� �̻� �ߺ��Ǵ��� üũ
				if (checkDuplicate(id, pwd1, 4) == false) {
					objPw.strSecType = "";
					passwordControl.value = "";
					passwordControl.value = "";
					passwordControl.focus();
					$('#password_err').text("ID���� ���������� ���Ե� ��й�ȣ�� ����� �� �����ϴ�.");
					return false;
				}
				return true;
			}

			// MemberSignup.js ���� �����Ͽ� ����. �׽�Ʈ �� js���Ͽ� ���Կ���.
			function CheckPassword(passwordControl) {
				var bFlag = true;
				if (passwordControl.value.length == 0) { return false; }

				var secType = objPw.getType(passwordControl);
				if (secType.length == 2) {
					if (parseInt(secType.split("")[0]) < 2) //���Ұ�
					{
						bFlag = false;
					}
				}
				else {
					bFlag = false;

				}
				if (bFlag == false) {
					//$('.info-enter .info-cont ul .enterpw_area .txt02').text("��й�ȣ�� ����,����,Ư�������� �ΰ����� ������\n" + passwordType + "~15�ڸ� ���ڷ� �Է��ϼž� �մϴ�");
					objPw.strSecType = "";
					//passwordControl.value = "";
					//passwordControl.focus();
					return false;
				}
				return true;
			}

			//��� üũ ���ߴ��� Ȯ��
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

			// ��� üũ �ڽ� ó��
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

			/////// ���� ���� üũ  //////////////////////////////////////////////////////
			function CheckBankAccount() {
				if (document.getElementById('ddlBankCode').value == '���� ����') {
					alert('������� �����Ͻñ� �ٶ��ϴ�.');
					//document.getElementById('ddlBankCode').focus();
					return false;
				}

				var accountNo = document.getElementById('txt_account').value;

				var filter = /[^0-9]/;

				if (accountNo.replace(/ /g, "").length == 0) {
					alert('���¹�ȣ�� �Է��Ͻñ� �ٶ��ϴ�.');
					document.getElementById('txt_account').focus();
					return false;
				}

				if (filter.test(accountNo)) {
					alert("���¹�ȣ�� '-'���� ���ڸ� �Է��Ͻñ� �ٶ��ϴ�.");
					document.getElementById('txt_account').focus();
					return false;
				}
			}

			// �۱ݹ�� ���� üũ
			function CheckRemitMethod() {
				if (document.getElementById("htxtRemitMethod").value == "") {
					alert("�۱ݹ���� �������ּ���.");
					return false;
				}
			}

			// ������ ��ȿ�� üũ
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

			//�޴��� ���� �˾� ie ����
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

			//�޴��� ���� �˾� union ����
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

			//�޴��� ���� ���� �Է� ����
			function checkVerificatoinSMSValue() {
				if (document.getElementById('ddlCellphone1Seller').value == '' ||
				document.getElementById('cellphone2_seller').value.replace(/ /g, "").length == 0 ||
				document.getElementById('cellphone3_seller').value.replace(/ /g, "").length == 0) {
					alert('�������� �޴��� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.');
					document.getElementById('ddlCellphone1Seller').focus();
					return false;
				}

				if (document.getElementById("txtCertCount").value == '')
					document.getElementById("txtCertCount").value = 1;
				else
					document.getElementById("txtCertCount").value++;

				if (document.getElementById("txtCertCount").value > 5) {
					alert('�޴��������� 5ȸ������ ���˴ϴ�.');
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

			//��ǥ��ȣ ���� �˾�
			function MainNumberValidation() {
				var myObject = new Object();

				myObject.window = window;

				var result;
				var url = "../../Common/Popup/MainNumberValidation.aspx?InputType=S";


				if (navigator.appVersion.indexOf("MSIE 6.0") >= 0) {   // IE6.0�� ���				
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

			// ��� ����
			function CheckProvisionAgreement() {

				if(document.getElementById("cbProvision1").checked == false){
					alert("���� �̿����� �������� �����̽��ϴ�.");
					$("#cbProvision1").select();
					$("#cbProvision1").focus();
					return false;
				}
								
				if(document.getElementById("cbFinance").checked == false){
					alert("���� ���ڱ������� �̿����� �������� �����̽��ϴ�.");
					$("#cbFinance").select();
					$("#cbFinance").focus();
					return false;
				}	
	
				if (document.getElementById("cbIndividualInfo").checked == false) {
					alert("�������� ���� �� �̿����� �������� �����̽��ϴ�.");
					$("#cbIndividualInfo").select();
					$("#cbIndividualInfo").focus();
					return false;
				}

				if("IS" == 'IS' && document.getElementById("cbTaxConfirm").checked == false) {
					alert("���� ���� ���� ���ǻ����� Ȯ������ �����̽��ϴ�.");
					$("#cbTaxConfirm").select();
					$("#cbTaxConfirm").focus();
					return false;
				}

				if ("IS" == 'IS' && document.getElementById("cbLicensee").checked == false) {
					alert("����� ��Ͽ��� Ȯ�����ּ���. ���θ��Ƿ� ����� ����ڰ� �ִٸ� �����Ǹ��ڷ� ������ �� �����ϴ�. ����� �Ǹ�ȸ������ �������ּ���");
					$("#cbLicensee").select();
					$("#cbLicensee").focus();
					return false;
				}
				 
			return true;
		}

		// ��� ��� ���� üũ�ڽ� ���
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

		// ���� ��ư Ŭ��
		function ClickSignupButton() {
			if($("#AvoidPostTwice").val() != '')
			{
				alert('ó�����Դϴ�. ��ø� ��ٷ��ֽʽÿ�');
				return false;
			}
			
			if($("#htxtAuthType").val()!="N" && $("#htxtCertType").val() =="")	// ���� üũ
			{
				alert("���������� ���� �ʾҽ��ϴ� ������ �Ϸ����ּ���.");
				return false;
			}

			if(!CheckInput())								// �Է°� üũ
				return false;
			
			if(!CheckProvisionAgreement())	// ��� üũ
				return false;
						
			$("#AvoidPostTwice").val("POSTBACK");	// ���Թ�ư�� ������ �����°��� ����
			
			$("#ddlMobileTel1").attr("disabled",false);
			$("#mobile_tel2").attr("disabled",false);
			$("#mobile_tel3").attr("disabled",false);

			if($("#htxtAuthType").val() =="N")
			{
				$("#htxtpMemberName").val($("#txt_name").val());
			}
			$('#btnSignup').click();		// ���� ��û
		}






		//Ű���� ���� ��ư Ŭ��
		function ChangeKeyboardSecurity(obj) {
			if (obj.checked == true) {
				// do : ��� ��ȯ
				Run_KeyBoard1("Y");

			} else {
				// do : ��� ��ȯ
				Run_KeyBoard1("N");
			}
		}

		function Run_KeyBoard1(aa) {
			if (aa == "Y") {
				if (GetCookie("KeySecurity") == 'Y') return;
				if (KeyboardSecurity_installed() == false) {
					//�˾�â�� �ٿ�� �������� ���ε� �Ѵ�.
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

		//�ݺ��� �������� üũ
		function CheckPattern(value, name) {
			//�ݺ� ���� 3�� �̻� �Է� ���� üũ
			if (checkRepetitionForAddress(value, 3) == false) {
				alert("��Ȯ�� ������ �Է����ּ���.");
				return false;
			}

			//�ݺ� ������������ 2�� �̻� �Է� ���� üũ
			if (checkRepetitionHangeul(value) == false) {
				alert("��Ȯ�� ������ �Է����ּ���.");
				return false;
			}

			//�ݺ� ���� 6�� �̻� �Է� ���� üũ
			if (checkNumRepetition(value, 6) == false) {
				alert("��Ȯ�� ������ �Է����ּ���.");
				return false;
			}

			return true;
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*************************************************************************************************************
		// Ÿ�̸� �ݹ� - �г��� üũ��
		var previousTick_NICK = 0;
		var remainTick_NICK = 0;
		var eventSignal_NICK = false;
		function CallbackNickNameCheck() {
			eventSignal_NICK = false;
			var inputForm = $("#txt_nickname");
			// ��Ŀ���� ���ų� remainTick�� 0�̸� Ÿ�̸��ݹ� ����
			if (!(inputForm.hasClass('focus')) || remainTick_NICK == 0)
				return;
			var currentTick = new Date().getTime();
			var elapsedTick = currentTick - previousTick_NICK;
			remainTick_NICK -= elapsedTick;
			if(remainTick_NICK <= 0)
			{
				remainTick_NICK = 0;
				CheckNickNameValidation(inputForm);
				//$("#tickcount_NICK").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick_NICK); // ����� �޼���
				return;
			}
			//$("#tickcount_NICK").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick_NICK); // ����� �޼���
			previousTick_NICK = currentTick;

			// ��Ŀ���� ������ �ִٸ� �ٽ� Ÿ�̸� �ݹ� ����
			if (inputForm.hasClass('focus') && !eventSignal_NICK) {
				setTimeout("CallbackNickNameCheck()", 100);
				eventSignal_NICK = true;
			}
		}

		//�г��� üũ ��û���� ���� �ð��� �缳�� 
		function SetNickNameTickCount(milliSec) {
			remainTick_NICK = milliSec;
			previousTick_NICK = new Date().getTime();
			if(!eventSignal_NICK)
				setTimeout("CallbackNickNameCheck()", 100);
		}
		
		// ������ �г��� ��ȿ�� üũ ��û(AJAX) 
		function CheckNickNameValidation(obj) {
			// ��� ó���� �񵿱� ȣ���̹Ƿ� �켱 �Է����� ��� ���·� ����
			var current = $('#txt_nickname');
			current.removeClass('incorrect');
			$(".enternickname_area .txt01").hide();
			$(".enternickname_area .txt02").hide();
			$(".enternickname_area .enter-guide").hide();
			
			
			// �����϶��� �⺻ �ȳ� �޼��� ���
			if (obj.val() == '')
			{
				$(".enternickname_area .enter-guide").show();
				return;
			}

			//���鹮��üũ
			if(current.val().indexOf(' ') >= 0)
			{
				$(".enternickname_area .txt02").text("�г��ӿ� ����� ����� �� �����ϴ�.");
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
						$(".enternickname_area .txt02").text("�г����� 1~10�ڸ� ����� �ּ���.");
						$(".enternickname_area .txt02").show();
						break;
					case "NICKCHECK_NOT_ALLOWED_SPECIAL_CHAR":
						current.addClass('incorrect');
						$(".enternickname_area .txt02").text("�г����� Ư�����ڸ� ����� �� �����ϴ�.");
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
						$(".enternickname_area .txt02").text("�̹� ������� �г����Դϴ�.");
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

		// �г��� �Է����� ��Ŀ����
		function FocusIn_NickNameForm() {
			var obj = $("#txt_nickname");
			if (obj.val() == '�Ǹ��� �г���')
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
		// �г��� �Է������� ��Ŀ���ƿ�
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

		// ��ǥ��ȭ üũ
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
			if($("#txt_name").val() =='' || $("#txt_name").val() =='�̸�')
			{
				alert("�̸��� �Է����ּ���.");
				$("#txt_name").focus();
				return false;
			}
			
			if($("#txt_enterid").val() =='')
			{
				alert("ID�� �Է����ּ���.");
				$("#txt_enterid").focus();
				return false;
			}
			
			if($("#htxtPassword").val() == "")
			{
				alert("��й�ȣ�� �Է����ּ���.");
				$("#txt_enterpw").focus();
				return false;
			}

			if ($("#txt_enterpw_confirm").val() == "") {
				alert("��й�ȣ�� ���Է����ּ���.");
				$("#txt_enterpw_confirm").focus();
				return false;
			}

			if ($("#htxtPassword").val() != $("#txt_enterpw_confirm").val()) {
				alert("��й�ȣ�� ��ġ����  �ʽ��ϴ�.");
				$("#txt_enterpw_confirm").focus();
				return false;
			}
		
			if(CheckMobilePhone(document.getElementById('ddlMobileTel1'), document.getElementById("mobile_tel2"), document.getElementById("mobile_tel3"),false,false)==false) return false;
			//�ڵ��� ��ȣ ���� �Է½� 000, 0000, 111, 1111 �Է� ���� ���͸�
			if ((checkRepetitionForTel(document.getElementById("mobile_tel2").value, 3) == false) 
				|| (checkRepetitionForTel(document.getElementById("mobile_tel2").value, 4) == false))
			{
				alert("��Ȯ�� ������ �Է����ּ���.");
				document.getElementById('mobile_tel2').focus();				
				return false;
			}

			if (CheckEmail(document.getElementById('email1'), document.getElementById("email2"), document.getElementById("ddlEmailDomain"), false, false) == false) return false;

			//�Ǹ� ������ ��� ���� ���θ� üũ�Ѵ�.
			if ("IS" == 'IS')
			{
				if(document.getElementById('txtAddress1').value.replace(/ /g, "").length == 0 )
				{
					alert("�����ȣ�� �����ϼ���") ;
					document.getElementById('txtAddress1').focus();
					document.getElementById('txtAddress1').click();
					return false;
				}
				if(document.getElementById('txtAddressDetail').value.replace(/ /g, "").length == 0 
					|| document.getElementById('txtAddressDetail').value == "������ �ּ� �Է�"
				)
				{
					alert("������ �ּҸ� �Է��� �ּ���.") ;
					document.getElementById('txtAddressDetail').value = '';
					document.getElementById('txtAddressDetail').focus();
					return false;
				}
				//�ּ����� �Է� �� ���������� �ܾ��Է� ���� ���͸�
				if(CheckPattern(document.getElementById('txtAddressDetail').value, "����") == false)
				{
					document.getElementById('txtAddressDetail').focus();
					return false;
				}

				// ��ȭ��ȣ üũ
				if (document.getElementById("ddlHomeTel1").value.length > 0
					|| TrimString(document.getElementById("hometel2").value).length > 0
					|| TrimString(document.getElementById("hometel3").value).length > 0)
				{
					if (document.getElementById("ddlHomeTel1").value.length < 1)
					{
						alert("��ȭ��ȣ�� ������ �ּ���");
						document.getElementById("ddlHomeTel1").focus();
						return false;
					}
					if (document.getElementById("hometel2").value.length < 1)
					{
						alert("��ȭ��ȣ�� �Է��� �ּ���");
						document.getElementById("hometel2").focus();
						return false;
					}
				
					// 1588�� ���� ������ ������ ��ȣ�� ��� ����
					if (!IsRepresentationTelNumber(document.getElementById("ddlHomeTel1").value))
					{
						if (document.getElementById("hometel3").value.length < 1)
						{
							alert("��ȭ��ȣ�� �Է��� �ּ���");
							document.getElementById("hometel3").focus();
							return false;
						}
					}
				
					//������ȭ��ȣ ���� �Է½� 000, 0000, 111, 1111 �Է� ���� ���͸�
					if ((checkRepetitionForTel(document.getElementById("hometel2").value, 3) == false) 
						|| (checkRepetitionForTel(document.getElementById("hometel2").value, 4) == false))
					{
						alert("��Ȯ�� ������ �Է����ּ���.");
						document.getElementById('hometel2').focus();				
						return false;
					}
				}
				
				if(CheckLinePhone(document.getElementById('ddlHomeTel1'), document.getElementById("hometel2"), document.getElementById("hometel3"),false,"��ȭ��ȣ")==false) return false;

				//�ڵ��� ���� ���� -> Ȯ����
				if(CheckSMSCert() == false) return false;
			
				//�۱� ���� �Է� ����
				if(CheckBankAccount() == false) return false;
				
				// �۱ݹ�� üũ
				if (CheckRemitMethod() == false) return false;
			}
			
			
			
			//Ű���� ���� �۵��� ��ȯ
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


		// ���θ� ���ּ� �˾� �ݹ��Լ�
		function Callback_PostAddressInfo(postNo1, postNo2, address1, roadNameAddress, addressDetail, uID)
		{
		  document.getElementById("txt_postno").value = postNo1 + postNo2.replace(/ /g, "");
		  document.getElementById("txtPostNo").value = postNo1 + postNo2.replace(/ /g, "");
			document.getElementById("txtAddress1").value = address1;
			document.getElementById("txtAddressDetail").value = addressDetail;
		}

		// �Ź���(Fulfillment ver.) ���ּ� �˾� Open
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

		// �Ź���(Fulfillment ver.) ���ּ� �˾� result callback
		function setCommonAddress(zipCode, roadAddr, lotAddr) {
		    document.getElementById("txt_postno").value = zipCode;
		    document.getElementById("txtPostNo").value = zipCode;

		    document.getElementById("txtAddress1").value = roadAddr;
		    document.getElementById("txtAddressDetail").value = ""; //�ʱ�ȭ
		}

		// �Ź���(Fulfillment ver.) ���ּ� �˾� close callback
		function setCommonClose() {

		}

		function CheckNumber(obj){
			var keycode = event.keyCode;
 
			if( !((48 <= keycode && keycode <=57) || keycode == 13 || keycode == 46) ){
				//alert("���ڸ� �Է� �����մϴ�.!");
				event.keyCode = 0;  // �̺�Ʈ cancel
			}
		}

		function CheckNumberWithKeyupEvent(obj){
			var keycode = event.keyCode;
 
			if( !((48 <= keycode && keycode <=57) || (96 <= keycode && keycode <=105 ) ||
						keycode == 13 || keycode == 46 || keycode == 8 || keycode == 32 || keycode == 9) ){
				alert("���ڸ� �Է� �����մϴ�. �ٽ� �Է����ּ���");
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

		// Ÿ�̸� �ݹ� - �����˾� ���� �̺�Ʈ �ڵ鷯�� ��� 
		function CallbackAuthenticationPopUpCheck() {
			if (!isExistAutenticationPopup)													// �����˾��� ���ٰ� ��ϵǾ������� ��� ����
				return;
			if(typeof(popupInstance) == 'undefined' || popupInstance.closed)
			{
				isExistAutenticationPopup = false;
				$(".cert-cont").removeClass("certified");							// ���� �Ϸ� ���� ���
				$(".cert-cont .cell").removeClass("selected");				// ����� ���� ���� ���
				$(".cert-cont .ipin").removeClass("selected");				// ������ ���� ���� ���
				$(".cert-cont .foreign").removeClass("selected");			// �ܱ��� ���� ���� ���
			}
			setTimeout("CallbackAuthenticationPopUpCheck()", 300);	// 0.3���� �ٽ� ȣ��
		}

	//���� ���� ���� üũ
	function CheckSMSCert()
	{
		if(document.getElementById("hdnCertMobileTel").value == '')
		{
			alert('�޴��� ������ �޾� �ּ���.');
			
			//document.getElementById("__Page_ddlCertMobileTel1").focus();
			return false;
		}
		
		return true;
	}

	// �Ǹ����� ���� �����޽��� �˾�
	function ShowIncorrectRealnamePopup() {
		alert("�Ǹ��� �ƴϰų� �Ǹ����� �Ǿ����� �ʽ��ϴ�.\n�Ǹ���������� �������ּ���.");
	}

	function AuthenticateLater(){
		isExistAutenticationPopup = false;
		$(".noauth").show();
		$(".cert-cont").addClass("certified");					// ���� �Ϸ�
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
		$(".cert-cont").removeClass("certified");					// ���� �Ϸ�
		DisableEveryInputArea(true);

		$(".cert-cont .cs-center").removeClass("selected");
		//$("#htxtpMemberName").val($("#txt_name").val()); 
		$("#htxtAuthType").val("");
		$("#htxtCertData").val("");
		$("#btn_signup").show();
		$("#temp_signup").hide();
	}

	function AlertForDuplication() {
		if (confirm('ȸ���Բ����� �̹� ���ǿ� �����ϼ̽��ϴ�.\n���̵�/��й�ȣ ã��� �̵��Ͻðڽ��ϱ�?')) {
			document.location.href = 'https://memberssl.auction.co.kr/Membership/IDPW/FindID.aspx';
		}
		else {
		}
	}

	// 2014-06-18 ȸ������ �������� �� ��ư �����
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
<a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http://www.auction.co.kr/?redirect=1" class="home">Ȩ</a>
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
			<!-- �������� ���� -->
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

			<!-- �Ǹ��� �޴��� ��ȣ ���� -->
			<input name="txtCertCount" type="hidden" id="txtCertCount" />
			<input name="hdnVerfSeqNo" type="hidden" id="hdnVerfSeqNo" />
			<input name="hdnSMSSeqNo" type="hidden" id="hdnSMSSeqNo" />
			<input name="hdnCertMobileTel" type="hidden" id="hdnCertMobileTel" />
			<!-- -->

			<!-- �Ǹ��� ��ǥ ��ȣ ���� -->
			<input name="hdnMainNumber" type="text" id="hdnMainNumber" />				
			<input name="hdnMainNumberType" type="text" id="hdnMainNumberType" />		
			<input name="hdnMainNumberCert" type="text" id="hdnMainNumberCert" />	
			<!-- -->

			<input name="htxtpSsn1" type="hidden" id="htxtpSsn1" />
			<input name="htxtpSsn2" type="hidden" id="htxtpSsn2" />
			<input name="htxtpMemberName" type="text" id="htxtpMemberName" />
			<input name="htxtAuthType" type="text" id="htxtAuthType" />

			<!-- ���Թ�ư ��Ÿ ���� -->
			<input id="AvoidPostTwice" name="AvoidPostTwice" value="" >

			<!-- ���� ��ư -->
			<input type="submit" name="btnSignup" value="" id="btnSignup" />
			

		</div>
		
    <div id="body">
			<h2 class="tit-join"><img src="https://pics.auction.co.kr/join/h2_tit_join.png" alt="���� ȸ������"></h2>
				<div class="identi-cert">
					<div class="inner">
						<h3><img src="https://pics.auction.co.kr/join/h3_tit_identi_cert.gif" alt="��������"></h3>
						<div id="back" style="color:gray; display:none"></div>
						<div class="cert-cont">
              <!-- 2014-07-30 �������Ի��� -->
								<ul>
									<li class="cell">
										<a class="btn" href="#none">�޴��� �����ϱ�</a>
										<ul>
											<li class="btn_area"><a href="javascript:PopupVerifyIdentityDual();"><img src="https://pics.auction.co.kr/join/btn_certification.png" alt="�����ϱ�"></a></li>
											<!-- 2014-07-23 ȸ������ �������� �� ��ư ����� -->
											<li>������ ���� ������Ÿ��� ��23���� ���� ȸ�� ���Խÿ��� �ֹε�Ϲ�ȣ�� �������� �ʽ��ϴ�.</li>
											<li>�޴��� ������ �����Ͻô� �� ������ �޴������θ� ������ �����մϴ�. (14�� �̸� ���� �Ұ�)</li>
											<li>������ ���� ���� ���, ���� ������(1588-0184) Ȥ�� ���̽��ſ�������(1588-2486)�� �����Ͻñ� �ٶ��ϴ�.</li>
											<!-- //2014-07-23 ȸ������ �������� �� ��ư ����� -->
										</ul>
									</li>
									<li class="ipin">
										<a class="btn" href="#none">������ �����ϱ�</a>
										<ul>
											<li class="btn_area"><a href="javascript:IPinPopup();"><img src="https://pics.auction.co.kr/join/btn_certification.png" alt="�����ϱ�"></a></li>
											<li>������(i-PIN)�� ����������ȸ���� �ְ��ϴ� �ֹε�Ϲ�ȣ ��ü �������� ���ǿ� �ֹε�Ϲ�ȣ�� �Է����� �ʰ� ������ �� �ִ� ���� �Դϴ�.</li>
											<li>������ ������ ���ؼ��� ������ ID�� �־�� �մϴ�. <a target="_blank" href="http://i-pin.kisa.or.kr/kor/issue/method.jsp">������ ID �߱޹ޱ�</a></li>
											<li>������(i-PIN)�� ���ؼ� ������ �� �𸣽Ŵٸ�? <a target="_blank" href="http://i-pin.kisa.or.kr/kor/about/about.jsp">������ �Ұ� �÷��ú���</a></li>
										</ul>
									</li>
									<li class="foreign">
										<a class="btn" href="#none">�ܱ��� ��Ϲ�ȣ �����ϱ�</a>
										<ul>
											<li class="btn_area"><a href="javascript:ForeignLayer();"><img src="https://pics.auction.co.kr/join/btn_certification.png" alt="�����ϱ�"></a></li>
											<li>
												�Ǹ������� ���� �ʴ� ��� �Ʒ��� �Ǹ���������� �Ǹ����� ��û�� �� �ֽ��ϴ�.<br />
												<a style="margin-left:0;" target="_blank" href="https://www.namecheck.co.kr/front/personal/register_howtoonline.jsp?menu_num=1&page_num=0&page_num_1=1">���̽��ſ�������</a>(1600-1522)
											</li>
										</ul>
									</li>
								</ul>
								<!-- //2014-07-30 �������Ի��� -->
							<p class="cert-finish auth" style="display:none""><strong>���������� �Ϸ�Ǿ����ϴ�.</strong><br />ȸ�������� �������ּ���.</p><!-- �����Ϸ�Ǿ��� ��� �޽��� -->
							<p class="cert-finish noauth" style="display:none""><strong>�����Է� �� ���� ���� ��û�ϱ� ��ư�� �����ּ���.</strong><br />������(1588-0184)���� 1�� �̳�(������ ����) ���Բ� ���� �帳�ϴ�.<br />���� ������ ���� ��� �ٷ� ��ȭ�ּ���.<br /><input type="button" onclick="Cancel_AuthenticateLater();" value="���" /></p> <!-- �ӽð��� Ŭ�� �� �޽��� -->
						</div>
					</div>
				</div>
				<div class="info-enter">
					<div class="inner">
						<h3><img src="https://pics.auction.co.kr/join/h3_tit_info_enter.gif" alt="�����Է�"></h3>
						<div class="info-cont">
							<ul>
								<li class="entername_area">
									<input name="txt_name" type="text" id="txt_name" class="enter-name placeholder" value="�̸�" style="width:427px;" maxlength="12" title="�̸�" placeholder="�̸�" onfocus="if(this.value == &#39;�̸�&#39;) 	this.value = &#39;&#39;;" />
								</li>
								<li class="enterid_area">
									<input name="txt_enterid" type="text" id="txt_enterid" onfocus="FocusIn_IDForm(this);" onkeyup="SetTickCount(600);" placeholder="���̵�" value="���̵�" maxlength="12" class="enter-id placeholder" onblur="FocusOut_IDForm(this)" style="width:427px;" onkeydown="CheckKeyIDInputForm(this);" title="���̵�" />

									<!-- ��밡���� ���̵��� ��� input�� class="usable" �߰�, ���̵� ���ǿ� �����ʴ� ��� class="incorrect" �߰� -->
									<!--p id="tickcount">tickcount =</p-->
									<p class="enter-guide">���� ���� ������ ���ڸ� ȥ���Ͽ� 4~12�ڸ� ����� �� �ֽ��ϴ�.</p>
									<p class="txt01" style="display:none">��밡���� ���̵��Դϴ�.</p><!-- ��밡���� ���̵��� ��� -->
									<p class="txt02" style="display:none">���̵� �־��ּ���.</p><!-- ���̵� ���ǿ� �����ʴ� ��� -->
								</li>
								<li class="enterpw_area">
									<input type="password" id="txt_enterpw" class="enter-pw placeholder" style="width:427px;" title="��й�ȣ �Է�" maxlength="15" 
									onkeydown="CheckKeyInput(this);" onkeyup="validatePasswordType(this);" 
									onfocus="FocusIn_PwdForm(this);" onblur="FocusOut_PwdForm(this)" >
									<!-- ��й�ȣ�� ������ ��� input�� class="usable" �߰�, ��й�ȣ�� ���ǿ� �����ʴ� ��� class="incorrect" �߰� -->
									<span class="pw-guide"><a href="#" onclick="OpenPasswordGuide();" title="��â���� ����">��й�ȣ ����</a></span><!-- 2013-06-20 eun -->
									<p class="enter-guide">������ ����� ���� ����, ����, Ư������ ���� 6~15�ڸ� ����� �ּ���.</p>
									<p class="txt01" style="display:none">�Ϻ��� ��й�ȣ �Դϴ�.</p><!-- ��й�ȣ�� ������ ��� -->
									<p class="txt02" style="display:none" id="password_err">�����ϱ� ���� ��й�ȣ �Դϴ�.</p><!-- ��й�ȣ�� ���ǿ� �����ʴ� ��� -->
								</li>
								<li class="enterpw_area">
									<input type="password" onblur="CheckPasswordConfirm();" maxlength="15" title="��� �Է��� ��й�ȣ�� ���� ��й�ȣ�� �ѹ� �� �Է����ּ���" 
										style="width: 427px;" value="" class="enter-pw enter-repw" id="txt_enterpw_confirm">
									<!-- ��й�ȣ�� ������ ��� input�� class="usable" �߰�, ��й�ȣ�� ���ǿ� �����ʴ� ��� class="incorrect" �߰� -->
									<p style="display:none" class="txt02" id="password_confirm_err">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</p><!-- ��й�ȣ�� ���ǿ� �����ʴ� ��� -->
								</li>
								<li>
									<span id="mobile_tel1_span">
									<select name="ddlMobileTel1" id="ddlMobileTel1" class="styled" title="�޴��� ���ڸ� ����" style="width:133px;">
	<option value="�޴��� ��ȣ ����">�޴��� ��ȣ ����</option>
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="0130">0130</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>

</select>
									</span>
									<input type="text" id="mobile_tel1_temp" style="width:123px; display:none" title="���õ� �޴��� ���ڸ�" />
									<span class="dash">-</span> 
									<input name="mobile_tel2" type="text" id="mobile_tel2" style="width:123px;" maxlength="4" title="�޴��� �߰��ڸ� �Է�" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="mobile_tel3" type="text" id="mobile_tel3" style="width:123px;" maxlength="4" title="�޴��� ���ڸ� �Է�" onkeyup="CheckNumberWithKeyupEvent(this);" />
								</li>
								<li>
									<input name="email1" type="text" id="email1" class="placeholder" value="�̸���" title="�̸���" style="width:120px;" onfocus="this.value=&#39;&#39;;" placeholder="�̸���" /> 
									<span class="gol">@</span> 
									<input name="email2" type="text" id="email2" title="�̸��� ���� �Է�" style="width:123px; margin-right:7px; display:none;" />
									<span id="email_span">
										<select name="ddlEmailDomain" id="ddlEmailDomain" class="styled" onchange="ChangeMailDomain(this);" style="width:136px;">
	<option value="">����</option>
	<option value="naver.com">naver.com</option>
	<option value="hanmail.net">hanmail.net</option>
	<option value="daum.net">daum.net</option>
	<option value="nate.com">nate.com</option>
	<option value="gmail.com">gmail.com</option>
	<option value="hotmail.com">hotmail.com</option>
	<option value="direct_input">�����Է�</option>

</select>
									</span>
									<p><label for="sms_yn" ><input name="sms_yn" type="checkbox" id="sms_yn" /> �̺�Ʈ/�������� SMS ���ſ� �����մϴ�.</label></p>
									<p class="check"><label for="email_yn"><input name="email_yn" type="checkbox" id="email_yn" /> �̺�Ʈ/�������� �̸��� ���ſ� �����մϴ�.</label></p>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="divSellerInfo" class="info-enter seller_info">
					<div class="inner">
						<h3><img src="https://pics.auction.co.kr/join/h3_tit_seller_info.gif" alt="�Ǹ��� �����Է�"></h3>
						<div class="info-cont">
							<ul>
								<!--
								<li class="enternickname_area">
									<input name="txt_nickname" type="text" id="txt_nickname" class="enter-nick" value="�Ǹ��� �г���" style="width:427px;" title="�Ǹ��� �г��� �Է�" onkeyup="SetNickNameTickCount(600);" onfocus="FocusIn_NickNameForm();" onblur="FocusOut_NickNameForm();" />
									<!--p id="tickcount_NICK">tickcount =</p--
									<p class="enter-guide">���� ���� �ѱ۰� ����,���ڸ� ȥ���Ͽ� 1~10�ڸ� ����� �ּ���.</p>
									<p class="txt01" style="display:none">��밡���� �г����Դϴ�.</p>
									<p class="txt02" style="display:none">�г����� �־��ּ���.</p>
									<ul>										
										<li>����Ͻ� �г����� <span>��ǰ �Ǹſ� ���õ� �Ǹ��� ������ ����Ǵ� ��� �������� ���̵� ����� ����</span>�˴ϴ�.</li>
										<li>����� ����� ����Ǵ� �ҹ����̳� ��ȸ�� ���������� �������� �������� ��� �Ұ��մϴ�.</li>
									</ul>
								</li>
								//-->
								<li>
									<span id="home_tel1_span">
										<select name="ddlHomeTel1" id="ddlHomeTel1" class="styled" title="��ȭ��ȣ ������ȣ ����" style="width:133px;">
	<option value="��ȭ��ȣ">��ȭ��ȣ</option>
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
									<input name="hometel2" type="text" id="hometel2" style="width:123px;" maxlength="4" title="��ȭ��ȣ ���� �Է�" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="hometel3" type="text" id="hometel3" style="width:123px;" maxlength="4" title="��ȭ��ȣ ���ڸ� �Է�" onkeyup="CheckNumberWithKeyupEvent(this);" />
								</li>
								<li>
									<span id="cellphone1_seller_span">
										<select name="ddlCellphone1Seller" id="ddlCellphone1Seller" class="styled" title="�޴��� ������ ����" style="width:103px;">
	<option value="�޴��� ��ȣ">�޴��� ��ȣ</option>
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
									<input name="cellphone2_seller" type="text" id="cellphone2_seller" style="width:93px;" maxlength="4" title="�޴��� �߰��ڸ� �Է�" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="cellphone3_seller" type="text" id="cellphone3_seller" style="width:93px;" maxlength="4" title="�޴��� ���ڸ� �Է�" onkeyup="CheckNumberWithKeyupEvent(this);" /> 
									<input type="button" value="�޴��� ����" class="cell-cert" onclick="javascript:goSMSVerification2();">
									<p class="cell-option">
										<label for="rdoCertMobile"><input value="rdoCertMobile" name="option" type="radio" id="rdoCertMobile" onClick="ChangeMainNumberInfo()" />�������� �޴��� ��ȣ�� ��ǥ��ȣ�� ���</label>
										<label for="rdoOtherNumber"><input value="rdoOtherNumber" name="option" type="radio" id="rdoOtherNumber" onClick="ChangeMainNumberInfo()" />�ٸ���ȣ ���</label>
										<label for="rdoLater"><input value="rdoLater" name="option" type="radio" id="rdoLater" onClick="ChangeMainNumberInfo()" />������ �����</label>
										<p class="txt02" id="spnInfo" style="display:none">��ǰ ��� �ÿ��� �ݵ�� ��ǥ��ȣ ������ �޾ƾ� �մϴ�.</p>
									</p>
								</li>
								<li>
									<input type="text" id="txt_postno" value="�����ȣ" onkeydown="return false;" title="�����ȣ �Է�" placeholder="�����ȣ" style="width:310px;"/>
									<input name="txtPostNo" type="hidden" id="txtPostNo" />
									<input type="button" onclick="postPopup();" value="�����ȣ ã��" class="zipcode">
									<p class="address">
										<input name="txtAddress1" type="text" id="txtAddress1" title="�⺻ �ּ� �Է�" style="width:310px;" />
										<input name="txtAddressDetail" type="text" id="txtAddressDetail" valu��e="������ �ּ� �Է�" title="������ �ּ� �Է�" style="width:310px; margin-left:3px;" onfocus="this.value=&#39;&#39;;" />
									</p>
								</li>
								<li class="enter_account_area">
									<p class="noti-ment">�ǸŴ���� �۱ݹ��� ���ΰ��¸� ����� �ּ���. (�۱ݰ��� ����)</p>
									<span id="bankcode_span">
										<select name="ddlBankCode" id="ddlBankCode" class="styled" title="���� ����" style="width:150px;">
	<option selected="selected" value="���� ����">���� ����</option>
	<option value="A263">HMC��������</option>
	<option value="A247">NH��������</option>
	<option value="1523">SC����</option>
	<option value="A266">SK����</option>
	<option value="1539">�泲����</option>
	<option value="1534">��������</option>
	<option value="A261">��������</option>
	<option value="1504">��������</option>
	<option value="1503">�������</option>
	<option value="1511">����</option>
	<option value="1531">�뱸����</option>
	<option value="A267">�������</option>
	<option value="A238">�������</option>
	<option value="1555">����ġ</option>
	<option value="A279">��������</option>
	<option value="A209">�������ձ�������</option>
	<option value="A287">�޸�������</option>
	<option value="A230">�̷���������</option>
	<option value="A290">�α�����</option>
	<option value="1532">�λ�����</option>
	<option value="1502">�������</option>
	<option value="A240">�Ｚ����</option>
	<option value="1550">��ȣ����</option>
	<option value="1545">�������ݰ�</option>
	<option value="1507">����</option>
	<option value="A291">�ſ�����</option>
	<option value="1548">�ſ���������</option>
	<option value="A278">���ѱ�������</option>
	<option value="1526">��������</option>
	<option value="1527">��Ƽ����</option>
	<option value="1553">��Ƽ����</option>
	<option value="1505">��ȯ����</option>
	<option value="1520">�츮����</option>
	<option value="1571">��ü��</option>
	<option value="A280">������������</option>
	<option value="1537">��������</option>
	<option value="1535">��������</option>
	<option value="1521">��������</option>
	<option value="1516">����</option>
	<option value="1590">īī����ũ</option>
	<option value="1589">���̹�ũ</option>
	<option value="A270">�ϳ���������</option>
	<option value="1581">�ϳ�����</option>
	<option value="A262">������������</option>
	<option value="A243">�ѱ���������</option>
	<option value="A269">��ȭ����</option>
	<option value="A218">��������</option>
	<option value="1554">ȫ�������</option>
	<option value="1512">ȸ��_��������</option>

</select>
									</span>
									<input name="txt_account" type="text" id="txt_account" class="placeholder" value="���¹�ȣ(��-������ ���ڸ� �Է�)" title="���¹�ȣ(��-������ ���ڸ� �Է�)" placeholder="���¹�ȣ(��-������ ���ڸ� �Է�)" style="width:265px; margin-left:6px;" onfocus="this.value=&#39;&#39;; $(&#39;.enter_account_area .txt02&#39;).hide()" />
									<p class="txt02" style="display:none">�Ǹ� ���� ������ �����߽��ϴ�. �����ָ�, �����, ���¹�ȣ�� Ȯ���� �ּ���.</p>
									<p class="add-ment">����ȸ���� ��� �����ָ�� ȸ������ ��ġ�ؾ� �մϴ�. (�����ָ�=ȸ����)</p>
									<p class="remit-option">
										<label for="rdoSellRemitMethodA"><input type="radio" name="rdoSellRemitMethod" id="rdoSellRemitMethodA" value="A" onclick="document.getElementById('htxtRemitMethod').value = 'A'; CheckAccountValidation();" />�������� ���¹�ȣ�� �¶��� �۱� �ްڽ��ϴ�.</label>
										<label for="rdoSellRemitMethodB"><input type="radio" name="rdoSellRemitMethod" id="rdoSellRemitMethodB" value="B" onclick="document.getElementById('htxtRemitMethod').value = 'B'; CheckAccountValidation();" />�Ǹſ�ġ������ ���� �ްڽ��ϴ�.</label>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>				
				
				<!-- ����� ���� -->
				<div id="divStoreInfo" class="info-enter">
					<div class="inner">					
							
<script type="text/javascript">
/*********************************************************************************************************************/
// Ÿ�̸� �ݹ� - ����� �г��� üũ�� 
var previousTick_StoreName = 0;
var remainTick_StoreName = 0;
var eventSignal_StoreName = false;

function CallbackStoreNameCheck() {
	eventSignal_StoreName = false;
	var inputForm = $("#ucStoreName_txtStoreNickName");
	// ��Ŀ���� ���ų� remainTick�� 0�̸� Ÿ�̸��ݹ� ����
	if (!(inputForm.hasClass('focus')) || remainTick_StoreName == 0)
		return;
	var currentTick = new Date().getTime();
	var elapsedTick = currentTick - previousTick_StoreName;
	remainTick_StoreName -= elapsedTick;
	if (remainTick_StoreName <= 0) {
		remainTick_StoreName = 0;
		CheckStoreNameValidation(inputForm);
		//$("#ucStoreName_txtStoreNickName").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick_StoreName); // ����� �޼���
		return;
	}
	//$("#ucStoreName_txtStoreNickName").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick_StoreName); // ����� �޼���
	previousTick_StoreName = currentTick;

	// ��Ŀ���� ������ �ִٸ� �ٽ� Ÿ�̸� �ݹ� ����
	if (inputForm.hasClass('focus') && !eventSignal_StoreName) {
		setTimeout("CallbackStoreNameCheck()", 100);
		eventSignal_StoreName = true;
	}
}

//�г��� üũ ��û���� ���� �ð��� �缳�� 
function SetStoreNameTickCount(milliSec) {
	remainTick_StoreName = milliSec;
	previousTick_StoreName = new Date().getTime();
	if (!eventSignal_StoreName)
		setTimeout("CallbackStoreNameCheck()", 100);
}

// ������ �г��� ��ȿ�� üũ ��û(AJAX) 
function CheckStoreNameValidation(obj) {
	// ��� ó���� �񵿱� ȣ���̹Ƿ� �켱 �Է����� ��� ���·� ����
	var current = $('#ucStoreName_txtStoreNickName');
	current.removeClass('incorrect');
	$(".storename_area #txt01").hide();
	$(".storename_area #txt02").hide();
	$(".storename_area #enter-guide").hide();

	// �����϶��� �⺻ �ȳ� �޼��� ���
	if (obj.val() == '') {
		$(".storename_area #enter-guide").show();
		return;
	}

	//���鹮��üũ
	if (current.val().indexOf(' ') >= 0) {
		$(".storename_area #txt02").text("����� �̸��� ����� ����� �� �����ϴ�.");
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
	      $(".storename_area #txt02").text("����� �̸��� 1~20 ����Ʈ���� �Է��� �ּ���.");
	      $(".storename_area #txt02").show();
	      
	      break;
	    case "NICKCHECK_NOT_ALLOWED_SPECIAL_CHAR":
	      current.addClass('incorrect');
	      $(".storename_area #txt02").text("����� �̸��� Ư�����ڸ� ����� �� �����ϴ�.");
	      $(".storename_area #txt02").show();
	      break;
	    case "NICKCHECK_ALREADY_USED_NICKNAME":
	      if ($("#htxtOldNickName").val() != "") {	// �簡�Խ� ���� �г����� �����ϸ�,
	        $(".storename_area #txt01").show();
	        current.removeClass('incorrect');
	        current.addClass('usable');
	        break;
	      }
	      current.addClass('incorrect');
	      $(".storename_area #txt02").text("�̹� ������� �̸��Դϴ�. �ٸ� �̸��� �Է����ּ���");
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

// �г��� �Է����� ��Ŀ����
function FocusIn_StoreNameForm() {
	var obj = $("#ucStoreName_txtStoreNickName");
	if (obj.val() == '������̸�(�Ǹ��ڴг���)')
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
// �г��� �Է������� ��Ŀ���ƿ�
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
// Ÿ�̸� �ݹ� - ����� URL üũ�� 
var previousTick_StoreUrl = 0;
var remainTick_StoreUrl = 0;
var eventSignal_StoreUrl = false;

function CallbackStoreUrlCheck() {
	eventSignal_StoreUrl = false;
	var inputForm = $("#ucStoreName_txtStoreUrl");
	// ��Ŀ���� ���ų� remainTick�� 0�̸� Ÿ�̸��ݹ� ����
	if (!(inputForm.hasClass('focus')) || remainTick_StoreUrl == 0)
		return;
	var currentTick = new Date().getTime();
	var elapsedTick = currentTick - previousTick_StoreUrl;
	remainTick_StoreUrl -= elapsedTick;
	if (remainTick_StoreUrl <= 0) {
		remainTick_StoreUrl = 0;
		CheckStoreUrlValidation(inputForm);
		//$("#ucStoreName_txtStoreUrl").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick="+elapsedTick+" remainTick="+remainTick_StoreUrl); // ����� �޼���
		return;
	}
	//$("#ucStoreName_txtStoreUrl").text("[DEBUG MSG]tickcount=" + currentTick + " elapsedTick=" + elapsedTick + " remainTick=" + remainTick_StoreUrl); // ����� �޼���
	previousTick_StoreUrl = currentTick;

	// ��Ŀ���� ������ �ִٸ� �ٽ� Ÿ�̸� �ݹ� ����
	if (inputForm.hasClass('focus') && !eventSignal_StoreUrl) {
		setTimeout("CallbackStoreUrlCheck()", 100);
		eventSignal_StoreUrl = true;
	}
}

//����� URL üũ ��û���� ���� �ð��� �缳�� 
function SetStoreUrlTickCount(milliSec) {
	remainTick_StoreUrl = milliSec;
	previousTick_StoreUrl = new Date().getTime();
	if (!eventSignal_StoreUrl)
		setTimeout("CallbackStoreUrlCheck()", 100);
}

// ������ ����� URL ��ȿ�� üũ ��û(AJAX) 
function CheckStoreUrlValidation(obj) {
	// ��� ó���� �񵿱� ȣ���̹Ƿ� �켱 �Է����� ��� ���·� ����
	var current = $('#ucStoreName_txtStoreUrl');
	current.removeClass('incorrect');
	$(".storeurl_area #txt03").hide();
	$(".storeurl_area #txt04").hide();
	//$(".storeurl_area #enter-guide").hide();

	// �����϶��� �⺻ �ȳ� �޼��� ���
	if (obj.val() == '') {
		//$(".storeurl_area #enter-guide").show();
		return;
	}

	//���鹮��üũ
	if (current.val().indexOf(' ') >= 0) {
		$(".storeurl_area #txt04").text("����� URL�� ����� ����� �� �����ϴ�.");
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
				if ($("#htxtOldNickName").val() != "" && $("#htxtOldStoreUrl").val() != "") {	// �簡�Խ� ���� ����� URL �� �����ϸ�,
					$(".storeurl_area #txt03").show();
					current.removeClass('incorrect');
					current.addClass('usable');
					break;
				}				
				current.addClass('incorrect');
				$(".storeurl_area #txt04").text("�̹� ������� �ּ��Դϴ�. �ٸ� �ּҸ� �Է����ּ���.");
				$(".storeurl_area #txt04").show();
				break;
			case "STOREURL_CHECK_NOT_ALLOWED_SPECIAL_CHAR":
				current.addClass('incorrect');
				$(".storeurl_area #txt04").text("Ư�����ڸ� ����� �� �����ϴ�. �ٸ� �ּҸ� �Է����ּ���.");
				$(".storeurl_area #txt04").show();
				break;
			case "STOREURL_CHECK_WRONG_USED_URL":
				current.addClass('incorrect');
				$(".storeurl_area #txt04").text("����� �� ���� �ּ��Դϴ�. �ٸ� �ּҸ� �Է����ּ���.");
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

// ����� URL �Է����� ��Ŀ����
function FocusIn_StoreUrlForm() {
	var obj = $("#ucStoreName_txtStoreUrl");
	if (obj.val() == '������ּ�')
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
// ����� URL �Է������� ��Ŀ���ƿ�
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

// Ư������ �Է� ���� == > 40:(,	41:),	45:-,	46:.,	95:_
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
        alert("�ִ� 20����Ʈ������ �Է��� �� �ֽ��ϴ�");*/
      //obj.value = string.substr(0, i);
      //b -= increase_prev;
      $(".storename_area #txt01").hide();
      $(".storename_area #txt02").text("����� �̸��� 1~20 ����Ʈ���� �Է��� �ּ���.");
      $(".storename_area #txt02").show();

      break;
    }
  }
}

// �Է� ���� ���� üũ �Լ�
function check_Strlen(obj, obj2, val) {
	obj2.value = obj.value.length;

	if (obj2.value > val) {
		alert(val + "�ڸ� �ʰ� �Է��� �� �����ϴ�.");
		obj.value = obj.value.substring(0, val);
		obj2.value = val;
	}
}
</script>
<h3><img src="https://pics.auction.co.kr/join/h3_tit_store_info.gif" alt="����� �����Է�"></h3>
<div class="info-cont">
<ul>
	<li class="storename_area">
		<input name="ucStoreName$txtStoreNickName" type="text" id="ucStoreName_txtStoreNickName" onfocus="FocusIn_StoreNameForm();" onkeyup="SetStoreNameTickCount(600); checkMaxNickNameLengthByKeyPress(this,20);" value="������̸�(�Ǹ��ڴг���)" maxlength="20" class="placeholder" onblur="FocusOut_StoreNameForm();" style="width:206px;" onkeydown="validate_SpecialChar();" title="������̸�(�Ǹ��ڴг���)" />
		<span class="count-txt">(�ѱ�, ����, ���ڸ� �Է°���)</span>
		<ul>
			<li>����Ͻ� ����� �̸��� �Ǹ��� �г������� Ȱ��Ǿ� ��ǰ �Ǹſ� ���õ� �Ǹ��� ������ ����Ǵ� ��� ��������<br>���̵� ����� ����˴ϴ�.</li>
			<li>����� ����� ����Ǵ� �ҹ����̳� ��ȸ�� ���������� �������� �������� ��� �Ұ��մϴ�.</li>
		</ul>		
		<p class="txt01" id="enter-guide">���� ���� �ѱ۰� ����,���ڸ� ȥ���Ͽ� 1~20����Ʈ���� �Է��� �ּ���.</p>		 
		<p class="txt01" id="txt01" style="display:none"><span>��밡���� �̸��Դϴ�.</span></p>
		<p class="txt02" id="txt02" style="display:none"><span>����� �̸��� �־��ּ���.</span></p>
	</li>
	<li class="storeurl_area">
		<span>http://stores.auction.co.kr/<span>&nbsp;</span>		
		<input name="ucStoreName$txtStoreUrl" type="text" id="ucStoreName_txtStoreUrl" onkeyup="SetStoreUrlTickCount(600);" onpaste="return false;" value="������ּ�" maxlength="20" title="������ּ�" style="ime-mode:disabled;" onblur="FocusOut_StoreUrlForm();" onkeypress="validate_SpecialChar(); if (event.keyCode == 13) { return checkStoreUrl(); }" onfocus="FocusIn_StoreUrlForm();" class="placeholder" />
		</span>
		<span class="count-txt">����, ���� 20�� �̳�(�ѱ�, Ư������ ����)</span>
		<p class="txt01" id="txt03" style="display:none"><span>��밡���� �ּ��Դϴ�.</span></p>
		<p class="txt02" id="txt04" style="display:none"><span>�ּҸ� �Է����ּ���.</span></p>
	</li>
	<li class="storeinfo_area">
		<textarea name="ucStoreName$txtStoreInfo" id="ucStoreName_txtStoreInfo" onkeydown="check_Strlen(this, this.form.txtStoreInfoTxtCnt, 90);" onkeyup="check_Strlen(this, this.form.txtStoreInfoTxtCnt, 90);" maxlength="90">���� ���� ���� ȯ���մϴ�.</textarea>
		<span class="count-txt"><input type="text" id="txtStoreInfoTxtCnt" class="count" title="���� ���ڼ�" readonly value="18">/90</span>
		<ul>
			<li>�ٹٲ��� ������� �ʽ��ϴ�.(���� ������ ���� �ڵ� ����)</li>
			<li>Ÿ ���θ� �� ���� ����Ʈ ���� �ܺ� URL ���� �Է� �� ���� ���� �� �� �ֽ��ϴ�.</li>
		</ul>
	</li>
</ul>
</div>
					</div>				
				</div>
				<!-- //����� ���� -->			

				<div class="terms-agree">
					<div class="inner">
						<h3>
							<img id="img_agree03" style="display:none;" src="https://pics.auction.co.kr/join/h3_tit_terms_agree03.gif" alt="�������"/><!-- �Ϲݱ���ȸ�� �� ��� ~03.gif -->
							<img id="img_agree04" style="display:none;" src="https://pics.auction.co.kr/join/h3_tit_terms_agree05.gif" alt="�������"/><!-- �Ǳ��� ȸ�� �� ��� ~04.gif -->
						</h3>
						<div class="terms-cont">
							<div class="all-agree">
								<label for="cb_agreeall"><input type="checkbox" id="cb_agreeall_1" onclick="ToggleAllProvisions(this);" > [��ü����] ���� ȸ������ ����� ��� �����մϴ�.</label>
								<p>[���� �̿���, ���ڱ����ŷ� �̿���, �������� ���� �� �̿�, ���������� ��3�� ����]<p>
							</div>

							<div class="terms-cont-inner">
								<div class="check-set">
									<label for="cbProvision1"><input name="cbProvision1" type="checkbox" id="cbProvision1" onclick="ConfirmProvision(this, &#39;provision&#39;);" />���� �̿��� ����(�ʼ�)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/provision1.aspx" class="txt-view-all" target="_blank">��� ��ü����</a>
									<a class="btn-open toggle" href="#none"><span class="hide">��� ���� ����, �ݱ�</span></a>
								</div>
								<div class="terms-box provision" style="display:block;">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%"  src="provision1.html" title="���� �̿���" ></iframe>
								</div>

								<div class="check-set" >
									<label for="cbFinance"><input name="cbFinance" type="checkbox" id="cbFinance" onclick="ConfirmProvision(this, &#39;finance&#39;);" />���ڱ����ŷ� �̿��� ����(�ʼ�)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/finance.aspx" class="txt-view-all" target="_blank">��� ��ü����</a>
									<a class="btn-close toggle" href="#none"><span class="hide">��� ���� ����, �ݱ�</span></a>
								</div>
								<div class="terms-box finance">
								<iframe scrolling="auto" height="100%" frameborder="0" width="100%" src="finance.html" title="���ڱ����ŷ� �̿���"></iframe>
								</div>
								 
								<div class="check-set">
									<label for="cbIndividualInfo"><input name="cbIndividualInfo" type="checkbox" id="cbIndividualInfo" onclick="ConfirmProvision(this, &#39;individual_info_treatment&#39;);" />�������� ���� �� �̿� ����(�ʼ�)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/IndividualInfoTreatment.aspx" class="txt-view-all" target="_blank">��� ��ü����</a>
								<a class="btn-close toggle" href="#none"><span class="hide">��� ���� ����, �ݱ�</span></a>
								</div>
								<div class="terms-box individual_info_treatment">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="IndividualInfoTreatment.html" title="������������ �� �̿�"></iframe>
								</div>

								<div class="check-set tax_payment_notice">
									<label for="cbTaxConfirm"><input name="cbTaxConfirm" type="checkbox" id="cbTaxConfirm" onclick="ConfirmProvision(this, &#39;tax_payment_notice&#39;);" />���ݳ��� ���� ���ǻ��� Ȯ��(�ʼ�)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/TaxPaymentNotice.aspx" class="txt-view-all" target="_blank">��� ��ü����</a>
									<a class="btn-close toggle" href="#none"><span class="hide">��� ���� ����, �ݱ�</span></a>
								</div>
								<div class="terms-box tax_payment_notice">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="TaxPaymentNotice.html" title="���ݳ��� ���� ���ǻ����� �����Դϴ�."></iframe>
								</div>
							
								<div class="check-set">
									<label for="cbThirdParty"><input name="cbThirdParty" type="checkbox" id="cbThirdParty" onclick="ConfirmProvision(this, &#39;agree_to_provide_personal_info&#39;);" />���������� ��3������ ����(����)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/AgreeToProvidePersonalInfo.aspx" class="txt-view-all" target="_blank">��� ��ü����</a>
									<a class="btn-close toggle" href="#none"><span class="hide">��� ���� ����, �ݱ�</span></a>
								</div>	
								<div class="terms-box agree_to_provide_personal_info">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="AgreeToProvidePersonalInfo.html" title="���������� ��3������"></iframe>
								</div>
								

								

								<!-- WPRA-60 ��ġ���� ��� ���� �ڵ� ��û --> 
								<div class="check-set">
									<label for="cbLocation"><input name="cbLocation" type="checkbox" id="cbLocation" onclick="ConfirmProvision(this,&#39;cbLocation&#39;);" />���� ��ġ���� �̿��� ����(����)</label>
									<a href="https://memberssl.auction.co.kr/membership/signup/provision3.aspx" class="txt-view-all" target="_blank">��� ��ü����</a>
									<a class="btn-close toggle" href="#none"><span class="hide">��� ���� ����, �ݱ�</span></a>
								</div>
								
								<div class="terms-box provision3">
									<iframe scrolling="auto" height="100%" frameborder="0" width="100%" allowtransparency="true" src="provision3.html" title="���� ��ġ���� �̿���"></iframe>
								</div> <!-- // WPRA-60 ��ġ���� ��� ���� �ڵ� ��û -->
							
								<div class="check-set">
									<label for="cbLicensee"><input name="cbLicensee" type="checkbox" id="cbLicensee" onclick="ConfirmProvision(this, 'cbLicensee');"/>������ ���� ����� ����� ���� ���� ����� Ȯ���մϴ�.(�ʼ�)</label>
								</div>

							</div>
							<div class="all-agree txt-none">
								<label for="cb_agreeall"><input type="checkbox" id="cb_agreeall" onclick="ToggleAllProvisions(this);" > [��ü����] ���� ȸ������ ����� ��� �����մϴ�.</label>
							</div>
						</div>
					</div>
				</div>
				<div class="use-notice">
					<p>������ �¶��� �����÷��̽�(����)�� �ŷ��� ��� ȸ�� ���� Ŀ�´����̼ǿ� ���� �����˴ϴ�. ���� ��Ȯ�� ��ȭ��ȣ �� �ּ� (�̸��� ����)�� �Է��ϼž� �������� �ŷ��� �����ϸ�, ����Ȯ�� ���������� ���� å�Ӱ� �������� ȸ�� ������ �����ϰ� �ǿ��� �������� �Է� �� �����Ͻñ� �ٶ��ϴ�.</p>
				</div>
				<div class="btns-box">
					<input id="btn_signup" type="button" value="ȸ������" class="join" onclick="ClickSignupButton();">
					<a id="temp_signup" style="display:none;" href="#" onclick="javascript:ClickSignupButton();"><img src="https://pics.auction.co.kr/join/btn_temporary_join.gif" /></a>
					<input type="button" value="���" class="cancel">
				</div>
				<!-- layer popup start -->
				<div class="popup-outter pop-foreigner" style="display:none;">
					<div class="dimmed"></div>
					<div class="popup-wrap" >
						<div class="popup-inner" >
							<div class="popup-head">
								<h2><img src="https://pics.auction.co.kr/join/h2_foreign_cert.png" alt="�ܱ��� ��Ϲ�ȣ ����"></h2>
							</div>
							<div class="popup-cont-outter">
								<div class="popup-cont">
									<label class="agree"><input value="rbIdentityInfoY" name="rbIdentityInfo" type="radio" id="rbIdentityInfoY" />�����ĺ����� ����</label>
									<label class="noagree"><input type="radio" id="rbIdentityInfoN" name="rbIdentityInfo" >�������� ����</label>
									<div class="txt-box">
										<p class="first">�� ���� �����ĺ������� ó���� ���Ͽ� ����������ȣ�� �� 24���� ���� ������ ���Ǹ� ���� ��ó���� �մϴ�.</p>
										<p>1. ���������� ó�� ����<br />
										���� �Ǹ�Ȯ��, �̼����ڿ��� �ŷ� Ȯ��</p>
										<p>2. ó���Ϸ��� ���������� �׸�<br />
										�ܱ��ε�Ϲ�ȣ</p>
										<p>3. ���������� ���� �� �̿�Ⱓ<br />
										��Ģ������ �������� �� �������� ������ �޼��ϱ���� �����ϸ�, ������ �޼��Ǹ� ��ü ����<br />
										�ı��մϴ�. ���� ȸ������ �� ���� ���ɿ� ���� �Ǹ����� �� ����Ȯ�� �������� ������<br />
										�ܱ��ε�Ϲ�ȣ�� ������ �������� �ʽ��ϴ�.</p>
									</div>
									<ul class="enter-list">
										<li><input name="txtForeignMemberName" type="text" id="txtForeignMemberName" value="�̸�" onfocus="this.value=&#39;&#39;;" /> <label for="key_sec" ><input id="key_sec" type="checkbox" onchange="ChangeKeyboardSecurity(this);" > Ű���� ���� ON</label></li>
										<li><input name="txtSsn" type="text" id="txtSsn" value="�ܱ��� ��Ϲ�ȣ(-���� �Է����ּ���)" onfocus="this.value=&#39;&#39;;" onkeyUp="CheckNumberWithKeyupEvent(this);" /></li>
									</ul>
									<p class="guide-ment">�� �Է��Ͻ� �ܱ��ε�Ϲ�ȣ�� �Ǹ����� �� ����Ȯ���� ���ؼ��� ����ϸ�, ���� DB�δ� ������� �ʽ��ϴ�.</p>
								</div>
								<div class="btn-bottom">
									<input type="button" value="�����ϱ�" onclick="CallAuthenticateForeigner();">
								</div>
							</div>
							<input type="button" value="�˾�â �ݱ�" class="close" onclick="$('.pop-foreigner').hide();" />
						</div>
					</div>
				</div>
				<!-- //layer popup end -->
				<!-- ���� ���� ��û �˾� -->
				<div id="div_cs_certified" class="popup-outter pop-cs-certified" style="display:none;">
					<div class="dimmed"></div>
					<div class="popup-wrap">
						<div class="popup-inner">
							<div class="popup-head">
								<h2>���� ���� ��û �Ϸ�</h2>
							</div>
							<div class="popup-cont-outter">
								<div class="popup-cont">
									<strong>���� ���� ��û�� �Ϸ�Ǿ����ϴ�.</strong>
									<p>
										<strong>������(<em class="num">1588-0184</em>)</strong>���� 1�� �̳�(������ ����) ���� ��� ���� �� ���������� ���� �帳�ϴ�.<br />
										���� ������ ���Ͻ� ��� �ٷ� �����ͷ� ��ȭ�ּ���.<br />
										<span>(�α����� ���� ���� �Ϸ� �� �����մϴ�.)</span>
									</p>
								</div>
								<div class="btn-bottom">
									<input type="button" value="�ݱ�" onclick="location.href='http://www.auction.co.kr';">
								</div>
							</div>
							<input type="button" value="�˾�â �ݱ�" class="close" onclick="location.href='http://www.auction.co.kr';" />
						</div>
					</div>
				</div>
				<!-- //���� ���� ��û �˾� -->
			</div>
    
<script type="text/javascript">
<!--
document.domain = 'auction.co.kr';//-->
</script>
</form>
		<script type="text/javascript" src="https://script.auction.co.kr/common/footer.js"></script>
	</body>
</html>