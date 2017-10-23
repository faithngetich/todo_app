class AddPasswordDigest < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :password_confirmation
    remove_column :users, :password
  end
end
