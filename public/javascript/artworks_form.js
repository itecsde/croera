$(document).ready(function() 
{
	artwork_form_init();
});

function artwork_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".lre_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".artwork_description textarea").autosize();
		$(".artwork_name textarea").autosize();   		
	}
}

function save_artwork_form()
{
	$(".artwork_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','artwork[artwork_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".artwork_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".artwork_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
