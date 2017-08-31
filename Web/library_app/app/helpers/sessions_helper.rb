module SessionsHelper

  def sign_in(user)
      remember_token = User.new_remember_token
      cookies.permanent[:remember_token] = remember_token
      user.update_attribute(:remember_token, User.digest(remember_token))
      current_user = user
      session[:user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # logs out the current user.
   def signout
     session.delete(:user_id)
     @current_user = nil
   end
end
