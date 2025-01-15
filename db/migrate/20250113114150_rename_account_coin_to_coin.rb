class RenameAccountCoinToCoin < ActiveRecord::Migration[7.2]
  def change
    rename_table :account_coins, :coins
  end
end
