// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require dropzone
//= require jquery
//= require jquery.Jcrop
//= require jquery_ujs
//= require bootstrap-sprockets
// require turbolinks
//= require_tree .

var main;
main = function() {
	var current_page = window.location.pathname;
	var options = $('.optionsnavi li');
	var banner = $('.headerbrand');
	var nav = $('.navbar');
	var dropnavbtn = $('.dropbtn');
	var likebtn = $('.likethisphoto');
							
	if(current_page != '/') {
		banner.hide();
		nav.addClass('fixed');
		options.addClass('full-size');
		$('.optionsnavi').css('width', '95%');
		$('.dropdown').css('padding-left', '15%');
		$('body').css('padding-top', 80);
	}

	if(current_page == '/') {
		document.querySelector('.headerbrand').style.backgroundImage = 'url(' + gon.img + ')';
		options.addClass('half-size');
		
		$(window).scroll(function() {
			if($(this).scrollTop() > 650 ) {
				nav.addClass('fixed');
			}
			else {
				nav.removeClass('fixed');
			}
		});
	}
	
	dropnavbtn.click(function () {
		$('.dropdown-content').toggle();
	});
	
	likebtn.click(function () {
		$(this).toggleClass('clicked');
	});
};

$(document).ready(main);