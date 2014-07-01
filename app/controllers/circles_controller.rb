class CirclesController < ApplicationController
  
  before_action :require_logged_in
  
  def new
    @circle = Circle.new
  end
  
  def create
    @circle = current_user.owned_circles.new(circle_params)
    if @circle.save
      redirect_to circles_url
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end
  
  def edit
    @circle = Circle.find(params[:id])
  end
  
  def update
    @circle = Circle.find(params[:id])
    if @circle.update_attributes(circle_params)
      redirect_to circles_url
    else
      render :edit
    end
  end
  
  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy
    redirect_to circles_url
  end
  
  def show
    @circle = Circle.find(params[:id])
    render :show
  end
  
  
  private
  def circle_params
    params.require(:circle).permit(:name, :user_ids => [])
  end
  
end
