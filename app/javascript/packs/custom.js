var logon = function() {
	$.ajax({
		type: "POST",
		url: "/dashboard/logon",
		data: {
			username: $("#username").val(),
			password: $("#password").val(),
			logonurl: $("#logonurl").val(),
			wsdlurl:  $("#wsdlurl").val()
		},
		async: false,
		success: function(data) {
			
			console.log(data);
			$("#sessionsecret").val(data);
		}
	});
}
var logoff = function() {
	$.ajax({
		type: "POST",
		url: "/dashboard/logoff",
		data: {
			sessionsecret: $("#sessionsecret").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			wsdlurl:  $("#wsdlurl").val()
		},
		async: false,
		success: function(data) {
			$("#sessionsecret").val("");
		}
	});	
}
var keepalive = function() {
	$.ajax({
		type: "POST",
		url: "/dashboard/keepalive",
		data: {
			sessionsecret: $("#sessionsecret").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			wsdlurl:  $("#wsdlurl").val()
		},
		async: false,
		success: function(data) {
			console.log(data);//$("#sessionsecret").val("");
		}
	});	
}
var executequery = function() {
	$.ajax({
		type: "POST",
		url: "/dashboard/executequery",
		data: {
			sessionsecret: $("#sessionsecret").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			wsdlurl:  $("#wsdlurl").val(),
			sql: $("#sql").val()
		},
		async: false,
		success: function(data) {
			console.log(data);//$("#sessionsecret").val("");
		}
	});	
}
$(function() {
	$("#logon").on("click", function() {
		if ($("#sessionsecret").val() == "") {
			logon();
		} else {
			keepalive();
		}
	});
	$("#logoff").on("click", function() {
		logoff();
	});



})