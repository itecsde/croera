$(document).ready(function(){
	popup_infinite_scroll_init('#activities #activity_list','.extract_box', '"#activities .popup_body:first"', 'activities' );
	popup_infinite_scroll_init('#tool_requirement_selection #tool_list','.extract_box', '"#tool_requirement_selection .popup_body:first"', 'tool_requirement_selection');
	popup_infinite_scroll_init('#person_requirement_selection #people_list','.extract_box', '"#person_requirement_selection .popup_body:first"', 'person_requirement_selection');
	popup_infinite_scroll_init('#event_requirement_selection #event_list','.extract_box', '"#event_requirement_selection .popup_body:first"', 'event_requirement_selection');
	popup_infinite_scroll_init('#content_requirement_selection #content_list','.extract_box', '"#content_requirement_selection .popup_body:first"', 'content_requirement_selection');
});