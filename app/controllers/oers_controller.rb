class OersController < ApplicationController
  
  def index        
    @resource_type = "Report"
    per_page = 4

    if I18n.locale.to_s == "gl"
      search_languages=["gl","es"]
    else 
      search_languages=[I18n.locale.to_s]
    end
    if params[:section] != nil && params[:section] != ""
       @section = params[:section]
    else 
       @section = "all"
    end 
    ## BUSQUEDA AVANZADA ENLAZARA A BUSQUEDA NORMAL YA QUE SOLO BUSCO TEXTO ##
    
    ## BUSQUEDA NORMAL ####### 
    if (params[:search] != nil && params[:search].size > 0)
      search_text = params[:search]
      if search_text.index("#") != 0
        @disambiguation = Search.disambiguation(search_text)
      else        
        #Esto es para tener el termino traducido al ingles para hacer las busquedas con el tag en ingles
        if I18n.locale.to_s != "en" && search_text.index("@") != nil         
          clean_search_text = search_text[0,search_text.index("@")]
          search_text_en_translation = Wikipediator.wikipedia_get_article_title_tranlation(Util.to_tag(clean_search_text),I18n.locale.to_s,"en")
        #Esto es para traducir el termino al idioma de la vista para ver la info de desambiguacion del termino en ese idioma          
        elsif I18n.locale.to_s != "en" && search_text.index("@") == nil
          search_text_locale_translation = Wikipediator.wikipedia_get_article_title_tranlation(Util.to_tag(search_text),"en",I18n.locale.to_s)
        end
        search = Search.new
        if I18n.locale.to_s != "en" && search_text_locale_translation != nil
          @disambigued_term_info = search.disambigued_term_info(Util.to_hashtag_with_language(search_text_locale_translation))
        else
          @disambigued_term_info = search.disambigued_term_info(search_text)  
        end
      end 
             
      @search = Search.search_reports_by_section_and_date(@section, "all_time", search_text,search_text_en_translation, params[:article_id],per_page,params[:page])
      @reports = @search[:results]          
      @num_results = @search[:total]
      
      @search_day = Search.search_reports_by_section_and_date(@section, "last_day", search_text,search_text_en_translation, params[:article_id],per_page,params[:page])
      @reports_day = @search_day[:results]
      
      @search_week = Search.search_reports_by_section_and_date(@section, "last_week", search_text,search_text_en_translation, params[:article_id],per_page,params[:page])
      @reports_week = @search_week[:results]
      
      @search_month = Search.search_reports_by_section_and_date(@section, "last_month", search_text,search_text_en_translation, params[:article_id],per_page,params[:page])
      @reports_month = @search_month[:results]         
      
    ####### LISTADO DE TODOS LOS RECURSOS ######          
    else
      #@search = Search.listing_elements_by_type('Report', search_languages, current_user, per_page,params[:page])
      @search = Search.listing_reports_by_section_without_boost_circumstance(@section, "all" ,search_languages, current_user, per_page ,params[:page])      
      @reports = @search[:results]          
      @num_results = @search[:total]
           
      @search_day = Search.listing_reports_by_section_without_boost_circumstance(@section, "last_day" ,search_languages, current_user, per_page, params[:page])
      @reports_day = @search_day[:results]
      
      @search_week = Search.listing_reports_by_section_without_boost_circumstance(@section, "last_week" ,search_languages, current_user, per_page, params[:page])
      @reports_week = @search_week[:results]
      
      @search_month = Search.listing_reports_by_section_without_boost_circumstance(@section, "last_month" ,search_languages, current_user, per_page, params[:page])
      @reports_month = @search_month[:results]            
      
       
=begin       
      @search = Report.search do |query|                     
          query.with(:translations, search_languages)
          query.order_by(:publication_date, :desc)        
          if current_user != nil && current_user.circumstances != []             
            #search_terms = current_user.circumstances.first.tag_list + ", " + current_user.circumstances.first.subject.name
            #query.keywords search_terms, :fields => [:tags, :name] {minimum_match 1}
            search_terms = current_user.circumstances.first.tags.map { |t| '"' + Util.to_hashtag(t.name) + '"' if t.name != nil}.join(" ") + " " + current_user.circumstances.first.subject.name
            query.fulltext search_terms, :fields => [:w100_wikitopics, :w95_wikitopics, :w90_wikitopics, :w85_wikitopics, :w80_wikitopics, :w75_wikitopics, :w70_wikitopics, :w65_wikitopics, :w60_wikitopics, :w55_wikitopics, :w50_wikitopics, :tags] do               
               minimum_match 1
            end                                   
          end
          query.paginate :page => params[:page],:per_page => per_page                 
      end           
      @reports = @search.results             
      @num_results = @search.total
      
