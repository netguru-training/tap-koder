class AddStartDateToAffers < ActiveRecord::Migration
  def change
    add_column :offers, :start_date, :datetime
  end
end
