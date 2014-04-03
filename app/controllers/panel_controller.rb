class PanelController < ApplicationController

	def index
		ticker = Btce::Ticker.new "btc_usd"
		@ticker_hash = ticker.json["btc_usd"]
		logger.debug "====================#{@ticker_hash}"
	end

end
