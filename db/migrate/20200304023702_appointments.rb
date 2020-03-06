class Appointments < ActiveRecord::Migration
  def change
    create_table :appointments do |col|
      col.string :service_name
      col.date :date
      col.integer :client_id
    end
  end
end
