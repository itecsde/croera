class BookmarksController < ApplicationController
  
  def index
    @bookmarked_events=current_user.bookmarked_events
    @bookmarked_applications=current_user.bookmarked_applications
    @bookmarked_people=current_user.bookmarked_people
    @bookmarked_lectures=current_user.bookmarked_lectures
    @bookmarked_sites=current_user.bookmarked_sites
    @bookmarked_documentaries=current_user.bookmarked_documentaries    
    @bookmarked_courses=current_user.bookmarked_courses    
    @bookmarked_articles=current_user.bookmarked_articles    
    @bookmarked_lres=current_user.bookmarked_lres
    @bookmarked_posts=current_user.bookmarked_posts    
    @bookmarked_slideshows=current_user.bookmarked_slideshows
    @bookmarked_biographies=current_user.bookmarked_biographies
    @bookmarked_reports=current_user.bookmarked_reports
    @bookmarked_widgets=current_user.bookmarked_widgets
    @bookmarked_klascements=current_user.bookmarked_klascements              
    @bookmarked_artworks=current_user.bookmarked_artworks
    @bookmarked_books=current_user.bookmarked_books                



    respond_to do |format|
      format.html # index.html.erb
    end  
  end
  
  def add_bookmark
    @user=current_user
    @element_class=params[:element_class]
    @element_id=params[:element_id]
    
    if @element_class=="event"
      element=Event.find(@element_id)
      if @user.bookmarked_events.find_by_id(element.id)==nil
          @user.bookmarked_events << element 
      end
    elsif @element_class=="application"
      element=Application.find(@element_id)
      if @user.bookmarked_applications.find_by_id(element.id)==nil
          @user.bookmarked_applications << element 
      end
    elsif @element_class=="person"
      element=Person.find(@element_id)
      if @user.bookmarked_people.find_by_id(element.id)==nil
          @user.bookmarked_people << element 
      end
    elsif @element_class=="lecture"
      element=Lecture.find(@element_id)
      if @user.bookmarked_lectures.find_by_id(element.id)==nil
          @user.bookmarked_lectures << element 
      end
    elsif @element_class=="site"
      element=Site.find(@element_id)
      if @user.bookmarked_sites.find_by_id(element.id)==nil
          @user.bookmarked_sites << element 
      end
    elsif @element_class=="documentary"
      element=Documentary.find(@element_id)
      if @user.bookmarked_documentaries.find_by_id(element.id)==nil
          @user.bookmarked_documentaries << element 
      end
    elsif @element_class=="course"
      element=Course.find(@element_id)
      if @user.bookmarked_courses.find_by_id(element.id)==nil
          @user.bookmarked_courses << element 
      end
    elsif @element_class=="article"
      element=Article.find(@element_id)
      if @user.bookmarked_articles.find_by_id(element.id)==nil
          @user.bookmarked_articles << element 
      end
    elsif @element_class=="lre"
      element=Lre.find(@element_id)
      if @user.bookmarked_lres.find_by_id(element.id)==nil
          @user.bookmarked_lres << element 
      end
    elsif @element_class=="post"
      element=Post.find(@element_id)
      if @user.bookmarked_posts.find_by_id(element.id)==nil
          @user.bookmarked_posts << element 
      end
    elsif @element_class=="slideshow"
      element=Slideshow.find(@element_id)
      if @user.bookmarked_slideshows.find_by_id(element.id)==nil
          @user.bookmarked_slideshows << element 
      end
    elsif @element_class=="biography"
      element=Biography.find(@element_id)
      if @user.bookmarked_biographies.find_by_id(element.id)==nil
          @user.bookmarked_biographies << element 
      end
    elsif @element_class=="report"
      element=Report.find(@element_id)
      if @user.bookmarked_reports.find_by_id(element.id)==nil
          @user.bookmarked_reports << element 
      end
    elsif @element_class=="widget"
      element=Widget.find(@element_id)
      if @user.bookmarked_widgets.find_by_id(element.id)==nil
          @user.bookmarked_widgets << element 
      end
    elsif @element_class=="klascement"
      element=Klascement.find(@element_id)
      if @user.bookmarked_klascements.find_by_id(element.id)==nil
          @user.bookmarked_klascements << element 
      end
    elsif @element_class=="artwork"
      element=Artwork.find(@element_id)
      if @user.bookmarked_artworks.find_by_id(element.id)==nil
          @user.bookmarked_artworks << element 
      end
    elsif @element_class=="book"
      element=Book.find(@element_id)
      if @user.bookmarked_books.find_by_id(element.id)==nil
          @user.bookmarked_books << element 
      end                     
    end        
    @result=true
    
    render :nothing => true
    
    #respond_to do |format|
    #  format.js
    #end
  end  
  
  def remove_bookmark
    @user=current_user
    @element_class=params[:element_class]
    @element_id=params[:element_id]
    
    if @element_class=="event"
      element=@user.bookmarked_events.find(@element_id)
      if element
        @user.bookmarked_events.delete(element)  
      end
    elsif @element_class=="application"
      element=@user.bookmarked_applications.find(@element_id)
      if element
        @user.bookmarked_applications.delete(element)  
      end
    elsif @element_class=="person"      
      element=@user.bookmarked_people.find(@element_id)
      if element
        @user.bookmarked_people.delete(element)  
      end
    elsif @element_class=="lecture"      
      element=@user.bookmarked_lectures.find(@element_id)
      if element
        @user.bookmarked_lectures.delete(element)  
      end
    elsif @element_class=="site"      
      element=@user.bookmarked_sites.find(@element_id)
      if element
        @user.bookmarked_sites.delete(element)  
      end
    elsif @element_class=="documentary"      
      element=@user.bookmarked_documentaries.find(@element_id)
      if element
        @user.bookmarked_documentaries.delete(element)  
      end
    elsif @element_class=="course"      
      element=@user.bookmarked_courses.find(@element_id)
      if element
        @user.bookmarked_courses.delete(element)  
      end
    elsif @element_class=="article"      
      element=@user.bookmarked_articles.find(@element_id)
      if element
        @user.bookmarked_articles.delete(element)  
      end
    elsif @element_class=="lre"      
      element=@user.bookmarked_lres.find(@element_id)
      if element
        @user.bookmarked_lres.delete(element)  
      end
    elsif @element_class=="post"      
      element=@user.bookmarked_posts.find(@element_id)
      if element
        @user.bookmarked_posts.delete(element)  
      end
    elsif @element_class=="slideshow"      
      element=@user.bookmarked_slideshows.find(@element_id)
      if element
        @user.bookmarked_slideshows.delete(element)  
      end
    elsif @element_class=="biography"      
      element=@user.bookmarked_biographies.find(@element_id)
      if element
        @user.bookmarked_biographies.delete(element)  
      end
    elsif @element_class=="report"      
      element=@user.bookmarked_reports.find(@element_id)
      if element
        @user.bookmarked_reports.delete(element)  
      end
    elsif @element_class=="widget"      
      element=@user.bookmarked_widgets.find(@element_id)
      if element
        @user.bookmarked_widgets.delete(element)  
      end
    elsif @element_class=="klascement"      
      element=@user.bookmarked_klascements.find(@element_id)
      if element
        @user.bookmarked_klascements.delete(element)  
      end
    elsif @element_class=="artwork"      
      element=@user.bookmarked_artworks.find(@element_id)
      if element
        @user.bookmarked_artworks.delete(element)  
      end
    elsif @element_class=="book"      
      element=@user.bookmarked_books.find(@element_id)
      if element
        @user.bookmarked_books.delete(element)  
      end                 
    end
    
    @result=true
    
    render :nothing => true
    
    #respond_to do |format|
    #  format.js
    #end
  end  
  
end