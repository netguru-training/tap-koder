class RenameColumnOffers < ActiveRecord::Migration
  def change
    rename_column :offers, :destription, :description
  end
end
