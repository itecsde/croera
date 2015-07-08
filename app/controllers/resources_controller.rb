class ResourcesController < ApplicationController
  def index
    @search = Sunspot.search [Device,Application,Content,Person,Event] do
      fulltext params[:search]
      order_by :updated_at, :desc
      paginate :page => params[:page], :per_page => 25
    end
    @resources = @search.results
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
    
  end
  
  def show

  end
  
 


  def list_devices
    puts "Estoy en list_devices"
    @resource_type = "Device"
    @devices = Device.all
    @applications = Application.all
        
    respond_to do |format|
      format.html {render 'index'}
    end    
  end

  def list_applications
    @resource_type = "Application"
    @applications = Application.all
        
    respond_to do |format|
      format.html {render 'index'}
    end    
  end
  
  def list_people
    @resource_type = "Person"
    @people = Person.all
        
    respond_to do |format|
      format.html {render 'index'}
    end    
  end  

  def list_events
    @resource_type = "Event"
    @events = Event.all
        
    respond_to do |format|
      format.html {render 'index'}
    end    
  end  
  
end
