class HomeController < ApplicationController
  def index
    unless user_signed_in?
      flash[:notice] = "You must log in."
      redirect_to(new_user_session_path)
    end
  end
end
