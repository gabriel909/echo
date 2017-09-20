module Response
  def json_response(object, status = :ok)
    render json: { data: object }, status: status
    # render json: { status: 'SUCCESS', message: 'Loaded articles', data: object }, status: :ok
  end
end
