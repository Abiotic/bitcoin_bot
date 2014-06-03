class PanelController < ApplicationController

	def index
		ticker_ltc = Btce::Ticker.new "ltc_btc"
		@btce_btc_ltc = ticker_ltc.json["ltc_btc"]

		ticker_eur = Btce::Ticker.new "btc_eur"
		@btce_btc_eur = ticker_eur.json["btc_eur"]

		ticker_rur = Btce::Ticker.new "btc_rur"
		@btce_btc_rur = ticker_rur.json["btc_rur"]

		# response = HTTParty.get("https://api.vircurex.com/api/get_info_for_currency.json") # прикольная библиотека, облегчающая жизнь HTTParty. здесь запрос по через апи делаем. в response json объект
		vircurex = Vircurex.send_request "get_info_for_currency" # сделал небольшую обертку. создал класс vircurex.rb в моделях. и там метод send_request, куда передается строчка с запросом API. пока так работает, но нужно будет переделать метод, когда понадобится передавать параметры
		@virx_btc = vircurex["BTC"] # тут создаем переменную экземпляра, чтобы можно было ее юзать во вьюхе index.html. я взял инфу только о BTC (биткоинах)
		# в response не похожий на btc-e вывод. там нет ни sell ни buy. нужно правильный API запрос сделать. это уже твои знания предметной области должны быть. ты лучше знаешь что запрашивать у биржи
	
		currencies = Currency.last(20)
		
		

		@cur_to_graph = []

		currencies.each do |currency|
			cur =  {btc_rur_cource: "", 
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

			logger.debug "===============#{eval(currency.btc_rur_cource)["last"]}"
			@cur_to_graph << cur
			
		end

		# @cur = @cur.to_json
		# replace(/&quot;/g,'"')
		logger.debug "===============#{@cur_to_graph}"

		@cur_to_graph = @cur_to_graph.to_json


	end

end
