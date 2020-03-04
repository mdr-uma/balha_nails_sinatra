class Clients < ActiveRecord::Migration
  def change
    create_table :clients do |col|
      col.string :name
      col.integer :phone_num
      col.string :email
      col.string :password_digest
    end
  end
end
