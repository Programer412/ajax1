class CommentsController < ApplicationController

  def new
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.new
    respond_to do|format|
      format.js
    end
  end

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js 
      end
    end
  end

  def destroy
    @post=current_user.posts.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    respond_to do|format|
      if @comment.destroy
        format.html{redirect_to posts_path}
        format.js
      end
    end
    end
      def edit
        @post=current_user.posts.find(params[:post_id])
        @comment=@post.comments.find(params[:id])
      end

      def update
        @post=current_user.posts.find(params[:post_id])
        @comment=@post.comments.find(params[:id])
        respond_to do|format|
          if @comment.update(comment_params)
            format.html { redirect_to posts_path }
            format.js
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.js


          end
        end
        end

private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  end