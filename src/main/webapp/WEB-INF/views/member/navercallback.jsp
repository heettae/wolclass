<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId({
	    clientId: "eGvYqWZMB4smx8mntk57", 
	    callbackUrl: "http://localhost:8080/", 
	    isPopup: false,
	    callbackHandle: true
	});
	naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail();
			var name = naverLogin.user.getName();
			var id = naverLogin.user.getId();
			
		    $.ajax({
		        type: 'post',
		        url: '/member/naver',
		        data: { 'n_email':email,'n_name':name,'n_id':id},
		        dataType: 'text',
		        success: function(data) {
					if(data!=null) {
						location.href="/";
					}
				},
				error: function(result) {
					console.log('오류 발생');
				}
		    });
		} 
		else {
	   		 console.log("callback 처리에 실패하였습니다.");
		}
	});
});

</script>


