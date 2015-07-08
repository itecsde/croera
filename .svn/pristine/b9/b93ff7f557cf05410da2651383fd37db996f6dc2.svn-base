$(document).ready(function() 
{
	article_form_init();
});

function article_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".article_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".article_description textarea").autosize();
		$(".article_name textarea").autosize();   		
	}
}

function save_article_form()
{
	$(".article_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','article[article_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".article_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".article_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
