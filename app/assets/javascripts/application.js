// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

$(function(){
	$("#trip_starts_on_picker").datepicker({
	   onSelect: function(dateText, inst) {
	      $("#trip_starts_on").val(dateText);
	   }
	});
	$("#trip_ends_on_picker").datepicker({
	   onSelect: function(dateText, inst) {
	      $("#trip_ends_on").val(dateText);
	   }
	});
	
	$("#add_guest").click(function(){
		var number_of_guests = $('.name').length + 1;
		var new_label = "<div class=\"name\"><label>Guest "+ number_of_guests +"</label></div>";
		var new_input = "<input id=\"user_email\" type=\"text\" size=\"30\" placeholder=\"guest"+ number_of_guests +"@example.com\" name=\"emails["+number_of_guests+"]\">";
		
		$('#guest_labels').append(new_label);
		$('#guest_inputs').append(new_input);
		
		$('#number_of_guests').val(number_of_guests);
	});
	
});
