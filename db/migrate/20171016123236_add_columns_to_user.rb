class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    # change_table :users do |t|
    #   t.string :password_confirmation
    # end
    add_column :users, :password_confirmation, :string
    add_index :users, %i[name email], unique: true
  end
end