=end                
    end  

     
    @previous_search_params = params      
    @subjects = Subject.all     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end
  
  
    
  def index_all   
    @resource_type = "Report"
    per_page = 32

    if I18n.locale.to_s == "gl"
      search_languages=["gl","es"]
    else 
      search_languages=[I18n.locale.to_s]
    end
    if params[:section] != nil && params[:section] != ""
       @section = params[:section]
    else 
       @section = "all"
    end
    if params[:date_range] != nil && params[:date_range] != "" 
       @date_range = params[:date_range]
    else
       @date_range = "all_time"
    end
    
    ####### BUSQUEDA AVANZADA #######
  
      
    ####### BUSQUEDA NORMAL ####### 
    if (params[:search] != nil && params[:search].size > 0)
      search_text = params[:search]
      if search_text.index("#") != 0
        @disambiguation = Search.disambiguation(search_text)
      else        
        #Esto es para tener el termino traducido al ingles para hacer las busquedas con el tag en ingles
        if I18n.locale.to_s != "en" && search_text.index("@") != nil         
          clean_search_text = search_text[0,search_text.index("@")]
          search_text_en_translation = Wikipediator.wikipedia_get_article_title_tranlation(Util.to_tag(clean_search_text),I18n.locale.to_s,"en")
        #Esto es para traducir el termino al idioma de la vista para ver la info de desambiguacion del termino en ese idioma          
        elsif I18n.locale.to_s != "en" && search_text.index("@") == nil
          search_text_locale_translation = Wikipediator.wikipedia_get_article_title_tranlation(Util.to_tag(search_text),"en",I18n.locale.to_s)
        end
        search = Search.new
        if I18n.locale.to_s != "en" && search_text_locale_translation != nil
          @disambigued_term_info = search.disambigued_term_info(Util.to_hashtag_with_language(search_text_locale_translation))
        else
          @disambigued_term_info = search.disambigued_term_info(search_text)  
        end
      end 
             
      @search = Search.search_reports_by_section_and_date(@section, @date_range ,search_text,search_text_en_translation, params[:article_id],per_page,params[:page])
      @reports = @search[:results]          
      @num_results = @search[:total]         
      
    ####### LISTADO DE TODOS LOS RECURSOS ######          
    else
      #@search = Search.listing_elements_by_type('Report', search_languages, current_user, per_page,params[:page])
      @search = Search.listing_reports_by_section_without_boost_circumstance(@section, @date_range ,search_languages, current_user, per_page ,params[:page])      
      @reports = @search[:results]          
      @num_results = @search[:total]     
    end  
     
    @previous_search_params = params      
    @subjects = Subject.all     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end 

  
  
  def show
    @report = Report.find(params[:id])
    
    if current_user!=nil
      current_user.add_preferences_to_user_history(@report.taggable_tag_annotations)
    end
         
    @subjects=Subject.all
    @related_elements=RelatedElement.new(@report)   
    @edition_mode=false
    @resource_type = "Report"
            
    if notice == 'Report was successfully created.' || notice == 'Report was successfully updated.'
      @previous_action = 'saved'
    else
      @previous_action = 'list'
    end    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end
  
  
  def new
    if current_user != nil
      @report = Report.new
      @subjects=Subject.all
      @edition_mode=true
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @report }
      end
    else
      redirect_to reports_path
    end
  end
  
  def edit
    @report = Report.find(params[:id])
    if current_user !=nil && ((@report.owner == current_user) or (@report.owner_type=="Group" && @report.owner.users.exists?(current_user)))
      @subjects=Subject.all
      @edition_mode=true
    else
      redirect_to report_path(@report)
    end
  end
  
  
  def create
    @report = Report.new(params[:report])
    if (params[:report][:owner_type]==nil)
      @report.owner_type="User"
      @report.owner=current_user
    end
    @report.creator = current_user
    manual_tags = params[:report][:tag_list].split(',')
    #@report.persist([], @report.description, manual_tags)

    respond_to do |format|
      if @report.save
        #@report.persist([], @report.description, manual_tags)
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def update
    @report = Report.find(params[:id])
    if (params[:report][:owner_type]==nil)
      @report.owner_type="User"
      @report.owner=current_user
    end
    @report.subjects.destroy_all
    name = params[:report][:name]
    description = params[:report][:description]
    manual_tags = params[:report][:tag_list].split(',')    
    @report.info_to_wikify = name + ". " + description      
    
    respond_to do |format|
      if @report.update_attributes(params[:report])
        @report.tags.destroy_all
        @report.extract_wikitopics(name, description, manual_tags)              
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end    
  end
  
  
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :ok }
    end
  end
  
  
  def popup_show_report
    @report = Report.find(params[:element_id])
    @subjects=Subject.all
    @edition_mode=false
    @resource_type="Report"  
    @popup = true  

    respond_to do |format|
      format.js
    end
  end
  
  
   
  def load_more_reports_by_section_and_date
      if I18n.locale.to_s == "gl"
         search_languages=["gl","es"]
      else
         search_languages=[I18n.locale.to_s]
      end
      if params[:section] != nil && params[:section]!= ""
         @section = params[:section].capitalize
      else
         @section = "all"
      end
      @section = params[:section]
      @date_range = params[:date_range]
      @page = params[:page]
      @search = Search.listing_reports_by_section_without_boost_circumstance(@section, @date_range ,search_languages, current_user, 4, @page)
      @elements = @search[:results]
   end
  
  
end