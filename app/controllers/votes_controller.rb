class VotesController < ApplicationController
    before_action :identify_comment
  
    def up
      @comment.upvote_from current_user
      redirect_back(fallback_location: root_path)
    end
  
    def down
      @comment.downvote_from current_user
      redirect_back(fallback_location: root_path)
    end
  
    private
  
    def identify_comment
      type = params[:object]
      @comment = type.constantize.find(params[:id])
    end
  end