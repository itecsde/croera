class CreatedElementsController < ApplicationController
  
  def index
    @created_events=current_user.events_created
    @created_applications=current_user.applications_created
    @created_people=current_user.people_created
    @created_lectures=current_user.lectures_created
    @created_sites=current_user.sites_created
    @created_documentaries=current_user.documentaries_created
    @created_courses=current_user.courses_created  
    @created_articles=current_user.articles_created      
    @created_lres=current_user.lres_created
    @created_posts=current_user.posts_created    
    @created_slideshows=current_user.slideshows_created
    @created_biographies=current_user.biographies_created
    @created_reports=current_user.reports_created           
    @created_widgets=current_user.widgets_created           
    @created_klascements=current_user.klascements_created           
    @created_artworks=current_user.artworks_created           
    @created_books=current_user.books_created           

    
    @created_scenarios=current_user.scenarios_created
    @created_activities = current_user.activities_created
    @created_experiences= current_user.experiences_created
    @created_guides= current_user.guides_created
    
    respond_to do |format|
      format.html # index.html.erb
    end  
  end
  
end