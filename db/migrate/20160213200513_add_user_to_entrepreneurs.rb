class AddUserToEntrepreneurs < ActiveRecord::Migration
  def change
    add_reference :entrepreneurs, :user, index: true
    add_foreign_key :entrepreneurs, :users
  end
end
