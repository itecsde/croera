class UsersController < ApplicationController
  def index
    @user = current_user
    
    @search = User.search do
      fulltext params[:search]        
        order_by :updated_at, :desc
        paginate :page => params[:users_page], :per_page => 25
    end
    @users = @search.results
    
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  def show
    @subjects = Subject.all
    @locales = ContextualLanguage.all
    @educational_levels = EducationLevel.all
    @operating_systems = OperatingSystem.all
    @edition_mode=false
    
    @user = User.find(params[:id])
    @circumstances=@user.circumstances
    if @circumstances!=nil && @circumstances.length>=1
      @circumstance=@circumstances.first
    else 
      @circumstance=nil
    end
    
    @activities = @user.activities_created
    @sequences= @user.activity_sequences_created
    @guides= @user.guides_created
    @elements= @activities + @sequences + @guides
    @elements= @elements.sort_by{ |obj| obj.created_at }.reverse
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
    
  end
  
  def edit
    if params[:id].to_i != current_user.id
      return redirect_to user_path(params[:id])
    end
    @subjects = Subject.all
    @locales = ContextualLanguage.all
    @educational_levels = EducationLevel.all
    @operating_systems = OperatingSystem.all
    @edition_mode=true
    
    @user = User.find(current_user)
    @circumstances=@user.circumstances
    if @circumstances!=nil && @circumstances.length>=1
      @circumstance=@circumstances.first
    else 
      @circumstance=nil
    end
    
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  def update
    @user = current_user
    
    @circumstance = Circumstance.new(params[:circumstance])
    @user.circumstances.destroy_all
    @user.circumstances << @circumstance
    #@user.circumstances
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   end
   
   
   def popup_show_user
    @user = User.find(params[:element_id])
     
    respond_to do |format|
      format.js
    end
  end
end