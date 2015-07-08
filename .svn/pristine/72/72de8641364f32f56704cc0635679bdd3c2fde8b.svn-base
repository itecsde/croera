class SlideshowsController < ApplicationController
  
  def index
    @resource_type = "Slideshow"
    if I18n.locale.to_s == "gl"
      search_languages=["gl","es"]
    else 
      search_languages=[I18n.locale.to_s]
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
      @search = Search.advanced_search_elements_by_type('Slideshow', search_text,search_text_en_translation, advanced_parameters,per_page,params[:page])
      @num_results = @search[:total]
      @slideshows = @search[:results]   
    
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
             
      @search = Search.search_elements_by_type('Slideshow', search_text,search_text_en_translation, params[:article_id],per_page,params[:page])
      @slideshows = @search[:results]          
      @num_results = @search[:total]
                     
    else
      @search = Search.listing_elements_by_type('Slideshow', search_languages, current_user, per_page,params[:page])
      @slideshows = @search[:results]          
      @num_results = @search[:total] 
=begin        
      @search = Slideshow.search do |query|
       
          if current_user != nil && current_user.circumstances != []
            search_terms = current_user.circumstances.first.tag_list + ", " + current_user.circumstances.first.subject.name
            query.keywords search_terms, :fields => [:tags, :name] {minimum_match 1}
          end       
          query.with(:translations, search_languages)  
          query.paginate :page => params[:page],:per_page => per_page 
      end
      @slideshows = @search.results 
      @num_results=@search.total
=end      
    end  
           
    @previous_search_params=params      
    @subjects=Subject.all     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slideshows }
    end
  end
  
  
  def show
    @slideshow = Slideshow.find(params[:id])
    if current_user!=nil
      current_user.add_preferences_to_user_history(@slideshow.taggable_tag_annotations)
    end     
    @subjects=Subject.all
    @related_elements=RelatedElement.new(@slideshow)   
    @edition_mode=false
    @resource_type="Slideshow"
            
    if notice == 'Slideshow was successfully created.' || notice == 'Slideshow was successfully updated.'
      @previous_action = 'saved'
    else
      @previous_action = 'list'
    end    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slideshow }
    end
  end
  
  
  def new
    if current_user != nil
      @slideshow = Slideshow.new
      @subjects=Subject.all
      @edition_mode=true
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @slideshow }
      end
    else
      redirect_to slideshows_path
    end
  end
  
  def edit
    @slideshow = Slideshow.find(params[:id])
    if current_user !=nil && ((@slideshow.owner == current_user) or (@slideshow.owner_type=="Group" && @slideshow.owner.users.exists?(current_user)))
      @subjects=Subject.all
      @edition_mode=true
    else
      redirect_to slideshow_path(@slideshow)
    end
  end
  
  
  def create
    @slideshow = Slideshow.new(params[:slideshow])
    if (params[:slideshow][:owner_type]==nil)
      @slideshow.owner_type="User"
      @slideshow.owner=current_user
    end
    @slideshow.creator = current_user
    manual_tags = params[:slideshow][:tag_list].split(',')
    @slideshow.persist([], @slideshow.description, manual_tags)

    respond_to do |format|
      if @slideshow.save
        #@slideshow.persist([], @slideshow.description, manual_tags)
        format.html { redirect_to @slideshow, notice: 'Slideshow was successfully created.' }
        format.json { render json: @slideshow, status: :created, location: @slideshow }
      else
        format.html { render action: "new" }
        format.json { render json: @slideshow.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def update
    @slideshow = Slideshow.find(params[:id])
    if (params[:slideshow][:owner_type]==nil)
      @slideshow.owner_type="User"
      @slideshow.owner=current_user
    end
    @slideshow.subjects.destroy_all
    name = params[:slideshow][:name]
    description = params[:slideshow][:description]
    manual_tags = params[:slideshow][:tag_list].split(',')    
    @slideshow.info_to_wikify = name + ". " + description      
    
    respond_to do |format|
      if @slideshow.update_attributes(params[:slideshow])
        @slideshow.tags.destroy_all
        @slideshow.extract_wikitopics(name, description, manual_tags)           
        format.html { redirect_to @slideshow, notice: 'Slideshow was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @slideshow.errors, status: :unprocessable_entity }
      end
    end    
  end
  
  
  def destroy
    @slideshow = Slideshow.find(params[:id])
    @slideshow.destroy

    respond_to do |format|
      format.html { redirect_to slideshows_url }
      format.json { head :ok }
    end
  end
  
  
  def popup_show_slideshow
    @slideshow = Slideshow.find(params[:element_id])
    @subjects=Subject.all
    @edition_mode=false
    @resource_type="Slideshow"
    @popup = true

    respond_to do |format|
      format.js
    end
  end
  
  
end