class Services < ActiveRecord::Migration
  def change
    create_table :services do |col|
      col.string :service_name
      col.date :date
      col.string :duration
      col.integer :client_id
    end
  end
end
