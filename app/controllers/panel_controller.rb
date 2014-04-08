class PanelController < ApplicationController

	def index
		ticker_usd = Btce::Ticker.new "btc_usd"
		@btce_btc_usd = ticker_usd.json["btc_usd"]

		ticker_eur = Btce::Ticker.new "btc_eur"
		@btce_btc_eur = ticker_eur.json["btc_eur"]

		ticker_rur = Btce::Ticker.new "btc_rur"
		@btce_btc_rur = ticker_rur.json["btc_rur"]

		response = HTTParty.get("https://api.vircurex.com/api/get_info_for_currency.json") # прикольная библиотека, облегчающая жизнь HTTParty. здесь запрос по через апи делаем. в response json объект
		@virx_btc = response["BTC"] # тут создаем переменную экземпляра, чтобы можно было ее юзать во вьюхе index.html. я взял инфу только о BTC (биткоинах)
		# в response не похожий на btc-e вывод. там нет ни sell ни buy. нужно правильный API запрос сделать. это уже твои знания предметной области должны быть. ты лучше знаешь что запрашивать у биржи
	end

end
