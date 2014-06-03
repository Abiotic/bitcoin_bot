# == Schema Information
#
# Table name: currencies
#
#  id             :integer          not null, primary key
#  btc_rur_cource :float
#  btc_eur_cource :float
#  btc_usd_cource :float
#  ltc_btc_cource :float
#  xpm_btc_cource :float
#  nmc_btc_cource :float
#  query_time     :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

class Currency < ActiveRecord::Base

	

end
