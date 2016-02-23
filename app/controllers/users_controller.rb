


class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  def new


    @user = User.new(params[:user])

  end





  def create
    user_params[:role] = "student"
    @user = User.new(user_params)
    @user.role = "student"

    if @user.save
      flash[:notice] = "Success"
      flash[:color] = "valid"
    else
      flash[:notice] = "failure"
      flash[:color] = "invalid"
    end
    redirect_to(:controller => 'sessions', :action => 'profile')
    #render "new"

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end


end
