class CommentController < ApplicationController
    before_action :authenticate_user!
    
    def create
        p = Post.find(params[:id])
        comment= p.comments.new
        comment.text = params[:comment]
        comment.user_id = current_user.id
        comment.save
        redirect_to :back
    end
    
    def delete
        Comment.find(params[:id]).destroy
        redirect_to :back
    end
    

end
