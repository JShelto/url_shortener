class Url < ApplicationRecord

    #takes the url param and generates the friendly url
    def generate_friendly_url(url)

    end

    #Returns the urls, count order descending. Defaults to 100 records
    def self.most_visited(count: 100)
      Url.order("visits DESC").first(count)
    end

    #increases the visit count by 1 and updates the record
    def increase_visit_count 
			visits += 1
			self.save
		end
		
		#validates the original url using regex
		def validate_url
		end

		#returns the original url based on the friendly url
		def self.return_original_url

		end
        
end
