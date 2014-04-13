# The home page of the application. Doesn't do much more than redirect the user
# if they are not signed in.
class HomeController < ApplicationController
  def index
    unless user_signed_in?
      flash[:notice] = 'You must log in.'
      redirect_to(new_user_session_path)
    end
  end
end
