class AuthenticationController < ApplicationController
  #return auth token once user is authenticated
  def authenticate_escola
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call_escola
    json_response auth_token: auth_token
  end

  def authenticate_aluno
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call_aluno
    json_response auth_token
  end

  private

  def auth_params
    params.permit :email, :password
  end
end
