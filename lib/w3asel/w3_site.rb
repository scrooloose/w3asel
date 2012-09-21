class W3Site
  def initialize(filename)
    @filename = filename
  end

  def results
    @results ||= `#{curl_cmd}`
  end

  private

    def curl_cmd
      %Q(curl -s -F output=text -F "uploaded_file=@#{@filename};type=text/html" http://validator.w3.org/check)
    end

end
