class SessionsController < ApplicationController
  
  def new
  	
  end

  def create
  	@user = User.find_by_username(params[:username])

  	if @user.present? && @user.authenticate(params[:password])
  		session[:id] = @user.id
  		redirect_to books_url
  	else
  		redirect_to :back, notice: 'Please try again'
  	end

  end

  def destroy
  	reset_session
  	redirect_to root_url, notice: 'Signed Out'
  end
end
