class RegistrationsController < Devise::RegistrationsController
  def new 
    @operating_systems=OperatingSystem.all
    @educational_levels=EducationLevel.all
    @locales=ContextualLanguage.all
    @subjects=Subject.all
   
    if params[:circumstance] != nil && params[:user] != nil
      @circumstance=Circumstance.new params[:circumstance]     
      build_resource(params[:user])
      if params[:errors] != nil
        @errors=params[:errors]
      end
    else
      build_resource({})
    end
        
    respond_with self.resource    
  end

  def create
    # add custom create logic here
    build_resource
    @circumstance = Circumstance.new(params[:circumstance])        
    if resource.save
        resource.circumstances<<@circumstance
        #redirect_to user_root_path
        if Tag.find_by_name(resource.circumstances.first.subject.name)!=nil
            new_annotation = UserTagAnnotation.new
            new_annotation.user_id = resource.id
            new_annotation.tag = Tag.find_by_name(resource.circumstances.first.subject.name)
            new_annotation.type_tag = "human"            
            new_annotation.weight= 0.1
            new_annotation.save
        else 
          new_tag=Tag.new
            new_tag.name = resource.circumstances.subject.name
            new_tag.save
            new_annotation = UserTagAnnotation.new
            new_annotation.user_id = resource.id
            new_annotation.tag = Tag.find_by_name(resource.circumstances.first.subject.name)
            new_annotation.type_tag = "human"            
            new_annotation.weight= 0.1
            new_annotation.save
            Sunspot.index new_tag                  
            Sunspot.commit         

        end            

        yield resource if block_given?
        if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_up(resource_name, resource)
            respond_with resource, :location => after_sign_up_path_for(resource)
        else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
            expire_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
    else        
        clean_up_passwords resource       
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
        params[:user].delete(:avatar) # sino falla          
        redirect_to :action => "new", :controller=> "registrations", :circumstance => params[:circumstance], :user=>params[:user], :errors =>resource.errors.full_messages
        respond_with resource
    end
  end
    

  def update
    super
  end
end 