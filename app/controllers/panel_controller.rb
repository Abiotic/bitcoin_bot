class PanelController < ApplicationController

	def index
		ticker_ltc = Btce::Ticker.new "btc_ltc"
		@btce_btc_ltc = ticker_ltc.json["btc_ltc"]

		ticker_eur = Btce::Ticker.new "btc_eur"
		@btce_btc_eur = ticker_eur.json["btc_eur"]

		ticker_rur = Btce::Ticker.new "btc_rur"
		@btce_btc_rur = ticker_rur.json["btc_rur"]

		# response = HTTParty.get("https://api.vircurex.com/api/get_info_for_currency.json") # прикольная библиотека, облегчающая жизнь HTTParty. здесь запрос по через апи делаем. в response json объект
		vircurex = Vircurex.send_request "get_info_for_currency" # сделал небольшую обертку. создал класс vircurex.rb в моделях. и там метод send_request, куда передается строчка с запросом API. пока так работает, но нужно будет переделать метод, когда понадобится передавать параметры
		@virx_btc = vircurex["BTC"] # тут создаем переменную экземпляра, чтобы можно было ее юзать во вьюхе index.html. я взял инфу только о BTC (биткоинах)
		# в response не похожий на btc-e вывод. там нет ни sell ни buy. нужно правильный API запрос сделать. это уже твои знания предметной области должны быть. ты лучше знаешь что запрашивать у биржи
	end

end
