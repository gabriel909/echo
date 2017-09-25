class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  #servie entry point
  def call_escola
    JsonWebToken.encode escola_id: escola.id if escola
  end

  def call_aluno
    JsonWebToken.encode aluno_id: aluno.id if aluno
  end

  private

  attr_reader :email, :password

  #verify user credentials
  def escola
    escola = Escola.find_by email: email
    return escola if escola && escola.authenticate(password)

    #raise Authentication error if credentials are invalid
    raise ExceptionHandler::AuthenticationError, Message.invalid_credentials
  end

  def aluno
    aluno = Aluno.find_by email: email
    return aluno if aluno && aluno.authenticate(password)

    #raise Authentication error if credentials are invalid
    raise ExceptionHandler::AuthenticationError, Message.invalid_credentials
  end
end
