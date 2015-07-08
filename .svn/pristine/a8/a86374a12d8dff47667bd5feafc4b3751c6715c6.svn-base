$(document).ready(function() 
{
	device_form_init();
});

function device_form_init()
{
	check_edition_mode(".device_container");
	$(".device_description textarea").autosize();
	$(".device_form").submit(function(){
		confirmation_needed = false;
		check_device_url();
	});

}

function save_device_form()
{
	$(".device_form").submit();
}

function check_device_url(){
	if($("#device_url").val() != ""){
		var url_string = $("#device_url").val();
		var final_url = check_url(url_string);
		$("#device_url").val(final_url);
	}
	return false;
}