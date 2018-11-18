class UrlController < ApplicationController
    
    #displays the top 100 most visited urls
    def top
      @top_urls = Url.most_visited
    end

    def redirect_shortened_url
      friendly_url = params["friendly_url"]
      original_url = Url.find_by(friendly_url: friendly_url).original_url
      return redirect_to original_url
    end

end
