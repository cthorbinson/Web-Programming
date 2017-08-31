class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in(user)
      current_user
      respond_to do |format|
      format.html { redirect_to "http://localhost:3000" , notice: 'You have successfully signed in!' }
    end
    else
      flash[:notice] ='Invalid login/password combination'
      render 'new'
    end
  end

  def destroy
    signout
    respond_to do |format|
    format.html { redirect_to "http://localhost:3000/signin" , notice: 'You have successfully signed out!'}
    end
  end

end
