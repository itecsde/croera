$(document).ready(function() 
{
	slideshow_form_init();
});

function slideshow_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".slideshow_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".slideshow_description textarea").autosize();
		$(".slideshow_name textarea").autosize();   		
	}
}

function save_slideshow_form()
{
	$(".slideshow_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','slideshow[slideshow_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".slideshow_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".slideshow_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
