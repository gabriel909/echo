class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  attr_reader :current_escola, :current_aluno

  private

  def authorize_request_escola
    @current_escola = (AuthorizeApiRequest.new(request.headers).call_escola)[:escola]
  end

  def authorize_request_aluno
    @current_aluno = (AuthorizeApiRequest.new(request.headers).call_aluno)[:aluno]
  end
end
