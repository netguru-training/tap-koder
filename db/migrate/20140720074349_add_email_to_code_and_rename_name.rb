class AddEmailToCodeAndRenameName < ActiveRecord::Migration
  def change
    add_column :codes, :email, :string
    add_column :codes, :ip, :string
    rename_column :codes, :name, :code
  end
end
