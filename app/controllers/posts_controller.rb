class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.links.new(link_params)
    fail
    if @post.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end
  
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_url(current_user)
  end
  
  
  def post_params
    params.require(:post).permit(:name, :circle_ids => [])
  end
  
  def link_params
    params.permit(:links => [:url])
          .require(:links)
          .values
          .reject{ |data| data.values.all?(&:blank?) }
  end
end
