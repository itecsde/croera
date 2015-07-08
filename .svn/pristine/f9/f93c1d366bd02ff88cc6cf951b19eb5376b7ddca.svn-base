class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  
  def show
    @picture = Picture.find(params[:id])
    @picture_id = params[:id]
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end    
  end
  
  def new
    @picture_id = nil
    @picture = Picture.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end    
  end
  
  def create
    @picture = Picture.new(params[:picture])
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture}
      else
        format.html { render action: "new"}
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end    
    
  end
  
end