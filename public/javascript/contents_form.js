$(document).ready(function() 
{
	content_form_init();
});

function content_form_init()
{
	check_edition_mode(".external_content_container");
	$(".content_description textarea").autosize();
	$(".content_form").submit(function(){
		confirmation_needed = false;
		check_content_url();
	});
}

function save_content_form()
{
	$(".content_form").submit();
}

function check_content_url(){
	if($("#content_url").val() != ""){
		var url_string = $("#content_url").val();
		var final_url = check_url(url_string);
		$("#content_url").val(final_url);
	}
	return false;
}
