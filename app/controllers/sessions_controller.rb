class SessionsController < ApplicationController
  include SessionsHelper
  helper_method :current_user, :user_authenticate!, :set_user

  def new
  end

  def create
    user_authenticate!
    set_user(current_user)
  end

  def destroy
    warden.logout
    redirect_to root_url
  end
end

