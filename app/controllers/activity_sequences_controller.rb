class ActivitySequencesController < ApplicationController
  
  # GET /activity_sequence
  # GET /activity_sequence.json
  def index
    @current_tab="activity_sequences"
    @page = "activity_sequences"
    @search = ActivitySequence.search do
      fulltext params[:search]
      with :status, 'class'
      order_by :updated_at, :desc
      paginate :page => params[:activity_sequences_page], :per_page => 25
    end
    @activity_sequences = @search.results
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_sequences }
    end
  end

  # GET /activity_sequences/1
  # GET /activity_sequences/1.json
  def show
    @current_tab="activity_sequences"    
    @activity_sequence = ActivitySequence.find(params[:id])
    @activity_instances = @activity_sequence.activities.sort_by{|e| e[:position]}
    
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    @edition_mode=false
    @is_in_guide=false
    @is_in_sequence=true


    
    if notice == 'Activity sequence was successfully created.' || notice == 'Activity sequence was successfully updated.'
      @previous_action = 'saved'
    else
      @previous_action = 'list'
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_sequence }
    end
  end

  # GET /activity_sequences/new
  # GET /activity_sequences/new.json
  def new
    @current_tab="activity_sequences"    
    @activity_sequence = ActivitySequence.new
    @activity_instances = @activity_sequence.activities.sort_by{|e| e[:position]}
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    @edition_mode=true
    @is_in_guide=false
    @is_in_sequence=true
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_sequence }
    end
  end

  # GET /activity_sequences/1/edit
  def edit
    @current_tab="activity_sequences"
    @activity_sequence = ActivitySequence.find(params[:id])
    @activity_instances = @activity_sequence.activities.sort_by{|e| e[:position]}
    @devices = Device.all
    @applications = Application.all
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    @people = Person.all
    @events = Event.all
    @edition_mode=true
    @is_in_guide=false
    @is_in_sequence=true

    
  end

  # POST /activity_sequences
  # POST /activity_sequences.json
  def create
    @current_tab="activity_sequences"
    @activity_sequence = ActivitySequence.new(params[:activity_sequence])
    if (params[:activity_sequence][:owner_type]==nil)
      @activity_sequence.owner_type="User"
      @activity_sequence.owner=current_user
    end
    @activity_sequence.creator = current_user
    @activity_sequence.status = 'class'
    @activity_sequence.save
    @activity_sequence.reload
    @activity_sequence.trace_id = @activity_sequence.id
    @activity_sequence.trace_version = 1
       
   
    respond_to do |format|
      if @activity_sequence.save
        format.html { redirect_to @activity_sequence, notice: 'Activity sequence was successfully created.' }
        format.json { render json: @activity_sequence, status: :created, location: @activity_sequence }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_sequences/1
  # PUT /activity_sequences/1.json
  def update
    
    @current_tab="activity_sequences"
    @activity_sequence = ActivitySequence.find(params[:id])
    
    if (params[:activity_sequence][:owner_type]==nil)
      @activity_sequence.owner_type="User"
      @activity_sequence.owner=current_user
    end
    
    #@activity_sequence.creator = current_user
    #@activity_sequence.owner = current_user
    
    #if  @activity_sequence.trace_id ==  @activity_sequence.id
    #   @activity_sequence.trace_version =  @activity_sequence.trace_version + 1
    #else
    #   @activity_sequence.trace_id =  @activity_sequence.id
    #   @activity_sequence.trace_version = 1
    #end
    
    respond_to do |format|
      if @activity_sequence.update_attributes(params[:activity_sequence])
        format.html { redirect_to @activity_sequence, notice: 'Activity sequence was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_sequences/1
  # DELETE /activity_sequences/1.json
  def destroy
    @current_tab="activity_sequences"
    @activity_sequence = ActivitySequence.find(params[:id])
    @activity_sequence.destroy

    respond_to do |format|
      format.html { redirect_to activity_sequences_url }
      format.json { head :ok }
    end
  end
  
  # GET activity/id to show in a pop-up
  def show_activity
    @current_tab="activity_sequences"
    @activity = Activity.find(params[:id])
    @devices = Device.all
    @applications = Application.all
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    @people = Person.all
    @events = Event.all 
    respond_to do |format|
      format.js
    end
  end
  
  def get_assignments_rows
    @current_tab="activity_sequences"
    @activity = Activity.find(params[:id])
    @devices = Device.all
    @applications = Application.all
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    @people = Person.all
    @events = Event.all 
    
    respond_to do |format|
      format.js
    end
  end
  
  def my_activity_sequences
    @current_tab="activity_sequences"
    @page = "My_activity_sequences"
    @search = ActivitySequence.search do
      fulltext params[:search]
      with :status, 'class'
      with :owner_id, current_user.id
      order_by :updated_at, :desc
      paginate :page => params[:activity_sequences_page], :per_page => 25
    end
    @activity_sequences = @search.results
    
    respond_to do |format|
      format.html {render 'index'}
    end
  end
  
  def pick_it
    @current_tab="activity_sequences"
    @activity_sequence = ActivitySequence.find(params[:activity_sequence_id])
    cloned_activity_sequence = @activity_sequence.clone_with_associations
     current_user.activity_sequences_owned << cloned_activity_sequence
    respond_to do |format|
      format.html { redirect_to edit_activity_sequence_path(cloned_activity_sequence.id) }
    end
  end
  
  def get_activity
    @current_tab=params[:current_tab]
    @activity_selected_id = params[:id]
    @devices = Device.find(:all, :order => 'name')
    @applications = Application.find(:all, :order => 'name')
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
     @people = Person.all
    @events = Event.all
    respond_to do |format|
      format.js
    end
  end
  
  def popup_show_activity_sequence
    @current_tab="activity_sequences"
    @activity_sequence = ActivitySequence.find(params[:element_id])
    
    @activities = Activity.all - Activity.find(:all,:conditions => { :template => true })
    @activity_instances = @activity_sequence.activities.sort_by{|e| e[:position]}
    @devices = Device.all
    @applications = Application.all
    @functionalities = Functionality.all
    @person_categories = PersonCategory.all
    @person_roles = PersonRole.all
    @event_types = EventType.all
    @event_places = EventPlace.all
    @people = Person.all
    @events = Event.all  
    respond_to do |format|
      format.js
    end
  end
end
