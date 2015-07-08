class ScenariosController < ApplicationController

  def index
    @page = "scenarios"
    if I18n.locale.to_s == "gl" 
      search_languages=["gl","es"]
    else 
      search_languages=[I18n.locale.to_s]
    end
    per_page = 32
 
    @search = Scenario.search do
      fulltext params[:search]     
      with :template, nil
      with :translations, search_languages
      order_by :updated_at, :desc
      paginate :page => params[:scenarios_page], :per_page => per_page
    end
    
    @scenarios = @search.results          
    @num_results=@search.total  
     
    
       
    @tags = Tag.find(:all, :order => 'name')
    #@templates = Scenario.find(:all,:conditions => { :template => true }) 
    @previous_search_params=params
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scenarios }
    end
  end
  
  # GET /scenarios/1
  # GET /scenarios/1.json
  def show
    @scenario = Scenario.find(params[:id])
    if notice == 'Scenario was successfully created.' || notice == 'Scenario was successfully updated.'
      @previous_action = 'saved'
    else
      @previous_action = 'list'
    end
    @edition_mode=false
        
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scenario }
    end
  end

  def new
    if current_user != nil     
      @scenario_template = Scenario.where(:template => true)[0]
      @scenario = Scenario.new()
      @scenario_template.boxes.each do |box|
        box_clone = box.clone
        @scenario.boxes << box_clone
      end
      @edition_mode=true
       
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @scenario }
      end
    else
      redirect_to scenarios_path
    end
  end


  def edit
    @scenario = Scenario.find(params[:id])
    if current_user !=nil && ((@scenario.owner == current_user) or (@scenario.owner_type=="Group" && @scenario.owner.users.exists?(current_user)))
      @edition_mode=true
    else
      redirect_to scenario_path(@scenario)
    end

  end

  # POST /scenarios
  # POST /scenarios.json
  def create
    @scenario = Scenario.new(params[:scenario])
    if (params[:scenario][:owner_type]==nil)
      @scenario.owner_type="User"
      @scenario.owner=current_user
    end
    @scenario.creator = current_user

    @scenario.save
    @scenario.reload
        
    respond_to do |format|
      if @scenario.save
        format.html { redirect_to @scenario, notice: 'Scenario was successfully created.'}
        format.json { render json: @scenario, status: :created, location: @scenario }
      else
        format.html { render action: "new" }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @scenario = Scenario.find(params[:id])
    if (params[:scenario][:owner_type]==nil)
      @scenario.owner_type="User"
      @scenario.owner=current_user
    end   
    
    respond_to do |format|
      if @scenario.update_attributes(params[:scenario])
        #@scenario.status = 'class'
        @scenario.save
        format.html { redirect_to @scenario, notice: 'Scenario was successfully updated.'}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.json
  def destroy
    @scenario = Scenario.find(params[:id])
    @scenario.destroy

    respond_to do |format|
      format.html { redirect_to scenarios_url }
      format.json { head :ok }
    end
  end
  
  
  def popup_show_scenario
    @scenario = Scenario.find(params[:element_id])
   
    respond_to do |format|
      format.js
    end
  end
  
end