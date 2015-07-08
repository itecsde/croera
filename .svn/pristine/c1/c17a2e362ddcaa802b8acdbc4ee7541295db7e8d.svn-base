$(document).ready(function() 
{
	course_form_init();
});

function course_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".course_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".course_description textarea").autosize();
		$(".course_name textarea").autosize();   		
	}
}

function save_course_form()
{
	$(".course_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','course[course_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".course_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".course_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}