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
					course: "", 
				 	query_time: "",
				  }

			cur[:course] = params[:course] == "" ? eval(currency.btc_usd_cource)["last"] : eval(currency.send(params[:course]))["last"]
			cur[:query_time] = currency.query_time.to_i
			cur_to_graph << cur
		end

		cur_to_graph = cur_to_graph.to_json

		respond_to do |format|
                format.json { render json: cur_to_graph }
        end
	end


end
