class UrlController < ApplicationController

  #displays the top 100 most visited urls
  def index
    @top_urls = format_urls(Url.most_visited)

    respond_to do |format|
      format.html
      format.json { render :json => @top_urls }
    end
  end

  #creates Url object using original url and returns friendly url
  def create
    u = Url.find_or_create_by(original_url: params["url"])

    if u.errors.any?
      response = u.errors.messages
    else 
      response = full_path(request) + u.friendly_url
    end

    respond_to do |format|
      format.html
      format.json { render :json => response }
    end
  end


  #redirects friendly url to original url or returns an error
  def show
    friendly_url = params["friendly_url"]
    u = Url.find_by(friendly_url: friendly_url)
    if u.present?  
      u.track_visit #increments the number of visits by 1 

      return redirect_to original_url, status: 301
    else 
      render :json => {:error => "No url found for #{request.original_url}"}.to_json, :status => 404
    end
  end



  private 

    def full_path(request)
      request.protocol + request.host_with_port + "/"
    end

    #reformats results, excluding unnecessary columns and displaying a rank based on visit count
    def format_urls(array)
      array.each_with_index.map {|u, i| 
        u = {
          rank: (i+1),
          original_url: u.original_url,
          friendly_url: u.friendly_url,
          title: u.title,
          visits: u.visits
        }
      }
    end

end