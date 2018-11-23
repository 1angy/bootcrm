$('.btn-submit').click(function() {
	var username = $('.username').val();
	var password = $('.pwd').val();
	if (username == null || username == "") {
		$('.checktips').removeClass('shake');
		$('.checktips').html("用户名不能为空");
		$('.checktips').addClass('shake', 1000);
		return;
	} else if (password == null || password == "") {
		$('.checktips').html("密码不能为空");
		$('.checktips').removeClass('shake');
		$('.checktips').addClass('tada');
		return;
	} else {
	/*	$.ajax({
			url:"login",
			type:"post",
			data:{"username":username,"password":password},
			success:function(data){
				$('.checktips').html(data);
			}
		});*/
		$(".login-form").submit();
	}
});
