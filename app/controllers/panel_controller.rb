class PanelController < ApplicationController

	def index
		ticker_usd = Btce::Ticker.new "btc_usd"
		@btc_usd = ticker_usd.json["btc_usd"]

		ticker_eur = Btce::Ticker.new "btc_eur"
		@btc_eur = ticker_eur.json["btc_eur"]

		ticker_rur = Btce::Ticker.new "btc_rur"
		@btc_rur = ticker_rur.json["btc_rur"]		
	end

end
