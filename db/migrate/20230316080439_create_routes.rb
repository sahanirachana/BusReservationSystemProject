class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :source
      t.string :destination

      t.timestamps
    end
  end
end
