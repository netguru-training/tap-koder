class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.references :offer, index: true

      t.timestamps
    end
  end
end
