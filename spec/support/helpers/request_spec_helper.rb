module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def json_parsed_response
    JSON.parse(response_body)
  end
end
