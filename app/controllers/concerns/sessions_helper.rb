module SessionsHelper
  extend ActiveSupport::Concern

  def user_signed_in?
    !current_user.nil?
  end

  def current_user
    warden.user
  end

  def user_authenticate!
    warden.authenticate!
  end

  def user_session
  end

  def set_user(user)
    warden.set_user(user)
  end

  def warden
    request.env['warden']
  end

end