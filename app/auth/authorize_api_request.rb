class AuthorizeApiRequest
  def initialize(headers = { })
    @headers = headers
  end

  #services entry point - return valid user object
  def call_escola
    { escola:
      user do
        @escola ||= Escola.find decoded_auth_token[:escola_id] if decoded_auth_token
      end
    }
  end

  def call_aluno
    { aluno:
      user do
        @aluno ||= Aluno.find decoded_auth_token[:aluno_id] if decoded_auth_token
      end
    }
  end

  private

  attr_reader :headers

  def user
    #check if user is in the database
    #memorize user object
    yield

    #handle record not found
  rescue ActiveRecord::RecordNotFound => e
    #raise custom error
    raise ExceptionHandler::InvalidToken, "#{Message.invalide_token} #{e.message}"
  end

  #decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode http_auth_header
  end

  #check for token in 'Authorization' header
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end

    raise ExceptionHandler::MissingToken, Message.missing_token
  end
end
