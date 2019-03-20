function showDetail() {
	var id = $("#Uid").val();
	alert(id);
	$.ajax({
		url : '../../Controller',
		type : 'post',
		data : {
			actionCode : "viewData",
			id : id
		},
		success : function(data) {

			$("#data").html(data);
		}
	});
}

function ShowData() {
	$("#load").show();
	$.ajax({
		type : 'post',
		url : '../../Controller',
		data : $('#addidea').serialize(),
		success : function(data) {
			$("#load").hide();
			$("#success").show();
		}

	});
}

function checkEmail() {

	var email = $("#emailId").val();
	$.ajax({
		type : 'post',
		url : '../../Controller',
		data : {
			email : email,
			actionCode : "verifyEmail"
		},
		success : function(data) {
			$("#success").html(data);
			if (data != '') {
				$('#emailId').val('');
			}
		}
	});
}

function showProfile() {
	var id = $("#Uid").val();
	$("#load").show();
	$.ajax({
		type : 'post',
		url : '../../Controller',
		data : {
			id : id,
			actionCode : "showProfile"
		},
		success : function(data) {
			$("#load").hide();
			$("#profileData").html(data);
		}
	});
}

function showProfiles() {
	var id = $("#Uid").val();
	$("#load").show();
	$.ajax({
		type : 'post',
		url : '../../Controller',
		data : {
			id : id,
			actionCode : "showProfiles"
		},
		success : function(data) {
			$("#load").hide();
			$("#profileData").html(data);
		}
	});
}

function updateUser() {

	$.ajax({
		type : 'post',
		url : '../../fileUpload',
		data : $('#updateuser').serialize(),
		success : function(data) {

			$("#success1").show();
		}
	});

}

function addContact() {

	$.ajax({
		type : 'post',
		url : '../../Controller',
		data : $('#contact-form').serialize(),
		success : function(data) {

			$("#contactForm").html(data);
		}
	});
}


function showIdea() {
	$("#load").show();
	$.ajax({
		url : '../../Controller',
		type : 'post',
		data : {
			actionCode : "viewIdea"
		},

		success : function(data) {
			$("#load").hide();
			$("#data").html(data);
		}
	});

}

function intrested(Id) {
	var email = $("#Investoremail").val();
	$("#img").show();
	$("#abc").hide();
	$.ajax({
		url : '../../Controller',
		type : 'post',
		data : {
			actionCode : "intrested",
			IdeaId : Id,
			Email : email
		},
		success:function(data){
			$("#img").hide();
			$("#abc").show();
		}
	});
}
