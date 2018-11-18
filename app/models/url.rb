class Url < ApplicationRecord

	validates :original_url, :url => true #via valid_url gem
	validates_uniqueness_of :original_url #prevents duplicate records

	after_create :generate_friendly_url #record needs id to create friendly_url

	def generate_friendly_url
		if self.valid? #includes url validation 
			# self.save
			url = original_url
			
			#friendly url is generated using id
			#how to factor in same domain, paths, and params to minimize number of records

		end
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

	#returns the original url based on the friendly url
	def self.return_original_url

	end
        
end
