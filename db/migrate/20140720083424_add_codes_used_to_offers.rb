class AddCodesUsedToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :codes_used, :integer, default: 0
  end
end
