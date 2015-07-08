class Recommender
  def get_recommended_tools(functionality_id)
          
     @annotations=ApplicationFunctionalityAnnotation.where(:functionality_id => functionality_id).order("level DESC").limit(5)
     #puts @requirement.functionality.id
     @recommended_tools ||= Array.new
     #@annotations.reverse_each do |annotation|
     @annotations.each do |annotation|
       @recommended_tools.push(annotation.application)
       puts annotation
     end
     return @recommended_tools
     
  end
  
  
  def validate_tool_assignment(functionality_id,element_class,element_id)
    case element_class
      when "Application"
        @application=Application.find(element_id)
        @annotations=ApplicationFunctionalityAnnotation.where(:application_id=>element_id,:functionality_id=>functionality_id)
        @result=false
        if @annotations.size>0
          @result="true"
         else @result= "false"
        end
        return @result
              
      else 
        return "incomplete"        
    end    
  end
  
  
  
  def get_recommended_events(contextual_setting)
    
  end
  
  
  
  def get_recommended_resources(element_type,tags)    
    if I18n.locale.to_s == "gl"
      search_languages=["gl","es"]
    else 
      search_languages=[I18n.locale.to_s]
    end
    
    @search = element_type.constantize.search do |query|                                    
      query.fulltext tags, :fields => [:w100_wikitopics, :w95_wikitopics, :w90_wikitopics, :w85_wikitopics, :w80_wikitopics, :w75_wikitopics, :w70_wikitopics, :w65_wikitopics, :w60_wikitopics, :w55_wikitopics, :w50_wikitopics] do
        boost_fields :w100_wikitopics => 10.0
        boost_fields :w95_wikitopics => 9.5
        boost_fields :w90_wikitopics => 9
        boost_fields :w85_wikitopics => 8.5
        boost_fields :w80_wikitopics => 8.0
        boost_fields :w75_wikitopics => 7.5
        boost_fields :w70_wikitopics => 7.0
        boost_fields :w65_wikitopics => 6.5
        boost_fields :w60_wikitopics => 6.0
        boost_fields :w55_wikitopics => 5.5
        boost_fields :w50_wikitopics => 5.0
        minimum_match 1
      end        
      query.with(:translations, search_languages) 
      query.paginate :per_page => 4
    end
=begin
    @search = element_type.constantize.search do |query|                              
        search_terms = tags
        query.fulltext search_terms do
          boost_fields :name => 3.0
          boost_fields :tags => 3.0
          boost_fields :description => 1.0
          #phrase_fields :name => 8.0
          #phrase_fields :tags => 20.0
          minimum_match 1
        end
        query.with(:translations, search_languages) 
        query.paginate :per_page => 4
     end
=end     
     @result=@search.results       
     return @result
  end
  
  
end