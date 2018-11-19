class UrlController < ApplicationController


  def url #returns the friendly url 
    url_str = params["url"]
    domain = "#{request.protocol}#{request.host_with_port}/" #current domain 
    friendly_url = ""
    @message = "" #final output
    if Url.exists?(:original_url => url_str)
      friendly_url = Url.find_by(original_url: url_str).friendly_url
      @message = domain + friendly_url
    else 
      new_url = Url.create(original_url: url_str)

      if new_url.errors.any?
        @message = new_url.errors.messages
      else
        friendly_url = new_url.friendly_url
        @message = domain + friendly_url

        new_url.retrieve_page_title #triggers the activejob 
      end
    end

    
    respond_to do |format|
      format.json  { render :json => @message }
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
