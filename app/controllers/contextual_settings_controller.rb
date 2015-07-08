class ContextualSettingsController < ApplicationController
  # GET /contextual_settings
  # GET /contextual_settings.json
  def index
    @contextual_settings = ContextualSetting.all(:conditions => { :status => 'class' })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contextual_settings }
    end
  end

  # GET /contextual_settings/1
  # GET /contextual_settings/1.json
  def show
    @contextual_setting = ContextualSetting.find(params[:id])
    @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contextual_setting }
    end
  end

  # GET /contextual_settings/new
  # GET /contextual_settings/new.json
  def new
    @contextual_setting = ContextualSetting.new
    @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contextual_setting }
    end
  end

  # GET /contextual_settings/1/edit
  def edit
    @contextual_setting = ContextualSetting.find(params[:id])
    @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    
  end

  # POST /contextual_settings
  # POST /contextual_settings.json
  def create
    @contextual_setting = ContextualSetting.new(params[:contextual_setting])
    @contextual_setting.status = 'class'
    @contextual_setting.save
    
    respond_to do |format|
      if @contextual_setting.save
        format.html { redirect_to @contextual_setting, notice: 'Contextual setting was successfully created.' }
        format.json { render json: @contextual_setting, status: :created, location: @contextual_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @contextual_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contextual_settings/1
  # PUT /contextual_settings/1.json
  def update
    @contextual_setting = ContextualSetting.find(params[:id])

    respond_to do |format|
      if @contextual_setting.update_attributes(params[:contextual_setting])
        @contextual_setting.status = 'class'
        @contextual_setting.save
        format.html { redirect_to @contextual_setting, notice: 'Contextual setting was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contextual_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contextual_settings/1
  # DELETE /contextual_settings/1.json
  def destroy
    @contextual_setting = ContextualSetting.find(params[:id])
    @contextual_setting.destroy

    respond_to do |format|
      format.html { redirect_to contextual_settings_url }
      format.json { head :ok }
    end
  end
  
  def popup_show_contextual_setting
     @contextual_setting = ContextualSetting.find(params[:element_id])
     @subjects = Subject.all
    @education_levels = EducationLevel.all
    @contextual_languages = ContextualLanguage.all
    
    respond_to do |format|
      format.js
    end
  end
end
