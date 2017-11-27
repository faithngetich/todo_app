class SessionsController < ApplicationController
  # we create (login) and destroy (logout) session
  def new; end

  def create
    @user = User.find_by_email(params[:email])
    # user exists and enters correct password
    if @user && @user.authenticate(params[:password])
      # Save user id inside the browser cookie.
      # Keeps user logged in as they navigate through the website
      session[:user_id] = @user.id
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) :forget(user)
      remember user
      redirect_to '/'
    else
      # send them back to login
      flash.now[:error] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    log_out if logged_in
    render 'new'
  end
end
