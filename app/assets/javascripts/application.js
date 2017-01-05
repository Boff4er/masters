// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
// require jquery.turbolinks
//= require jquery_ujs
// require turbolinks

//= require jquery-ui
//= require jquery.autocomplete

// require jquery-ui
// require autocomplete-rails

// require turbolinks.redirect

//= require jquery.slides.min
//= require select2

//= require fancybox/jquery.fancybox
//= require fancybox/jquery.fancybox.pack
//= require fancybox/jquery.fancybox-buttons
//= require fancybox/jquery.fancybox-media
//= require fancybox/jquery.fancybox-thumbs

//= require jquery.plugin
//= require jquery.realperson
//= require jquery.mask

// require animations
//= require notify
//= require recorder
//= require audio

var audiossss = "";


$(window).resize(function(){
	var w =  parseInt($(".slider-block .slider").css("width"));
	var hh = 496 * (w / 1660);
	$(".slider-block .slider").css({"height": hh + "px"});
	
	var h = $(document).height();
	$(".left-block").css({"height": h + "px"});
	var wh = $(window).height();
	$(".main-page").css({"height": wh + "px"});
	var l_w = parseInt($(".main-cont .left-block").css("width"));
	$(".main-cont .left-block-fixed").css({"width": l_w + "px"});

	var lh = parseInt($(".left-block-fixed").css("height"));
	if(lh > wh) {
		$(".left-block-fixed").css({"position": "relative"});
	} else {
		$(".left-block-fixed").css({"position": "fixed"});
	}

});

$(function(){

	$(".fancybox").fancybox({
		prevEffect		: 'none',
		nextEffect		: 'none',
		padding			: 0,
	});

	$(".theme-block .item").click(function(){
		var href = $(this).attr("href");
		if (href.length == 0) {
			$(".main-cont .left-block").removeClass("ligth-theme");
			$.post("/set_theme", {val: 0}, function(){

			});
		} else {
			$(".main-cont .left-block").addClass("ligth-theme");
			$.post("/set_theme", {val: 1}, function(){

			});
		}
		return false;
	});

	$(".theme-block .item").click(function(){
		var clazz = $(this).attr("href");
		$(".theme-block .item").removeClass("active");
		$(this).addClass("active");
		if (clazz == "") {
			$("body").removeClass("ligth-theme")
		} else {
			$("body").addClass("ligth-theme")
		}
		return false;
	});

	setTimeout(function(){

		var w =  parseInt($(".slider-block .slider").css("width"));
		var hh = 496 * (w / 1660);
		$(".slider-block .slider").css({"height": hh+"px"});

		var h = $(document).height();
		$(".left-block").css({"height": h + "px"});
		var wh = $(window).height();
		$(".main-page").css({"height": wh + "px"});

		var l_w = parseInt($(".main-cont .left-block").css("width"));
		$(".main-cont .left-block-fixed").css({"width": l_w + "px"});

		var lh = parseInt($(".left-block-fixed").css("height"));
		if(lh > wh) {
			$(".left-block-fixed").css({"position": "relative"});
		} else {
			$(".left-block-fixed").css({"position": "fixed"});
		}

		$( "#bullets li:nth-child(1)" ).append( "<i>Цели проекта</i>" );
		$( "#bullets li:nth-child(1)" ).append( "<span>1/</span>" );

		$( "#bullets li:nth-child(2)" ).append( "<i>Кто поможет?</i>" );
		$( "#bullets li:nth-child(2)" ).append( "<span>2/</span>" );

		$( "#bullets li:nth-child(3)" ).append( "<i>Поиск обращений</i>" );
		$( "#bullets li:nth-child(3)" ).append( "<span>3/</span>" );

	}, 400);

	$('select').select2();
	
	$(".task .task-left-list .left-map .map-full, .order-info-4 .form-2 .map-block > a, .task .task-right .map-block .full-map, .profile-right .full-map").click(function(){
		$(".popup-hidden").show();
		$("#map").parent().addClass("full");
		google.maps.event.trigger(map, 'resize');
		return false;
	});

	$(".works a").fancybox();

	$(".sertif a").fancybox();
	$(".task .task-right .description .info-img").fancybox();

	$('#autocomplete').autocomplete({
	    serviceUrl: "/city-serach",
	      minLength: 2,
	      onSelect: function( event, ui ) {
	      	var id = event.id;
	      	document.location.href="/tasks?cat_id="+id;
	      }
	});
});

