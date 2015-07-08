class SeedsController < ApplicationController
  def index
    @activities = Activity.all - Activity.find(:all,:conditions => { :template => true })
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end
end