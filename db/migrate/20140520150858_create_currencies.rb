class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.float :btc_rur_cource
      t.float :btc_eur_cource
      t.float :btc_usd_cource
      t.float :ltc_btc_cource
      t.float :xpm_btc_cource
      t.float :nmc_btc_cource
      t.datetime :query_time
      t.timestamps
    end
  end
end
