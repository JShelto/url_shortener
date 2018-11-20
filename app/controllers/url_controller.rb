class UrlController < ApplicationController

  #displays the top 100 most visited urls
  def index
    @top_urls = Url.most_visited

    respond_to do |format|
      format.html
      format.json { render :json => @top_urls }
    end
  end

  def create
    u = Url.find_or_create_by(original_url: params["url"])

    respond_to do |format|
      format.html
      format.json { render :json => full_path(request) + u.friendly_url }
    end
  end

  def show
    friendly_url = params["friendly_url"]
    url = Url.find_by(friendly_url: friendly_url)
    if url.present?  
      original_url = url.original_url
      url.track_visit #increments the number of visits by 1 

      return redirect_to original_url, status: 301
    else 
      respond_to do |format|
        format.html
        format.json { render :json => "No url found for #{full_path(request) + u.friendly_url}"}
      end
    end
  end



  private 

    def full_path(request)
      path = request.domain + request.path + "/"
    end

end

# curl -X POST -d "url=https://test123.com" http://localhost:3000/url.json