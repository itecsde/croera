class ExperiencesController < ApplicationController
  # GET /experiences
  # GET /experiences.json
  def index
    @page = "experiences"
    per_page = 32
   
    @search = Experience.search do
      fulltext params[:search]
      order_by :updated_at, :desc
      paginate :page => params[:page], :per_page => per_page
    end
    @experiences = @search.results
    @num_results=@search.total
    @previous_search_params=params    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiences }
    end
  end
  
  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @experience = Experience.find(params[:id])
    
    if notice == 'Experience was successfully created.' || notice == 'Experience was successfully updated.'
      @previous_action = 'saved'
    else
      @previous_action = 'list'
    end
    @edition_mode=false
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experience }
    end
  end
  
  # GET /experiences/new
  # GET /experiences/new.json
  def new
    if current_user != nil 
      @experience = Experience.new
      @experience_step= ExperienceStep.new
      @experience_step.name = "Name of the activity"
      @experience_step.description = "Description of the activity"
      @experience_step.position = 1
      @experience.experience_steps << @experience_step    
      @edition_mode=true
  
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @experience }
      end
    else
      redirect_to experiences_path
    end
  end
  
  # GET /experiences/1/edit
  def edit
    @experience = Experience.find(params[:id])
    if current_user !=nil && ((@experience.owner == current_user) or (@experience.owner_type=="Group" && @experience.owner.users.exists?(current_user)))
      @edition_mode=true
    else
      redirect_to experience_path(@experience)
    end

  end
  
  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(params[:experience])
    if (params[:experience][:owner_type]==nil)
      @experience.owner_type="User"
      @experience.owner=current_user
    end

    @experience.creator = current_user
    @experience.save
    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render json: @experience, status: :created, location: @experience}
      else
        format.html { render action: "new"}
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /experiences/1
  def update
    @experience = Experience.find(params[:id])
    if (params[:experience][:owner_type]==nil)
      @experience.owner_type="User"
      @experience.owner=current_user
    end
    respond_to do |format|
      if @experience.update_attributes(params[:experience])
        format.html { redirect_to @experience, notice: 'Experience was successfully created' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :ok }
    end
  end
  
  def my_experiences
    @page = "My_experiences"
    @search = Experience.search do
      fulltext params[:search]
      with :owner_id, current_user.id
      order_by :updated_at, :desc
      paginate :page => params[:experience_page], :per_page => 25
    end
    @experiences = @search.results
    
    respond_to do |format|
      format.html {render 'index'}
    end
  end 
  
  # This method returns the HTML code of an element's excerpt
  def get_element_excerpt
    # This hack is highly necessary due to bad naming politics
    if params[:element_class] == 'Application'
      params[:element_class] = 'application'
    end
    if params[:element_class] == 'Person'
      params[:element_class] = 'person'
    end
    if params[:element_class] == 'Event'
      params[:element_class] = 'event'
    end
    if params[:element_class] == 'Lecture'
      params[:element_class] = 'lecture'
    end
    if params[:element_class] == 'Site'
      params[:element_class] = 'site'
    end
    if params[:element_class] == 'Activity'
      params[:element_class] = 'activity'
    end

    @element = Object.const_get(params[:element_class].camelize).find(params[:element_id])
    
    respond_to do |format|
      format.js
    end
  end
    
end