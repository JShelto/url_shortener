class UrlController < ApplicationController


  def url #returns the friendly url 
    url_str = params["url"]
    domain = "#{request.protocol}#{request.host_with_port}/" #current domain 
    @friendly_url = ""
    if Url.exists?(:original_url => url_str)
      friendly_url = Url.find_by(original_url: url_str).friendly_url
      @friendly_url = domain + friendly_url
    else 
      new_url = Url.create(original_url: url_str)
      friendly_url = new_url.friendly_url

      @friendly_url = domain + friendly_url

      new_url.retrieve_page_title
    end

    
    respond_to do |format|
      format.json  { render :json => @friendly_url }
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
    end
    head :ok
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
