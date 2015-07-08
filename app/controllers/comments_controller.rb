class CommentsController < ApplicationController
  def index
    @comments = Comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end
  
  def new
    @comment= Comment.create(params[:comment])
    @comment.user = current_user
    @comment.save
    
    @comments=@comment.commentable.comments
    @comment.commentable.save
    respond_to do |format|
      format.js
    end
  end  
end