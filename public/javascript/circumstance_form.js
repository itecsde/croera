$(document).ready(function() 
{
	circumstance_form_init();
});

function circumstance_form_init()
{
	var latitude= $(".latitude").val();
	var longitude= $(".longitude").val();
   	initialize_map(latitude, longitude); 
}