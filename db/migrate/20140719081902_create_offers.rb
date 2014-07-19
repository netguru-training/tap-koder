class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.text :destription
      t.references :user, index: true
      t.integer :code_limit

      t.timestamps
    end
  end
end
