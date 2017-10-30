Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # These routes will be for signup. The first renders a form in the browse, the second will
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # Shows a users login form, logging them in, and logging them out
  get 'login' => 'sessions#new'
  get 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
