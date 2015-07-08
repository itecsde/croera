class GuidesController < ApplicationController
  # GET /guides
  # GET /guides.json
  def index
    @current_tab="guides"
    @page = "guides"   
    @search = Guide.search do
      fulltext params[:search]
      order_by :updated_at, :desc
      paginate :page => params[:guides_page], :per_page => 25
    end
    @guides = @search.results
        
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guides }
    end
  end
  
  # GET /guides/1
  # GET /guides/1.json
  def show
    @current_tab="guides"
    @guide = Guide.find(params[:id])
    @activity_sequence = @guide.activity_sequence
    @technological_setting = @guide.technological_setting
    @contextual_setting = @guide.contextual_setting 
  
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
  
  if notice == 'Guide was successfully created.' || notice == 'Guide was successfully updated.'
      @previous_action = 'saved'
    else
      @previous_action = 'list'
    end 
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guide }
    end
  end
  
  # GET /guides/new
  # GET /guides/new.json
  def new
    @current_tab="guides"
    @guide = Guide.new
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guide }
    end
  end
  
  # POST /guides
  # POST /guides.json
  def create
    @current_tab="guides"
    @guide = Guide.new(params[:guide])
    @guide.owner = current_user
    @guide.creator = current_user
    if @guide.activity_sequence != nil
      @guide.activity_sequence.owner = current_user
      @guide.activity_sequence.creator = current_user
       @guide.activity_sequence.save
    end
    @guide.save
    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.'}
        format.json { render json: @activity, status: :created, location: @guide }
      else
        format.html { render action: "new" }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def edit
    @current_tab="guides"
    @guide = Guide.find(params[:id])
    @activity_sequence = @guide.activity_sequence
    @technological_setting = @guide.technological_setting
    @contextual_setting = @guide.contextual_setting
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guide }
    end
  end
  
  def update
    @current_tab="guides"
    @guide = Guide.find(params[:id])
    if @guide.technological_setting != nil
      TechnologicalSettingDeviceAnnotation.where(:technological_setting_id => @guide.technological_setting.id).destroy_all
      TechnologicalSettingApplicationAnnotation.where(:technological_setting_id => @guide.technological_setting.id).destroy_all
     end
    
    respond_to do |format|
      if @guide.update_attributes(params[:guide])
        if @guide.activity_sequence != nil
            @guide.activity_sequence.creator = current_user
            #@guide.activity_sequence.trace_version = @guide.activity_sequence.trace_version + 1
            @guide.activity_sequence.save
         end
        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /guide/1
  # DELETE /guide/1.json
  def destroy
    @current_tab="guides"
    @guide = Guide.find(params[:id])
    @guide.destroy

    respond_to do |format|
      format.html { redirect_to guides_url }
      format.json { head :ok }
    end
  end  
  
  # GET activity/id to show in a pop-up
  def show_activity
    @current_tab="guides"
    @activity = Activity.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def show_technological_setting
    @current_tab="guides"
    @technological_setting = TechnologicalSetting.find(params[:id])
    @devices = Device.find(:all, :order => 'name', :conditions => { :external => "false" })
    @applications = Application.find(:all, :order => 'name',:conditions => { :external => "false" })
    respond_to do |format|
      format.js
    end
  end
  
  def show_contextual_setting
    @current_tab="guides"
    @contextual_setting = ContextualSetting.find(params[:id])
    @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    respond_to do |format|
      format.js
    end
  end
  
  def show_sequence
    @current_tab="guides"
    @activity_sequence = ActivitySequence.find(params[:id])
    @activity_instances = @activity_sequence.activity_instances.sort_by{|e| e[:position]}
    respond_to do |format|
      format.js
    end
  end
  
  def select_technological_setting
    @current_tab="guides"
    @technological_setting = TechnologicalSetting.find(params[:id])
        
    respond_to do |format|
      format.js
    end
  end
  
  def select_contextual_setting
    @current_tab="guides"
    @contextual_setting = ContextualSetting.find(params[:id])
    @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    respond_to do |format|
      format.js
    end
  end
  
  def select_sequence
    @current_tab="guides"
    @activity_sequence = ActivitySequence.find(params[:id])
    @activity_instances = @activity_sequence.activities.sort_by{|e| e[:position]}
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all    
    @show_requirements = true


    respond_to do |format|
      format.js
    end
  end
  
  def new_sequence
    @current_tab="guides"
    @activity_sequence = ActivitySequence.new
    @activity_instances = @activity_sequence.activities.sort_by{|e| e[:position]}
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
  
    respond_to do |format|
      format.js
    end
  end
  
  def new_technological_setting
    @current_tab="guides"
    @technological_setting = TechnologicalSetting.new

    respond_to do |format|
      format.js
    end
  end
  
  def new_contextual_setting
    @current_tab="guides"
    @contextual_setting = ContextualSetting.new
    @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    respond_to do |format|
      format.js
    end
  end
  
  def recommend_tools
    @current_tab="guides"
    @parsed_form = ActiveSupport::JSON.decode(params[:request]) 
    
    recommender=Recommender.new
    @recommended_tools=recommender.get_recommended_tools(@parsed_form['params'][0]['learning_activities'][0]['requirements'][0]['identifier'])
    
    respond_to do |format|
      format.js
    end
    
    
    #sde=SdeIntegrator.new
    #@recommended_tools= sde.recommend_tools(params[:request], params[:sde_url])
    #respond_to do |format|
    #  format.js
    #end
   
  end
  
  def recommend_people
    @current_tab="guides"
    
    #sde=SdeIntegrator.new
    #@recommended_people= sde.recommend_people(params[:request], params[:sde_url])

    @parsed_form = ActiveSupport::JSON.decode(params[:request]) 
    
    @keyword = @parsed_form['params'][0]['context']['knowledge_areas'][0]
    @people_near = Person.near(@parsed_form['params'][0]['context']['location'], 600000, :order => "distance")
    @recommended_people = []
    number = 0
    @people_near.each do |person|
      if number <= 3
        person.tags.each do |tag|
          if tag.name == @keyword
            @recommended_people.push(person)
            number += 1
          end
        end
      end
    end
    #@recommended_people = Tag.find_by_name(@keyword).people
    puts "Checkpoint 1"

    respond_to do |format|
      format.js
    end
  end
  
  def recommend_events
    @current_tab="guides"
    #sde=SdeIntegrator.new
    #@recommended_events= sde.recommend_events(params[:request], params[:sde_url])
    @parsed_form = ActiveSupport::JSON.decode(params[:request]) 
    
    recommender=Recommender.new
    #@recommended_events=recommender.get_recommended_events(@parsed_form)
    @subject = @parsed_form['params'][0]['context']['knowledge_areas'][0]
    @recommended_events = Subject.find_by_name(@subject).events.first(20)
    
    #@recommended_events=Event.near(@parsed_form['params'][0]['context']['location'],500, :order => "distance").limit(4)
    respond_to do |format|
      format.js
    end
  end
  
  def get_sequence
    @current_tab="guides"
    @activity_sequence = ActivitySequence.find(params[:id])
    @activity_instances = @activity_sequence.activities.sort_by{|e| e[:position]}
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    @devices = Device.all
    @applications = Application.all
    @people = Person.all
    @events = Event.all
    respond_to do |format|
      format.js
    end
  end
  
  def get_technological_setting
    @current_tab="guides"
    @technological_setting = TechnologicalSetting.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def get_contextual_setting
    @current_tab="guides"
    @contextual_setting = ContextualSetting.find(params[:id])
    @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    respond_to do |format|
      format.js
    end
  end
  
  def popup_show_guide
    @current_tab="guides"
    @guide = Guide.find(params[:element_id])
    @technological_settings = TechnologicalSetting.all
    @activity_sequences = ActivitySequence.all
    @activity_sequence = @guide.activity_sequence
    @activities = Activity.all - Activity.find(:all,:conditions => { :template => true })
    @technological_setting = @guide.technological_setting
    @devices = Device.find(:all, :order => 'name', :conditions => { :external => "false" })
    @applications = Application.find(:all, :order => 'name',:conditions => { :external => "false" })
    @contextual_settings = ContextualSetting.all
    @contextual_setting = @guide.contextual_setting
    @people = Person.all
    @events = Event.all  
       
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    respond_to do |format|
      format.js
    end
  end
  
  def my_guides
    @current_tab="guides"
    @page = "My_guides"
    @search = Guide.search do
      fulltext params[:search]
      with :owner_id, current_user.id
      order_by :updated_at, :desc
      paginate :page => params[:activity_sequences_page], :per_page => 25
    end
    @guides = @search.results
    
    respond_to do |format|
      format.html {render 'index'}
    end
  end
  
  def pick_it
    @current_tab="guides"
    @guide = Guide.find(params[:guide_id])
    cloned_guide = @guide.clone_with_associations
    current_user.guides_owned << cloned_guide
    respond_to do |format|
      format.html { redirect_to edit_guide_path(cloned_guide.id) }
    end
  end
  
  
  def validate_tool_assignment
    @current_tab="guides"
    @funtionality_id=params[:functionality_id]
    @element_class=params[:element_class]
    @element_id=params[:element_id]
    recommender=Recommender.new
    @result=recommender.validate_tool_assignment(@funtionality_id,@element_class,@element_id)
    respond_to do |format|
      format.js
    end
    
  end

  
  
end