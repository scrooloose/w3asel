class W3Site
  class APIError < StandardError; end

  def initialize(filename)
    @filename = filename
  end

  def results
    @results ||= output_from_w3
  end

  private

    def output_from_w3
      params = {
        output: "text",
        fragment: File.read(@filename)
      }

      begin
        HTTParty.post(endpoint, params).body
      rescue(SocketError)
        raise(APIError, "Could not contact: #{endpoint}")
      end
    end

    def endpoint
      "http://validator.w3.org/check"
    end
end
