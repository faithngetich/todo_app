class SessionsController < ApplicationController
# we create (login) and destroy (logout) session
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # user exists and enters correct password 
    if user && user.authenticate(params[:password])
      # Save user id inside the browser cookie.
      # Keeps user logged in as they navigate through the website
      session[:user_id] = user_id
      redirects_to '/'
    else
      # send them back to login
      redirects_to '/login'
  end

  def destroy
    session[:user_id] = nil
    redirects_to '/login'
  end
