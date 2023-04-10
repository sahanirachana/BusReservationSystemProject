class AddColumnToBusdetail < ActiveRecord::Migration[7.0]
  def change
  remove_column :busdetails, :user, :integer
  end
end
