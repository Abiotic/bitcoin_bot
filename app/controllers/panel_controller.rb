class PanelController < ApplicationController

	def index

		ticker_usd = Btce::Ticker.new "btc_usd"
		@btce_btc_usd = ticker_usd.json["btc_usd"]

		ticker_eur = Btce::Ticker.new "btc_eur"
		@btce_btc_eur = ticker_eur.json["btc_eur"]

		ticker_rur = Btce::Ticker.new "btc_rur"
		@btce_btc_rur = ticker_rur.json["btc_rur"]

		vircurex = Vircurex.send_request "get_info_for_currency" 
		@virx_btc = vircurex["BTC"]

	end

	def update_currency_graph
		currencies = Currency.where('query_time > ?', Time.now - 1.day)
		cur_to_graph = []
		
		currencies.each do |currency|
			cur = { 
					btc_rur_cource: "", 
				 	btc_usd_cource: "",
				 	btc_eur_cource: "",
					xpm_btc_cource: "",
				 	ltc_btc_cource: "",
				 	nmc_btc_cource: "",
				 	query_time: "",
				  }
			cur[:btc_rur_cource] = eval(currency.btc_rur_cource)["last"]
			cur[:btc_usd_cource] = eval(currency.btc_usd_cource)["last"]
			cur[:btc_eur_cource] = eval(currency.btc_eur_cource)["last"]
			cur[:xpm_btc_cource] = eval(currency.xpm_btc_cource)["last"]
			cur[:ltc_btc_cource] = eval(currency.ltc_btc_cource)["last"]
			cur[:nmc_btc_cource] = eval(currency.nmc_btc_cource)["last"]
			cur[:query_time] = currency.query_time
			cur_to_graph << cur
		end

		cur_to_graph = cur_to_graph.to_json

		respond_to do |format|
                format.json { render json: cur_to_graph }
        end
	end

end
