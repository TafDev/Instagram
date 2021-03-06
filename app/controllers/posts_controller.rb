class PostsController < ApplicationController
   before_action :authenticate_user!
    def index
       @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.save
            flash[:success] = "Your post has been created"
            redirect_to @post
        else
            flash[:alert] = "Halt, you fiend! You need an image to post here!"
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:success] = 'Post updated hombre.'
        redirect_to post_path
      else
        flash[:alert] = 'Something is wrong with your form!'
        redirect_to post_path
      end
    end

    def destroy
      @post = Post.find(params[:id])
      if @post.destroy
        flash[:alert] = 'Your post has been deleted'
        redirect_to posts_path
      else
        render 'edit'
      end

    end

    private

    def post_params
        params.require(:post).permit(:caption, :image)
    end

end
