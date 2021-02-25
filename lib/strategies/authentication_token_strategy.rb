class AuthenticationTokenStrategy < ::Warden::Strategies::Base
  def valid?
    params['session']['token']
  end

  def authenticate!
    user = User.find_by_authentication_token(params['session']['token'])
    if user
      success!(user)
    else
      fail!('strategies.authentication_token.failed')
    end
  end
end