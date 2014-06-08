class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :btc_rur_cource
      t.string :btc_eur_cource
      t.string :btc_usd_cource
      t.string :ltc_btc_cource
      t.string :xpm_btc_cource
      t.string :nmc_btc_cource
      t.datetime :query_time
      t.timestamps
    end
  end
end