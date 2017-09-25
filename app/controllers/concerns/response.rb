module Response
  def json_response(object, img_json = { }, video_json = { }, status = :ok)
    render json: { data: object, img: img_json , video: video_json }, status: status
  end
end
