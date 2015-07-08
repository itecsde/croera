class WidgetsController < ApplicationController
  
  def index
    @resource_type = "Widget"
    if I18n.locale.to_s == "gl"
      search_languages=["gl","es","en"]
    else
       search_languages=[I18n.locale.to_s,"en"]     
    end
    
    per_page = 32

    if (params[:advanced_search]=="1") 
      if params[:search] != nil && params[:search].size > 0
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
      else
         search_text = ""
      end
      advanced_parameters = Hash[]
      @search = Search.advanced_search_elements_by_type('Widget', search_text,search_text_en_translation, advanced_parameters,per_page,params[:page])
      @num_results = @search[:total]
      @widgets = @search[:results]   
      
    
    elsif (params[:search] != nil && params[:search].size > 0)
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
             
      @search = Search.search_elements_by_type('Widget', search_text,search_text_en_translation, params[:article_id],per_page,params[:page])
      @widgets = @search[:results]          
      @num_results = @search[:total]              

    else       
      @search = Search.listing_elements_by_type('Widget', search_languages, current_user, per_page,params[:page])
      @widgets = @search[:results]          
      @num_results = @search[:total]
=begin      
      @search = Widget.search do |query|
       
          if current_user != nil && current_user.circumstances != []
            search_terms = current_user.circumstances.first.tag_list + ", " + current_user.circumstances.first.subject.name
            query.keywords search_terms, :fields => [:tags, :name] {minimum_match 1}
          end          
          query.with(:translations, search_languages)  
          query.paginate :page => params[:page],:per_page => per_page 
      end      
      @widgets = @search.results 
      @num_results=@search.total
=end
    end  
        
     
    @previous_search_params=params      
    @subjects=Subject.all     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @widgets }
    end
  end
  
  
  def show
    @widget = Widget.find(params[:id])
    
    if current_user!=nil
      current_user.add_preferences_to_user_history(@widget.taggable_tag_annotations)
    end
         
    @subjects=Subject.all
    @related_elements=RelatedElement.new(@widget)   
    @edition_mode=false
    @resource_type="Widget"    
    if notice == 'Widget was successfully created.' || notice == 'Widget was successfully updated.'
      @previous_action = 'saved'
    else
      @previous_action = 'list'
    end    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @widget }
    end
  end
  
  
  def new
    if current_user !=nil 
      @widget = Widget.new
      @subjects=Subject.all
      @edition_mode=true
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @widget }
      end
    else
      redirect_to widgets_path
    end
  end
  
  def edit
    @widget = Widget.find(params[:id])
    if current_user !=nil && ((@widget.owner == current_user) or (@widget.owner_type=="Group" && @widget.owner.users.exists?(current_user)))
      @subjects=Subject.all
      @edition_mode=true
    else
      redirect_to widget_path(@widget) 
    end
  end
  
  
  def create
    @widget = Widget.new(params[:widget])
    if (params[:widget][:owner_type]==nil)
      @widget.owner_type="User"
      @widget.owner=current_user
    end
    @widget.creator = current_user
    manual_tags = params[:widget][:tag_list].split(',')
    #@widget.persist([], @widget.description, manual_tags)

    respond_to do |format|
      if @widget.save
        #@widget.persist([], @widget.description, manual_tags)
        format.html { redirect_to @widget, notice: 'Widget was successfully created.' }
        format.json { render json: @widget, status: :created, location: @widget }
      else
        format.html { render action: "new" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def update
    @widget = Widget.find(params[:id])
    if (params[:widget][:owner_type]==nil)
      @widget.owner_type="User"
      @widget.owner=current_user
    end
    @widget.subjects.destroy_all
    name = params[:widget][:name]
    description = params[:widget][:description]
    manual_tags = params[:widget][:tag_list].split(',')    
    @widget.info_to_wikify = name + ". " + description      
    
    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        @widget.tags.destroy_all
        @widget.extract_wikitopics(name, description, manual_tags)                
        format.html { redirect_to @widget, notice: 'Widget was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end    
  end
  
  
  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy

    respond_to do |format|
      format.html { redirect_to widgets_url }
      format.json { head :ok }
    end
  end
  
  
  def popup_show_widget
    @widget = Widget.find(params[:element_id])
    @subjects=Subject.all
    @edition_mode=false
    @resource_type="Widget"
    @popup = true

    respond_to do |format|
      format.js
    end
  end
  
  
end