$(document).ready(function() 
{
	biography_form_init();
});

function biography_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".biography_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".biography_description textarea").autosize();
		$(".biography_name textarea").autosize();   		
	}
}

function save_biography_form()
{
	$(".biography_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','biography[biography_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".biography_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".biography_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}