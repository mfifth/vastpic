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
//= require jquery_ujs
// require turbolinks
//= require_tree .

var main;
main = function() {
	var current_page = window.location.pathname;
	var banner = $('.headerbrand');
	var nav = $('.navbar');
							
	if(current_page != '/') {
		banner.hide();
		nav.addClass('fixed');
		$('body').css('padding-top', 80);
	}

	if(current_page == '/') {
		document.querySelector('.headerbrand').style.backgroundImage = 'url(' + gon.img + ')';
		
		$(window).scroll(function() {
			if($(this).scrollTop() > 650 ) {
				nav.addClass('fixed');
			}
			else {
				nav.removeClass('fixed');
			}
		});
	}
};

$(document).ready(main);