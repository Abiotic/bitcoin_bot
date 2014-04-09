class Vircurex

	def self.send_request method
		return HTTParty.get("https://api.vircurex.com/api/#{method}.json")
	end

end