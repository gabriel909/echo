class LogoutUser
  def initialize(token = "")
    @token = token
  end

  def call
    puts "TOKEN RECEIVED #{@token}"
    Blacklist.create! token: @token
  end
end
