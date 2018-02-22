class CommentsController < ApplicationController
    before_action :find_post
    before_action :find_comment, only: [:destroy, :update, :edit, :comment_owner ]
    before_action :comment_owner, only: [:destroy, :edit, :update]
     

      def create
        @comment = @post.comments.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
        @comment.save
        
        if @comment.save
            redirect_back(fallback_location: root_path)
        else
            render 'new'
        end
    end

    def destroy
       @comment.destroy
       redirect_back(fallback_location: root_path)
    end

    def edit
        @comment = Comment.find(params[:id])
        @p = Post.find(params[:post_id])
    end

    def update
      if @comment.update(params[:comment].permit(:content))
        respond_to do |f|
            if (@comment.save) 
                f.html { redirect_to "/explore", notice: "Comment edited!" }
            elsif
                f.html { redirect_to "/explore", notice: "Error: Your Comment is the same!." }
           else
               render 'edit'
        #f.html { render 'edit'} ## Specify the format in which you are rendering "new" page      
            end
         end
        end
    end
   


    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_comment
        @comment = @post.comments.find(params[:id])      
    end

    def comment_owner
        unless current_user.id == @comment.user_id
            flash[:notice] = "You can't do that!"
            redirect_back(fallback_location: root_path)
        end
    end
    

end
