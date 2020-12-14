class AddAmountToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :amount, :string
    add_column :order_details, :integer, :string
  end
end
