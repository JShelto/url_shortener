class UrlController < ApplicationController
    
    #displays the top 100 most visited urls
    def top
      @top_urls = Url.most_visited
    end

end
