class Url < ApplicationRecord
	require 'open-uri' #needed for Nokogiri

	CHAR_MAP = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

	validates :original_url, :url => true #via valid_url gem
	validates_uniqueness_of :original_url #prevents duplicate records

	after_create :save_friendly_url #record needs id to create friendly_url

	def save_friendly_url 
		if self.valid? #includes url validation 
			# self.save
			
			#friendly url is generated using id
			#how to factor in same domain, paths, and params to minimize number of records
			self.friendly_url = generate_friendly_url(self.id)
			self.save!
		end
	end

	def generate_friendly_url(id)
		id = self.id
		Url.convert_to_base(id)
	end

	#returns the original url based on the friendly url
	def self.return_original_url(str)
		id = Url.convert_from_base(str)
		url = Url.find(id).original_url
	end


	#Returns the urls, count order descending. Defaults to 100 records
	def self.most_visited(count: 100)
		urls = Url.order("visits DESC").first(count)
	end

	#increases the visit count by 1 and updates the record
	def increase_visit_count 
		visits += 1
		self.save
	end

	def self.get_title(friendly_url)
		url = Url.find_by(friendly_url: friendly_url)
		doc = Nokogiri::HTML(open(url.original_url))
		title = doc.title
		if title.present?
			url.title = title.to_s
			url.save!
		end
	end

	private
		def self.convert_to_base(num, base = 62) #convert
			return CHAR_MAP[0] if num == 0
			result = ""
			while num > 0
				r = num % base
				result.prepend(CHAR_MAP[r])
				num = (num / base).floor
			end
			result
		end

		def self.convert_from_base(value, base = 62)
			base_10_num = 0
			digit = 0
			value.to_s.reverse.each_char do |char|
				num = CHAR_MAP.index(char)
				base_10_num += num * (base ** digit)
				digit += 1
			end
			base_10_num
		end
        
end
