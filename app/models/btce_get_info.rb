class GetInfo
	def index
		require 'btce'
		info = Btce::TradeAPI.apikey.get_info
		logger.debug "ololo"
	end
end