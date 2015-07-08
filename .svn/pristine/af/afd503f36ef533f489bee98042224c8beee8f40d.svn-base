$(document).ready(function() 
{
	report_form_init();
});

function report_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".report_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".report_description textarea").autosize();
		$(".report_name textarea").autosize();   		
	}
}

function save_report_form()
{
	$(".report_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','report[report_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".report_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".report_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
