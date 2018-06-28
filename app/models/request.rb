# frozen_string_literal: true

class Request
  USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'

  def initialize(url)
    @url = url
  end

  def get
    conn = Faraday.new(url)
    conn.headers[:user_agent] = USER_AGENT
    response = conn.get
    response.body
  end

  private

  attr_reader :url
end
