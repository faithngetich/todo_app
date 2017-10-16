class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    # change_table :users do |t|
    #   t.string :password_confirmation
    # end
    add_column :users, :password_confirmation, :string
    change_column :users, :name, unique: true, index: true
    change_column :users, :email, unique: true, index: true
  end
end