$(window).resize(function(){
	var h_header = parseInt($("header").css("height"));
	if ($(window).height() > (621 + 70)) {
		$(".main-form").css({"height": $(window).height() - 70 + "px"});
		$(".main-form .left").css({"height": $(window).height() - 70 + "px"});
	}
});


$(function() {

	var h_header = parseInt($("header").css("height"));
	if ($(window).height() > (621 + 70)) {
		$(".main-form").css({"height": $(window).height() - 70 + "px"});
		$(".main-form .left").css({"height": $(window).height() - 70 + "px"});
	}

	$( ".datepicker" ).datepicker({
		dateFormat: "dd.mm.yy"
	});

	$( "#slider-amount" ).slider({
      value:2000,
      min: 0,
      max: 10000,
      step: 2000,
      range: "min",
      slide: function( event, ui ) {
      	$(".fomt-2-1").removeClass("fomt-active");
		$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
		$(".fomt-2-2").removeClass("fomt-active");
		$(".fomt-2-2 input[type='checkbox']").prop('checked', false);
		$(".fomt-2-3").addClass("fomt-active");
		$(".fomt-2-3 input[type='checkbox']").prop('checked', true); 

        if (ui.value == 0) {
        	$(".order-info-2 .fomt-2-3 .my-slider .label").text("Укажите бюджет");
        	$(".order-info-2 .fomt-2-3 .my-slider .value").html("ДО - 0 <img src='/assets/r-2.png'>");
        }
        if (ui.value == 2000) {
        	$(".order-info-2 .fomt-2-3 .my-slider .label").text("МЕЛКИЙ");
        	$(".order-info-2 .fomt-2-3 .my-slider .value").html("ДО - 2000 <img src='/assets/r-2.png'>");
        }
        if (ui.value == 4000) {
        	$(".order-info-2 .fomt-2-3 .my-slider .label").text("НЕБОЛЬШОЙ");
        	$(".order-info-2 .fomt-2-3 .my-slider .value").html("ДО - 4000 <img src='/assets/r-2.png'>");
        }
        if (ui.value == 6000) {
        	$(".order-info-2 .fomt-2-3 .my-slider .label").text("СРЕДНИЙ");
        	$(".order-info-2 .fomt-2-3 .my-slider .value").html("ДО - 6000 <img src='/assets/r-2.png'>");
        }
        if (ui.value == 8000) {
        	$(".order-info-2 .fomt-2-3 .my-slider .label").text("БОЛЬШОЙ");
        	$(".order-info-2 .fomt-2-3 .my-slider .value").hmtl("ДО - 8000 <img src='/assets/r-2.png'>");
        }
        if (ui.value == 10000) {
        	$(".order-info-2 .fomt-2-3 .my-slider .label").text("МАКСИМАЛЬНЫЙ");
        	$(".order-info-2 .fomt-2-3 .my-slider .value").html("ДО - 10000 <img src='/assets/r-2.png'>");
        }
        $('input[name="price_range"]').val(ui.value);

      }
    });
	
	$(".popup-reg input[name='user[phone1]']").mask('+7 (000)-000-00-00');

	$(".btn-login, .auth-small").click(function(){
		$(".popup-hidden").show();
		$(".popup-auth").show();
		return false;
	})
	
	$(".popup-hidden, .popup .close").click(function(){
		$(".popup-hidden").hide();
		$(".popup").hide();
		$("#map").parent().removeClass("full");
		$(".popup-settings").show();
		return false;
	});

	$(".order-info-4 .form-1 .right .btn").click(function(){
		$(".popup-hidden").show();
		$(".popup-soc").show();
		return false;
	});

	$(".fomt-2-1 input[type='checkbox']").change(function(){
		if ($(this).is(':checked')) {
			$(".fomt-2-1").removeClass("fomt-active");
			$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-2").removeClass("fomt-active");
			$(".fomt-2-2 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-3").removeClass("fomt-active");
			$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
			$(this).parent().addClass("fomt-active");
			$(".fomt-2-1 input[type='checkbox']").prop('checked', true); 
		} else {
			$(".fomt-2-1").removeClass("fomt-active");
			$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-2").removeClass("fomt-active");
			$(".fomt-2-2 input[type='checkbox']").prop('checked', false);
			$(".fomt-2-3").removeClass("fomt-active");
			$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
		}
	});

	$(".fomt-2-2 input[type='checkbox']").change(function(){
		if ($(this).is(':checked')) {
			$(".fomt-2-1").removeClass("fomt-active");
			$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-2").removeClass("fomt-active");
			$(".fomt-2-2 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-3").removeClass("fomt-active");
			$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
			$(this).parent().addClass("fomt-active");
			$(".fomt-2-2 input[type='checkbox']").prop('checked', true); 
		} else {
			$(".fomt-2-1").removeClass("fomt-active");
			$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-2").removeClass("fomt-active");
			$(".fomt-2-2 input[type='checkbox']").prop('checked', false);
			$(".fomt-2-3").removeClass("fomt-active");
			$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
		}
	});

	$(".fomt-2-3 input[type='checkbox']").change(function(){
		if ($(this).is(':checked')) {
			$(".fomt-2-1").removeClass("fomt-active");
			$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-2").removeClass("fomt-active");
			$(".fomt-2-2 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-3").removeClass("fomt-active");
			$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
			$(this).parent().addClass("fomt-active");
			$(".fomt-2-3 input[type='checkbox']").prop('checked', true); 
		} else {
			$(".fomt-2-1").removeClass("fomt-active");
			$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
			$(".fomt-2-2").removeClass("fomt-active");
			$(".fomt-2-2 input[type='checkbox']").prop('checked', false);
			$(".fomt-2-3").removeClass("fomt-active");
			$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
		}
	});

	$('.order-info-2 .fomt-2-1 input[type="text"]').click(function(){
		$(".fomt-2-1").addClass("fomt-active");
		$(".fomt-2-1 input[type='checkbox']").prop('checked', true); 
		$(".fomt-2-2").removeClass("fomt-active");
		$(".fomt-2-2 input[type='checkbox']").prop('checked', false);
		$(".fomt-2-3").removeClass("fomt-active");
		$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
		return false;
	});

	$('.order-info-2 .fomt-2-2 input[type="text"]').click(function(){
		$(".fomt-2-1").removeClass("fomt-active");
		$(".fomt-2-1 input[type='checkbox']").prop('checked', false); 
		$(".fomt-2-2").addClass("fomt-active");
		$(".fomt-2-2 input[type='checkbox']").prop('checked', true);
		$(".fomt-2-3").removeClass("fomt-active");
		$(".fomt-2-3 input[type='checkbox']").prop('checked', false); 
		return false;
	});

	$(".order-info-3 .form-1 input[type='checkbox']").change(function(){
		if ($(this).is(':checked')) {
			$(".order-info-3 .form-1").removeClass("form-active");
			$(".order-info-3 .form-1 input[type='checkbox']").prop('checked', false); 
			$(".order-info-3 .form-2").removeClass("form-active");
			$(".order-info-3 .form-2 input[type='checkbox']").prop('checked', false); 
			$(this).parent().addClass("form-active");
			$(".order-info-3 .form-1 input[type='checkbox']").prop('checked', true); 
		} else {
			$(".order-info-3 .form-1").removeClass("form-active");
			$(".order-info-3 .form-1 input[type='checkbox']").prop('checked', false);
			$(".order-info-3 .form-2").removeClass("form-active");
			$(".order-info-3 .form-2 input[type='checkbox']").prop('checked', false); 
		}
	});

	$(".order-info-3 .form-2 input[type='checkbox']").change(function(){
		if ($(this).is(':checked')) {
			$(".order-info-3 .form-1").removeClass("form-active");
			$(".order-info-3 .form-1 input[type='checkbox']").prop('checked', false); 
			$(".order-info-3 .form-2").removeClass("form-active");
			$(".order-info-3 .form-2 input[type='checkbox']").prop('checked', false); 
			$(this).parent().addClass("form-active");
			$(".order-info-3 .form-2 input[type='checkbox']").prop('checked', true); 
		} else {
			$(".order-info-3 .form-1").removeClass("form-active");
			$(".order-info-3 .form-1 input[type='checkbox']").prop('checked', false);
			$(".order-info-3 .form-2").removeClass("form-active");
			$(".order-info-3 .form-2 input[type='checkbox']").prop('checked', false); 
		}
	});

	$('select[name="cat"]').change(function(){
		var cat = $(this).val();
		$(".sub-cat").hide();
		$(".sub-cat[parent_id='"+cat+"']").show();
	});

	$("#new_task input[type='submit']").click(function(){
		var cat = $('#new_task select[name="cat_id"]').val();
		if (cat == 0 || cat == "0") {
			alert("Укажите категорию");
			return false;
		}
		var name = $('#new_task input[name="name"]').val();
		if (name.length == 0) {
			alert("Укажите заголовок");
			return false;
		}

		var description = $('#new_task textarea[name="description"]').val();
		if (description.length == 0) {
			alert("Укажите описание");
			return false;
		}

		var price_fix = $('#new_task input[name="price_fix"]').val();
		if (price_fix.length == 0) {
			alert("Укажите бюджет");
			return false;
		}
		
		
		var city_from = $('#new_task input[name="city_from"]').val();
		if (city_from.length == 0) {
			alert("Укажите Город");
			return false;
		}
		
		$(".popup-create").hide();
		$(".popup-alert .title").text("Спасибо");
		$(".popup-alert .quest-text").text("Ваша заявка размещена. Она появится на сайте после проверки модераторами. Вы можете отредактировать или воспользоваться платными услугами в личном кабинете.");
		$(".popup-alert").show();
		$(".popup-hidden").show();
		setTimeout(function () {
			$('#new_task').submit();
		},3000);
		return false;
	});

	$("#new_task_2 input[type='submit']").click(function(){
		var cat = $('#new_task_2 select[name="cat_id"]').val();
		if (cat == 0 || cat == "0") {
			alert("Укажите категорию");
			return false;
		}
		var name = $('#new_task_2 input[name="name"]').val();
		if (name.length == 0) {
			alert("Укажите заголовок");
			return false;
		}

		var description = $('#new_task_2 textarea[name="description"]').val();
		if (description.length == 0) {
			alert("Укажите описание");
			return false;
		}

		var price_fix = $('#new_task_2 input[name="price_fix"]').val();
		if (price_fix.length == 0) {
			alert("Укажите бюджет");
			return false;
		}
		
		
		var city_from = $('#new_task_2 input[name="city_from"]').val();
		if (city_from.length == 0) {
			alert("Укажите Город");
			return false;
		}
		
		$(".popup-create").hide();
		$(".popup-alert .title").text("Спасибо");
		$(".popup-alert .quest-text").text("Ваша заявка размещена. Она появится на сайте после проверки модераторами. Вы можете отредактировать или воспользоваться платными услугами в личном кабинете.");
		$(".popup-alert").show();
		$(".popup-hidden").show();
		setTimeout(function () {
			$('#new_task_2').submit();
		},3000);
		return false;
	});

	$(".edit-contacts").click(function(){
		$(".popup-hidden").show();
		$(".popup-contacts").show();
		return false;
	});

	$(".edit-learn").click(function(){
		$(".popup-hidden").show();
		$(".popup-learn").show();
		return false;
	});

	$(".edit-garant").click(function(){
		$(".popup-hidden").show();
		$(".popup-garant").show();
		return false;
	});

	$(".edit-pays").click(function(){
		$(".popup-hidden").show();
		$(".popup-pays").show();
		return false;
	});

	$(".edit-raions").click(function(){
		$(".popup-hidden").show();
		$(".popup-raions").show();
		return false;
	});

	$(".edit-other").click(function(){
		$(".popup-hidden").show();
		$(".popup-other").show();
		return false;
	});

	$(".edit-spec").click(function(){
		$(".popup-hidden").show();
		$(".popup-spec").show();
		return false;
	});

	$(".edit-image").click(function(){
		$(".popup-hidden").show();
		$(".popup-image").show();
		return false;
	});

	$(".edit-profile-user").click(function(){
		$(".popup-hidden").show();
		$(".popup-edit-user").show();
		return false;
	});

	$(".btn-add-photo").click(function(){
		$(".popup-hidden").show();
		$(".popup-image").show();
		return false;
	});

	$(".btn-add-uarticle").click(function(){
		$(".popup-hidden").show();
		$(".popup-uarticle").show();
		return false;
	});

	$(".btn-add-record").click(function(){
		var to_user_id = $(this).attr("to_user_id");
		$(".popup-audio input[name='user_id']").val(to_user_id);
		$(".popup-hidden").show();
		$(".popup-record").show();
		return false;
	});

	$(".popup-audio .btn").click(function(){
		console.log(audiossss);
		var fd = new FormData();
		fd.append('fname', 'test.wav');
		fd.append('audio', audiossss);
		fd.append('utf8', $(".popup-audio form input[name='utf8']").val());
		fd.append('user_id', $(".popup-audio form input[name='user_id']").val());
		fd.append('authenticity_token', $(".popup-audio form input[name='authenticity_token']").val());

		$.ajax({
		    type: 'POST',
		    url: $(".popup-audio form").attr("action"),
		    data: fd,
		    processData: false,
		    contentType: false
		}).done(function(data) {
		    //alert("Сообщение отправлено");
		    document.location.href = document.location.href;
		});
		return false;
	});

	$("#left-form select").change(function(){
		$(this).parent().parent().parent().submit();
	});

	$(".audio-list .item .play").click(function(){
		if($(this).find("img").attr("src") == "/assets/play.png") {
			$(this).find("img").attr({"src": "/assets/pause.png"})
			$(this).find("audio")[0].play();
		} else {
			$(this).find("img").attr({"src": "/assets/play.png"})
			$(this).find("audio")[0].pause();
		}

		return false;
	});

	$(".description .item .play").click(function(){
		if($(this).find("img").attr("src") == "/assets/play.png") {
			$(this).find("img").attr({"src": "/assets/pause.png"})
			$(this).find("audio")[0].play();
		} else {
			$(this).find("img").attr({"src": "/assets/play.png"})
			$(this).find("audio")[0].pause();
		}
		return false;
	});

	$(".record-2").click(function(){
		if ($(this).find("img").attr("src").indexOf("/assets/record-2-r") < 0) {
			$(this).find("img").attr({"src": "/assets/record-2-r.png"});
			$(this).find("audio")[0].play();
		} else {
			$(this).find("img").attr({"src": "/assets/record-2.png"});
			$(this).find("audio")[0].pause();
		}

		return false;
	});

	$(".record-3").click(function(){
		$(".popup-audio .record-line .record-2").addClass("disabled");
        $(".popup-audio .record-line .record-3").addClass("disabled");
        $(".popup-audio .record-line audio").attr({"src": ""});

		return false;
	});

	$(".profile-right .btn-green, .btn-master-message").click(function(){
		var user_id = $(this).attr("user_id");
		if (user_id && user_id != undefined) {
			$(".popup-message input[name='user_id']").val(user_id);	
		}
		$(".popup-hidden").show();
		$(".popup-message").show();
		return false;
	});

	$(".profile-left .user .likes img").click(function(){
		var user_id = $(this).attr("user_id");
		$.post("/like", {user_id: user_id}, function(date){
			if (date.error == true) {
				alert(date.error_text);
			} else {
				document.location.href = document.location.href;
			}
		});
		return false;
	});

	$("input[name='file_image']").change(function(){
		var obj = this;
		var id = $(this).attr("id");
		id = parseInt(id.substring(3, id.length));
		if (obj.files.length == 1) {
			if (obj.files && obj.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $('.order-info-1 .fomt-1 label .img-bg').attr({"src": e.target.result});

		        }
		        reader.readAsDataURL(obj.files[0]);
		    }
		}
	});

	$("input[id='photo']").change(function(){
		var obj = this;
		var id = $(this).attr("id");
		id = parseInt(id.substring(3, id.length));
		if (obj.files.length == 1) {
			if (obj.files && obj.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $('.reg-form .reg-from-1 label .img-bg').attr({"src": e.target.result});
		            $('.reg-form .reg-from-1 label .img-bg').show();

		        }
		        reader.readAsDataURL(obj.files[0]);
		    }
		}
	});

	$("#user_password").change(function(){
		var value = $(this).val();
		$("#user_password_repeat").val(value);
		return false;
	});

	$(".main-form .mouse-block img, .top-registration .scroll img").click(function(){
		$('html, body').animate({
	    	scrollTop: $(window).height()
		}, 500, function(){
		});  
		return false;
	});

	$(".right-block-settings .btn").click(function(){
		$(".popup-shablon").show();
		$(".popup-hidden").show();
		return false;
	});

	$(".right-block-balance .btn").click(function(){
		$(".popup-balance").show();
		$(".popup-hidden").show();
		return false;
	});

	$(".right-block-settings .line a").click(function(){
		var answer_id = $(this).attr("answer_id");
		var name = $(this).attr("name");
		var description = $(this).attr("description");
		$(".popup-shablon input[name='answer_id']").val(answer_id);
		$(".popup-shablon input[name='name']").val(name);
		$(".popup-shablon textarea").val(description);
		$(".popup-shablon").show();
		$(".popup-hidden").show();
		return false;
	});

	$(".right-block-settings .answer_remove").click(function(){
		var answer_id = $(this).attr("answer_id");
		$.post("/answer_remove", {answer_id: answer_id}, function(){
			document.location.href = document.location.href;
		});
		return false;
	});

	$(".btn-master-task").click(function(){
		var task_id = $(this).attr("task_id");
		$(".popup-order input[name='task_id']").val(task_id);
		$(".popup-order").show();
		$(".popup-hidden").show();
		return false;
	});

	$(".btn-master-task-delete").click(function(){
		var order_id = $(this).attr("order_id");
		var task_id = $(this).attr("task_id");
		$.post("/delete_order", {order_id: order_id, task_id: task_id}, function(){
			document.location.href = document.location.href;
		});
		return false;
	});

	$(".btn-add-to-favuser").click(function(){
		var user_id = $(this).attr("user_id");
		var type = $(this).attr("type");
		$.post("/add_to_favuser", {user_id: user_id, type: type}, function(){
			$(".popup-alert .title").text("Спасибо");
			if (type == "1")
				$(".popup-alert .quest-text").text("Специалист добавлен в избранное.");
			else
				$(".popup-alert .quest-text").text("Специалист удален из избранного.");
			$(".popup-alert").show();
			$(".popup-hidden").show();
		});
		return false;
	});

	$(".btn-add-to-favtask").click(function(){
		var task_id = $(this).attr("task_id");
		var type = $(this).attr("type");
		$.post("/add_to_favtask", {task_id: task_id, type: type}, function(){
			$(".popup-alert .title").text("Спасибо");
			if (type == "1")
				$(".popup-alert .quest-text").text("Обращение добавлено в избранное.");
			else
				$(".popup-alert .quest-text").text("Обращение удалено из избранного.");
			$(".popup-alert").show();
			$(".popup-hidden").show();
		});
		return false;
	});

	$(".btn-answer").click(function(){
		var from_user = $(this).attr("from_user");
		var to_user = $(this).attr("to_user");
		var order_id = $(this).attr("order_id");
		$(".popup-answer input[name='from_user']").val(from_user);
		$(".popup-answer input[name='to_user']").val(to_user);
		$(".popup-answer input[name='order_id']").val(order_id);
		$(".popup-answer").show();
		$(".popup-hidden").show();
		return false;
	});

	$(".btn-master-task-edit").click(function(){
		var order_id = $(this).attr("order_id");
		var price = $(this).attr("price");
		var ltime = $(this).attr("ltime");
		var description = $(this).attr("description");
		$(".popup-order input[name='order_id']").val(order_id);
		$(".popup-order input[name='price']").val(price);
		$(".popup-order input[name='ltime']").val(ltime);
		$(".popup-order textarea").val(description);
		$(".popup-order").show();
		$(".popup-hidden").show();
		return false;
	});

	$(".btn-order-yes").click(function(){
		var order_id = $(this).attr("order_id");
		var userdo_id = $(this).attr("userdo_id");
		var task_id = $(this).attr("task_id");
		$.post("/change_order", {order_id: order_id, userdo_id: userdo_id, status: "yes", task_id: task_id}, function(data){
			$(".popup-hidden").show()
			$(".popup-answer-yes span.name").text(data.name);
			$(".popup-answer-yes").show()
		});
		return false;
	});

	$(".btn-order-no").click(function(){
		var order_id = $(this).attr("order_id");
		var userdo_id = $(this).attr("userdo_id");
		var task_id = $(this).attr("task_id");
		$.post("/change_order", {order_id: order_id, userdo_id: userdo_id, status: "no", task_id: task_id}, function(){
			document.location.href = document.location.href;
		});
		return false;
	});

	$(".btn-task-done").click(function(){
		var task_id = $(this).attr("task_id");
		var status = $(this).attr("status");
		$.post("/change_task", {task_id: task_id, status: status}, function(){
			document.location.href = document.location.href;
		});
		return false;
	});

	$(".btn-task-finish").click(function(){
		var task_id = $(this).attr("task_id");
		var status = $(this).attr("status");
		$.post("/change_task", {task_id: task_id, status: status}, function(){
			$(".popup-recall").show();
			$(".popup-hidden").show();
		});
		return false;
	});

	$(".task .task-left ul li a, .questions .item, .question-list ul li a, .question-ul a").click(function(){
		$(".popup-quest").show();
		$(".popup-hidden").show();
		return false;
	});

	$(".select select").change(function(){
		$(this).parent().submit();
	});

	$(".btn-set-user-type").click(function(){
		var user_type = $(this).attr("user_type");
		$.post("/set_user_type", {user_type:user_type}, function(){
			document.location.href = document.location.href;
		});
		return false;
	});

	$('video').on('ended', function () {
	  this.load();
	  this.play();
	});

	$(".top-work-buttons .delete").click(function(){
		var task_id = $(this).attr("task_id");
		$.post("/task_delete", {task_id: task_id}, function(){
			$(".popup-alert .title").text("Внимание");
			$(".popup-alert .quest-text").text("Ваша заявка удалена.");
			$(".popup-alert").show();
			$(".popup-hidden").show();
			document.location.href = document.location.href;
		});
		return false;
	});

	$(".top-work-buttons .archive").click(function(){
		var task_id = $(this).attr("task_id");
		$.post("/task_archive", {task_id: task_id}, function(){
			$(".popup-alert .title").text("Внимание");
			$(".popup-alert .quest-text").text("Ваша заявка перемещена в архив.");
			$(".popup-alert").show();
			$(".popup-hidden").show();
			document.location.href = document.location.href;
		});
		return false;
	});

	$(".btn-answer").click(function(){
		var to_user_id = $(this).attr("to_user_id");
		$(".popup-message input[name='user_id']").val(to_user_id);
		$(".popup-hidden").show();
		$(".popup-message").show();
		return false;
	});

	$(".mesage-to-user").click(function(){
		$(".popup-hidden").show();
		$(".popup-message").show();
		return false;
	});

	$(".audio-to-user").click(function(){
		$(".popup-hidden").show();
		$(".popup-audio").show();
		return false;
	});

	$(".btn-create").click(function(){
		$(".popup-hidden").show();
		$(".popup-create").show();
		return false;
	});


	$(".popup-recall form").submit(function(){
		if ($(".popup-recall textarea").val().length == 0) {
			alert("Напишите текст отзыва");
			return false;
		}
	});

	$(".popup-recall input[type='checkbox']").change(function(){
		var rating = 10;
		console.log(1);
		$(".popup-recall input[type='checkbox']").each(function(){
			if (!$(this).prop('checked')) {
				rating -= 1;
			}
		});
		$(".popup-recall .rating span").text(rating);
	});

	$(".go-to-reg").click(function(){
		$(".popup-auth").hide();
		$(".popup-reg").show();
		return false;
	});

	$(".go-to-auth").click(function(){
		$(".popup-auth").show();
		$(".popup-reg").hide();
		return false;
	});

	$(".go-to-rember").click(function(){
		$(".popup").hide();
		$(".popup-rememb").show();
		return false;
	});

	$(".new_user_reg").submit(function(){
		var ismaster = $(".new_user_reg input[name='ismaster']").val();
		var email = $(".new_user_reg input[name='email']").val();
		var phone = $(".new_user_reg input[name='phone']").val();
		var code = $(".new_user_reg input[name='code']").val();
		if (email.length == 0) {
			alert("Укажите email");
			return false;
		}
		if (phone.length == 0) {
			alert("Укажите телефон");
			return false;
		}
		$.post("/new_user_reg", {ismaster: ismaster, email: email, phone: phone}, function(data){
			if (data.error == true || data.error == "true") {
				alert(data.error_text);
				return false;
			} else {
				alert("Ваш пароль: " + data.password);
				document.location.href = document.location.href;
			}
		});
		return false;
	});

	$(".new_user").submit(function(){
		var email = $(".new_user input[name='user[email]']").val();
		var password = $(".new_user input[name='user[password]']").val();
		if (email.length == 0) {
			alert("Укажите email");
			return false;
		}
		if (password.length == 0) {
			alert("Укажите пароль");
			return false;
		}
		$.post("/new_user", {email: email, password: password}, function(data){
			if (data.error == true || data.error == "true") {
				alert(data.error_text);
				return false;
			} else {
				document.location.href = document.location.href;
			}
		});
		return false;
	});

	$(".new_user_rememb").submit(function(){
		var email = $(".new_user_rememb input[name='email']").val();
		if (email.length == 0) {
			alert("Укажите email");
			return false;
		}
		/*
		$.post("/new_user", {email: email, password: password}, function(data){
			if (data.error == true || data.error == "true") {
				alert(data.error_text);
				return false;
			} else {
				document.location.href = document.location.href;
			}
		});*/
		alert("Пароль выслан вам на почту.");
		$(".popup").hide();
		$(".popup-hidden").hide();
		return false;
	});

	$('form[action="/profile/step2_1"]').on('keyup keypress', function(e) {
	  var keyCode = e.keyCode || e.which;
	  if (keyCode === 13) { 
	    e.preventDefault();
	    return false;
	  }
	});

	$(".reg-form .reg-from-2-2 .add-price").click(function(){
		var el = $(".reg-from-2-2 .price-list .item:first").clone();
		$("input", el).val("");
		$(".reg-form .reg-from-2-2 .price-list").append(el);
		return false;
	});

	$(".reg-form .reg-from-2-2 .raion-btn").click(function(){
		var el = $(".reg-from-2-2 .raion-list .item:first").clone();
		$("input", el).val("");
		$(".reg-form .reg-from-2-2 .raion-list").append(el);
		return false;
	});

	$(".tops .question").click(function(){
		$(".popup-hidden").show();
		$(".popup-top-master").show();
		return false;
	});

	$(".btn-recall-answer").click(function(){
		var from_user_id = $(this).attr("from_user_id");
		var user_id = $(this).attr("user_id");
		var task_id = $(this).attr("task_id");
		var parent_id = $(this).attr("parent_id");
		$(".popup-recall-answer input[name='from_user_id']").val(from_user_id);
		$(".popup-recall-answer input[name='user_id']").val(user_id);
		$(".popup-recall-answer input[name='task_id']").val(task_id);
		$(".popup-recall-answer input[name='parent_id']").val(parent_id);
		$(".popup-hidden").show();
		$(".popup-recall-answer").show();
		return false;
	});

	$(".delete-message").click(function(){
		var message_id = $(this).attr("message_id");
		$.post("/message_delete", {message_id: message_id}, function(){
			document.location.href = document.location.href;
		});
		return false;
	});

	$(".top-work-buttons-white .fake").click(function(){
		var ptype = $(this).attr("ptype");
		var task_id = $(this).attr("task_id");
		$.post("/change_task_ptype", {ptype: ptype, task_id: task_id}, function(data){
			if (data.error == true || data.error == "true") {
				$(".popup-fake .title").text("Внимание");
				$(".popup-fake .alert").text(data.error_text);
				$(".popup-fake .btns").show();
				$(".popup-fake").show();
				$(".popup-hidden").show();
			} else {
				$(".popup-fake .title").text("Успешно");
				$(".popup-fake .alert").text(data.error_text);
				$(".popup-fake .btns").hide();
				$(".popup-fake").show();
				$(".popup-hidden").show();
			}
		});
		return false;
	});

	$('input[type=file]').change(function(){
		var filename = $(this).val().replace(/C:\\fakepath\\/i, '');
		$(this).next().text(filename);
		return false;
	});

	$(".top-work-buttons .btn-edit").click(function(){
		var task_id = $(this).attr("task_id");
		var cat_id = $(this).attr("cat_id");
		var name = $(this).attr("name");
		var description = $(this).attr("description");
		var price_fix = $(this).attr("price_fix");
		var city_from = $(this).attr("city_from");

		$(".popup-hidden").show();
		$(".popup-create-edit").show();
		$(".popup-create-edit input[name='id']").val(task_id);
		$(".popup-create-edit input[name='name']").val(name);
		$(".popup-create-edit textarea").val(description);
		$(".popup-create-edit input[name='price_fix']").val(price_fix);
		$(".popup-create-edit input[name='city_from']").val(city_from);
		$(".popup-create-edit select").select2('destroy');
		$(".popup-create-edit select").val(parseInt(cat_id));
		$(".popup-create-edit select").select2();
		return false;
	});

	$(".top-work-buttons-master .fake").click(function(){
		var ptype = $(this).attr("ptype");
		var user_id = $(this).attr("user_id");
		$.post("/change_user_ptype", {ptype: ptype, user_id: user_id}, function(data){
			if (data.error == true || data.error == "true") {
				$(".popup-fake .title").text("Внимание");
				$(".popup-fake .alert").text(data.error_text);
				$(".popup-fake .btns").show();
				$(".popup-fake").show();
				$(".popup-hidden").show();
			} else {
				$(".popup-fake .title").text("Успешно");
				$(".popup-fake .alert").text(data.error_text);
				$(".popup-fake .btns").hide();
				$(".popup-fake").show();
				$(".popup-hidden").show();
			}
		});
		return false;
	});

	$(".popup-fake .btns .btn-red").click(function(){
		$(".popup").hide();
		$(".popup-hidden").hide();
		return false;
	});

	$(".popup-fake .btns .btn-green").click(function(){
		$(".popup").hide();
		$(".popup-balance").show();
		return false;
	});

})

function animationOut(i){}
function animationIn(i){}
