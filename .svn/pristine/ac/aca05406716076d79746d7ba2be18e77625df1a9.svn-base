$(document).ready(function() {
	picture_form_init();
});

function picture_form_init(){
	check_edition_mode("#content_container");
	
	$(".picture_form").submit(function(){
		build_picture_attribute_strings();
	});	
}

function save_picture_form(){
	console.log("Save picture form...");
	$('.picture_form').submit();
}

function build_picture_attribute_strings(){
	$(".picture_form .box_container").each(function(box_index, box_element){
		var box_id = $(this).find("#box_id").attr('name', 'picture[boxes_attributes][' + box_index + '][id]');
		var box_type = $(this).find('#box_type').attr('name', 'picture[boxes_attributes][' + box_index + '][box_type]');
		
		$(this).find('.component_container').each(function(component_index, component_element){
	 		var component_id = $(this).find("#component_id").attr('name','picture[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][id]');
			var component_type = $(this).find("#component_type").attr('name','picture[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][component_type]');
			$(component_element).find("#area_image").attr('name','picture[boxes_attributes]'+box_index+'[components_attributes]['+component_index+'][area_image]');
			
			$(this).find(".text_container").each(function(text_index, text_container){
				var component_id = $(text_container).find(".text_id").attr('name','picture[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][id]');
				var component_text = $(text_container).find(".text_content").attr('name','picture[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][content]');
				if($(text_container).hasClass('deleted')){
					$(text_container).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"picture[boxes_attributes]["+box_index+"][components_attributes]["+component_index+"][texts_attributes]["+text_index+"][_destroy]\">");
				}	
			});
				
		});
	});
	
	return false;
}
