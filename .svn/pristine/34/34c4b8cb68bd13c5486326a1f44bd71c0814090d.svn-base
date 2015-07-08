$(document).ready(function() 
{
	widget_form_init();
});

function widget_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".widget_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".widget_description textarea").autosize();
		$(".widget_name textarea").autosize();   		
	}
}

function save_widget_form()
{
	$(".widget_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','widget[widget_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".widget_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".widget_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
