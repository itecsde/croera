class GroupsController < ApplicationController
  #############################
  def index
    if current_user != nil   
      @search = Group.search do
        fulltext params[:search]
        order_by :updated_at, :desc
        paginate :page => params[:page], :per_page => 25
      end
      @groups = @search.results
      @page='groups'
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @groups }
      end
    else
      redirect_to user_root_path
    end
  end
  
  ###################################
  def show
    if current_user != nil   
      @group = Group.find(params[:id])     
      @edition_mode=false
  
      if notice == 'Group was successfully created.' || notice == 'Group was successfully updated.'
        @previous_action = 'saved'
      else
        @previous_action = 'list'
      end
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @group }
      end
    else
      redirect_to user_root_path
    end
  end
  
  ##################################### 
  def new
    if current_user != nil
      @group = Group.new
      @edition_mode=true
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @group }
      end      
    else
      redirect_to user_root_path
    end
  end
  
  
  ######################################
  def edit
    if current_user != nil 
      @group = Group.find(params[:id])
      @edition_mode=true
    else 
      redirect_to user_root_path
    end
  end
  
  
  #######################################
  def create
    @group = Group.new(params[:group])
    @group.owner = current_user
    @group.creator = current_user
    @group.save
 
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end


  #######################################
  def update
    @group = Group.find(params[:id])
    @group.users.destroy_all
     
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end


  #######################################
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end
            
  
  def my_groups
    @page = "My_groups"
    @search = Group.search do
      fulltext params[:search]
      with :owner_id, current_user.id
      order_by :updated_at, :desc
      paginate :page => params[:page], :per_page => 25
    end
    @groups = @search.results
    
    respond_to do |format|
      format.html {render 'index'}
    end
  end
  
  
  def popup_show_group
    @group = Group.find(params[:element_id])
    @resource_type = "Group"
    @popup = true
    
    respond_to do |format|
      format.js
    end
  end
  
end