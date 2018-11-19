class UrlController < ApplicationController


  def url #returns the friendly url 
    url_str = request.query_string.to_s.gsub("url=", "") #preserves entirety of url string 
    friendly_url = nil
    if Url.exists?(:original_url => url_str)
      friendly_url = Url.find_by(original_url: url_str).friendly_url
    else 
      new_url = Url.create(original_url: url_str)
      friendly_url = new_url.friendly_url

      new_url.retrieve_page_title
    end
    
    respond_to do |format|
      format.html
      format.json  { render :json => "#{request.protocol}#{request.host_with_port}/" + friendly_url }
    end
  end

  #redirects from the friendly url to the original url stored in the db
  def redirect_friendly_url   
    binding.pry 
    friendly_url = params["friendly_url"]
    url = Url.find_by(friendly_url: friendly_url)
    if url.present?  
      original_url = url.original_url
      url.increase_visit_count #increments the number of visits by 1 
      
      return redirect_to original_url
    else 
      #add error here
    end
    head :ok
  end
    
  #displays the top 100 most visited urls
  def top
    top_urls = Url.most_visited
    respond_to do |format|
      format.html
      format.json  { render :json => top_urls }
    end
  end

end
