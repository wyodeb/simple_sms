class Api::V1::AuthenticationController < ApplicationController
  def login
    account = Account.find_by(username: params[:username])
    if account&.authenticate_auth_id(params[:auth_id])
      account_auth_token = AuthToken.encode(account_id: account.id)
      token_valid = Time.zone.now + 24.hours.to_i
      render json: {account: account.username, token: account_auth_token, token_valid_until: token_valid}, status: :ok
    else
      render status: :forbidden
    end
  end
end
