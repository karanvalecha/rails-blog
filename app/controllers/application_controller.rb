class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  def verify_logged_in?
    if request.xhr?
      render :js => "Materialize.toast('Did you Login?<script>window.location.href = \'/login\';</script>',1000);", turbolinks: true unless logged_in?
    else
      redirect_to login_path unless logged_in?
    end
  end
end
