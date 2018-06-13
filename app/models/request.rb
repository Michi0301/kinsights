class Request
  def initialize(url)
    @url = url
  end

  def get
    Faraday.get(url).body
  end

  private

  attr_reader :url
end
