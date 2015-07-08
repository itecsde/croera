class TechnologicalSettingsController < ApplicationController
  # GET /technological_settings
  # GET /technological_settings.json
  def index
    @technological_settings = TechnologicalSetting.all(:conditions => { :status => 'class' })
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @technological_settings }
    end
  end
  
  # GET /technological_settings/1
  # GET /technological_settings/1.json
  def show
    @technological_setting = TechnologicalSetting.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @technological_setting }
    end
  end
  
  # GET /technological_settings/new
  # GET /technological_settings/new.json
  def new
    @technological_setting = TechnologicalSetting.new
        
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @technological_setting }
    end
  end
  
  # GET /technological_settings/1/edit
  def edit
    @technological_setting = TechnologicalSetting.find(params[:id])
  end
  
  # POST /technological_settings
  # POST /technological_settings.json
  def create
    @technological_setting = TechnologicalSetting.new(params[:technological_setting])
    @technological_setting.status = 'class'
    @technological_setting.save
    respond_to do |format|
      if @technological_setting.save
        format.html { redirect_to @technological_setting, notice: 'Technological setting was successfully created.' }
        format.json { render json: @technological_setting, status: :created, location: @technological_setting}
      else
        format.html { render action: "new"}
        format.json { render json: @technological_setting.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /technological_settings/1
  def update
    @technological_setting = TechnologicalSetting.find(params[:id])
    TechnologicalSettingDeviceAnnotation.where(:technological_setting_id => params[:id]).destroy_all
    TechnologicalSettingApplicationAnnotation.where(:technological_setting_id => params[:id]).destroy_all
    
    respond_to do |format|
      if @technological_setting.update_attributes(params[:technological_setting])
         @technological_setting.status = 'class'
         @technological_setting.save
        format.html { redirect_to @technological_setting, notice: 'Technological Setting was successfully created' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @technological_setting.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /technological_settings/1
  # DELETE /technological_settings/1.json
  def destroy
    @technological_setting = TechnologicalSetting.find(params[:id])
    @technological_setting.destroy

    respond_to do |format|
      format.html { redirect_to technological_settings_url }
      format.json { head :ok }
    end
  end
  
  def popup_show_technological_setting
     @technological_setting = TechnologicalSetting.find(params[:element_id])
    
    respond_to do |format|
      format.js
    end
  end
  
end
