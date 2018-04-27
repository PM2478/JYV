class PostsController < ApplicationController
   before_action :set_post, only: [:upvote, :downvote]
   
    def new 
        @post = Post.new
    end
    
    def set_post
        @post= Post.find(params[:id])
    end
           
    def show
        @post = Post.find(params[:id])
    end
      
    #upvote_from user
    #downvote_from user
    def upvote     
        if @post.upvote_from current_user
          respond_to do |format|
            format.html {redirect_back(fallback_location: root_path)}
            format.js
          end
        end
    end

    def downvote
        @post.downvote_from current_user
        redirect_back(fallback_location: root_path)
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id # assign the post to the user who created it.
       
            if @post.save
                redirect_to "", notice: "Question created!" 
            else
                redirect_to "", notice: "Error: Your Question has already been asked!." 
            end
    end
    
    
    private
    def post_params # allows certain data to be passed via form.
        params.require(:post).permit(:user_id, :content)      
    end
    
    
end