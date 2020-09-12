class PostsController < ApplicationController

    def index
        @POST_PER_PAGE = 2
        @offset = params.fetch(:offset,0)
        @post = Post.offset(@offset).limit(@POST_PER_PAGE)
        respond_to do |format|
            format.html 
            format.js
        end
    end
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.create(post_params)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
    def post_params
        params.require(:post).permit(:caption, :image)
    end
    
end
