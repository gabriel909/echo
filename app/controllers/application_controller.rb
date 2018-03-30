class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  attr_reader :current_escola, :current_aluno

  before_action :allow_cross_domain
	
  Rails.application.routes.default_url_options[:protocol] = 'https'

  private

  def authorize_request_escola
    @current_escola = (AuthorizeApiRequest.new(request.headers).call_escola)[:escola]
  end

  def authorize_request_aluno
     puts "passei aqui authorize request aluno"
     @current_aluno = (AuthorizeApiRequest.new(request.headers).call_aluno)[:aluno]
  end

  def allow_cross_domain
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
end
