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
//= require jquery
//= require jquery.min
//= require jquery_ujs
//= require jquery-ui
//= require easing
//= jquery.flexslider
//= move-top
//= require jquery-ui


$(document).ready(function($) {
	$( "#datepicker,#datepicker1" ).datepicker({ dateFormat: 'yy-mm-dd' });
	var loc = window.location.href.split('/');
	var page = loc[loc.length - 1];
	if (page == 'rooms'){
		$('#navigation_bar li a:first').removeClass("active");
		$('#navigation_bar li a:eq(1)').addClass("active");
	}
	else
	{
		$('#navigation_bar li a:first').addClass("active");
	}
	
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        directionNav : false,
        slideshowSpeed:3000,
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
});