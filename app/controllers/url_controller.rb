class UrlController < ApplicationController

  def url #returns the friendly url 
    url_str = params["url"]

    response = Url.process_url_params(request, url_str)

    respond_to do |format|
      format.json  { render :json => response }
    end
  end

  #redirects from the friendly url to the original url stored in the db
  def redirect_friendly_url   
    friendly_url = params["friendly_url"]
    url = Url.find_by(friendly_url: friendly_url)
    if url.present?  
      original_url = url.original_url
      url.increase_visit_count #increments the number of visits by 1 

      return redirect_to original_url
    else 
      render plain: "No url found for #{friendly_url}"
    end
  end

  #displays the top 100 most visited urls
  def top
    @top_urls = Url.most_visited
    respond_to do |format|
      format.html
      format.json  { render :json => @top_urls }
    end
  end

end
