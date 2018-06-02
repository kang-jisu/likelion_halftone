class PostController < ApplicationController
    
    before_action :authenticate_user!, only: [:create, :write, :delete]
    before_action :is_writer?, only: [:edit, :update, :delete]
    
    def index
        @posts = Post.all
    end
    
    def write
    end
    
    def create
        user = User.find(current_user.id)
        post = user.posts.new 
        
        #post = Post.new
        post.title = params[:title]
        post.content = params[:content]
        post.writer = params[:writer]
        post.save
        
        redirect_to '/'
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        post = Post.find(params[:id])
        post.title = params[:title]
        post.content = params[:content]
        post.writer = params[:writer]
        post.save
        
        redirect_to '/'
    end
    
    def show
        @posts = Post.all
        @post = Post.find(params[:id]) 
        @comments = @post.comments.all
    end
    
    def delete
        post = Post.find(params[:id])
        post.destroy
        redirect_to '/'
    end
    
    private
    def is_writer?
        post = Post.find(params[:id])
        if post.user.id != current_user.id
            redirect_to '/'
        end
    end
end
