class UrlController < ApplicationController
    
    #displays the top 100 most visited urls
    def top
      @top_urls = Url.most_visited
      respond_to do |format|
        format.html
        format.json  { render :json => @top_urls }
      end
    end

    def redirect_shortened_url
      friendly_url = params["friendly_url"]
      url = Url.find_by(friendly_url: friendly_url)
      if url.present?  
        original_url = url.original_url
        url.update(visits: (url.visits + 1)) #increments the number of visits by 1 
        
        RetrieveTitleJob.perform_later(friendly_url)
        return redirect_to original_url
      else 
        #add error here
      end
    end


end
