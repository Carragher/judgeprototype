
#layout "application"

class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  def new


    @user = User.new(params[:user])

  end





  def create
    user_params[:role] = "student"
    @user = User.new(user_params)
    @user.role = "student"
   # puts @user.username

    if @user.save

    else

    end
    redirect_to(:controller => 'sessions', :action => 'profile')
    #render "new"

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end


end
