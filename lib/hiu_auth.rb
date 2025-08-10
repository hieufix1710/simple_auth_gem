# frozen_string_literal: true
require_relative 'hiu_http'

class HiuAuth
  FACEBOOK_API_VERSION = 'v12.0'

  # Verify google id token from google credential response
  # Arguments:
  #  id_token: (String)
  #
  # Output: [is_success(boolean), data(Hash)]
  def self.verify_google_credential(id_token)
    base_url = "https://oauth2.googleapis.com"
    uri = "/tokeninfo?id_token=#{id_token}"
    headers = { 'Content-Type': 'application/json' }
    request = HiuHttp.new(base_url, uri, :get, headers)
    response = request.call
    if response.status == 200
      data = JSON.parse(response.body)
      return [true, data]
    end
    [false]
  end

  # Verify facebook access token from facebook credential response
  # Arguments:
  #  access_token: (String)
  #
  # Output: [is_success(boolean), data(Hash)]
  def self.verify_facebook_credential(access_token)
    base_url = "https://graph.facebook.com/#{FACEBOOK_API_VERSION}"
    uri = "/me?access_token=#{access_token}&fields=id,name,email"
    headers = { 'Content-Type': 'application/json' }
    request = HiuHttp.new(base_url, uri, :get, headers)
    response = request.call
    if response.status == 200
      data = JSON.parse(response.body)
      return [true, data]
    end
    [false]
  end
end
