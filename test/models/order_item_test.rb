require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "order_item quantity can't be 0" do
    item = OrderItem.new

  
    assert_not_same(item.quantity,0) 
  end

end
  # create_table "order_items", force: :cascade do |t|
  #   t.integer  "order_id",                   null: false
  #   t.integer  "product_id",                 null: false
  #   t.integer  "quantity",                   null: false
  #   t.datetime "created_at",                 null: false
  #   t.datetime "updated_at",                 null: false
  #   t.boolean  "shipped",    default: false
  # end