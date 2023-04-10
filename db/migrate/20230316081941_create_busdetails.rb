class CreateBusdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :busdetails do |t|
      t.string :bus_name
      t.string :bus_no
      t.integer :total_seats
      t.integer :available_seats
      t.string :start_time
      t.string :end_time
      t.references :route,null: false,foreign_key: true

      t.timestamps
    end
  end
end
