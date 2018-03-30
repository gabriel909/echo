class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  #service entry point
  def call_escola
    token = JsonWebToken.encode escola_id: escola.id if escola
    { auth_token: token, escola: escola }
  end

  def call_aluno
    token = JsonWebToken.encode aluno_id: aluno.id if aluno
    { auth_token: token, aluno: aluno, escola: aluno.escola.nome }
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
