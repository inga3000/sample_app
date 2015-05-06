class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :total
    end
    add_index :orders, :user_id
    add_index :orders, :product_id
  end

  # migrations can have either a "change" part or an "up" and a "down" part.
  # When they have a "change" part, rake db:rollback know how to reverse/undo
  # its steps. When they have an "up" and a "down" part, rake db:rollback does
  # whatever it is inside "down" (whereas rake db:migrate does whatever it is
  # inside "up" part)

  # "change" part is done by rake db:migrate
  # and rake db:rollback does the opposite steps that
  # exist inside the "change" part.
  # So "create_table :orders....", has opposite:
  # "drop_table :orders" 
  #
  #
  # remove_index :orders, :product-id
  # remove_index :orders, :user_id
  # drop_table :orders
  #
end
