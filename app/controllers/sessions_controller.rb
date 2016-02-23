class SessionsController < ApplicationController

  before_filter :authenticate_user, :except => [:login, :login_attempt]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login

  end

  def login_attempt

    authorized_user = User.authenticate(params[:username],params[:login_password])

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:controller => 'sessions', :action => 'home')

    else

      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def home

  end

  def profile

  end

  #upload
  def setting

  end

  def admin

  end

  def judge

  end
end
