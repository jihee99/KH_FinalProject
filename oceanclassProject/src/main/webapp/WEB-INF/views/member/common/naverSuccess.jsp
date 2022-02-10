<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridLogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
    margin: 0;
    padding: 0;
}
 
h3 {
    display: inline-block;
    padding: 0.6em;
}
</style>
<script type="text/javascript">
    $(document).ready(function() {
        var name = ${result}.response.name;
        var email = ${result}.response.email;
        $("#name").html("환영합니다. "+name+"님");
        $("#id").html(id);
      });
</script>
 
</head>
<body>
    <script>
		var naver_id_login = new naver_id_login("Jrjt2SGEiCrkTfdJbLaH","http://localhost:8888/oceanclass/naver.me")
		alert(naver_id_login.oauthParams.access_token);
		naver_id_login.get_naver_userprofile("naverSignCallback()");
		
		var username, id;
		function naverSignInCallback() {
			username = naver_id_login.getProfileDate('nickname');
			
			id = naver_id_login.getProfileDate('id');
			
			var url = "http://" + window.location.hostname +
					  ( (location.port==""||location.port==undefined)?"":":" + location.port) + "최종로그인url";
			post_to_url( url, {'id': id, 'username':username})
		}
    </script>
 
</body>

<script type="text/javascript">
function post_to_url(path, params, method='post') {
	const form = document.createElement('form');
	form.method = method;
	form.action = path;
	
	for(const key in params) {
		if(params.hasOwnProperty(key)) {
			const hiddenField = document.createElement('input');
			hiddenField.type = 'hidden';
			hiddenField.name = key;
			hiddenField.value = params[key];
			form.appendChild(hiddenField);
		}
	}
	document.body.appendChild(form);
	
	form.submit();
}
</script>

</html>
