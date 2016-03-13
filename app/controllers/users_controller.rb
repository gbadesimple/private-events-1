class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.events
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Private Events app!"
      redirect_to @user
    else
      flash.now[:danger] = "Please fix the errors shown."
      render :new
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
