class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :passenger
      t.integer :no_of_seat
      t.string :from
      t.string :to
      t.datetime :date_of_journey
      t.references :busdetail, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
