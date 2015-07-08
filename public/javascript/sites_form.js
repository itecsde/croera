$(document).ready(function() 
{
	site_form_init();
});

function site_form_init()
{
	/*check_edition_mode(".site_container");*/	
	confirmation_needed = true;		
	var latitude= $("#site_latitude").val();
	var longitude= $("#site_longitude").val();
   	initialize_map(latitude, longitude);
   	
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".site_description textarea").autosize();
		$(".site_name textarea").autosize();
	}
}

function save_site_form()
{
	
	confirmation_needed = false;
	$(".site_form").submit();
}


