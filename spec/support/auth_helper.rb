module AuthHelper
  def authenticate_with_user(user)
    request.headers['Authorization'] = "Token token=#{user.token}, email=#{user.email}"
  end

  def clear_authentication_token
    request.headers['Authorization'] = nil
  end
end
