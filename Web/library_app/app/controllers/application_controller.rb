class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

#helper_method :authorize_lib
helper_method :admin?, :is_lib?, :allowed?


include SessionsHelper

def admin?
  current_user.role_id == 1 ? true : false
end

def is_lib?
  current_user.role_id == 2 ? true : false
end

def allowed?
    if current_user.role_id == 1
      authorize_admin = true
    else if current_user.role_id == 2
      authorize_admin = true
    else
      false
      end
    end
  end



  def authorize_admin
    if current_user.role_id == 1
      authorize_admin = true
    else if current_user.role_id == 2
      authorize_admin = true
    else
      respond_to do |format|
        format.html { redirect_to "http://localhost:3000/" , notice: 'You do not have authorisation.' }
      end
    end
  end
end

  #Authorize user to ensure they are logged in
  def authorize
    unless current_user
    respond_to do |format|
      format.html { redirect_to "http://localhost:3000/signin" , notice: 'Please sign in!.' }
    end
  end
end
end
