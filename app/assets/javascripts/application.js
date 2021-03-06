// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require materialize-sprockets


// no wonder people hate javascript
var ready;
ready = function() {
	// hamburger menu
	$(".button-collapse").sideNav();

	// parallax effect on welcome page
	$(".parallax").parallax();

	$('.dropdown-button').dropdown();

};

$(document).ready(ready);
$(document).on('page:change', ready);