$(document).ready(function() 
{
	lecture_form_init();
});

function lecture_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".lecture_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".lecture_description textarea").autosize();
		$(".lecture_name textarea").autosize();   		
	}
}

function save_lecture_form()
{
	$(".lecture_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','lecture[lecture_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".lecture_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".lecture_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
