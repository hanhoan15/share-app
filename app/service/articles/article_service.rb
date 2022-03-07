module Articles
  class ArticleService
    attr_reader :url
    API_TOKEN = 'AIzaSyBYqsdtW7U4uFX3kE4B1QBHEykGagCYXBM'

    def initialize(url)
      set_config
      @url = url
    end

    def get_title
      video.title
    end

    def get_description
      video.description
    end

    def video_id
      params["v"].first
    end

    private

    def set_config
      Yt.configuration.api_key =API_TOKEN
    end

    def video
      @video ||= Yt::Video.new(id: video_id)
    end


    def params
      return @params if defined?(@params)

      uri = URI::parse(url)
      @params = CGI::parse(uri.query)
    end
  end
end
