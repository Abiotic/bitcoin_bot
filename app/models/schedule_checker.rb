class ScheduleChecker


	def self.update_currencies
		currency = Currency.new
		currency.btc_rur_cource = Btce::Ticker.new("btc_rur").json["btc_rur"].to_s
		currency.btc_eur_cource = Btce::Ticker.new("btc_eur").json["btc_eur"].to_s
		currency.btc_usd_cource = Btce::Ticker.new("btc_usd").json["btc_usd"].to_s
		currency.ltc_btc_cource = Btce::Ticker.new("ltc_btc").json["ltc_btc"].to_s
		# currency.xpm_btc_cource = Btce::Ticker.new("xmp_btc").json["xmp_btc"].to_s
		currency.nmc_btc_cource = Btce::Ticker.new("nmc_btc").json["nmc_btc"].to_s
		currency.query_time = Time.now
		if currency.save
			puts "Currencies has been updated at #{currency.query_time}"
		end
	end
	
	
end