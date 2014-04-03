class PanelController < ApplicationController

	def index
		ticker = Btce::Ticker.new "btc_usd"
		@ticker_json = ticker.json["btc_usd"]
		# my_hash = JSON.parse('{"hello": "goodbye"}')
		logger.debug "====================#{@ticker_json}"
	end
	
end
