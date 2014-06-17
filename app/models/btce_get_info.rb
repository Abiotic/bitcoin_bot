class GetInfo
	def index
		require 'btce'
		info = Btce::TradeAPI.new_from_keyfile.get_info
		
	end