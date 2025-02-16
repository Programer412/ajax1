class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts

  end

  def show
    @post = current_user.posts.find(params[:id])
    @comment = @post.comments
    respond_to do |format|
      format.js
  end
    end
  def new
    @post = current_user.posts.new
    respond_to  do|format|
      format.js
    end

  end

  def create

    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js { render 'new' }
      end
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    respond_to do |format|
      format.html {render :index}
    format.js
    end
  end


  def update
    @post = current_user.posts.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path}
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js
      end
    end
    end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, comments_attributes: [:id, :comment, :_destroy])
  end
end
