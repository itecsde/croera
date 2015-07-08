$(document).ready(function() 
{
	post_form_init();
});

function post_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".post_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".post_description textarea").autosize();
		$(".post_name textarea").autosize();   		
	}
}

function save_post_form()
{
	$(".post_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','post[post_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".post_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".post_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
