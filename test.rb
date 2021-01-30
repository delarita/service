epil = Epilation.find(41)

theorderableitem = OrderItem.new(:orderitemable => epil)

theorder = Order.new

theorderableitem.order = theorder

theorderableitem.quantity = 1

theorderableitem.save!

theorder.order_items << theorderableitem

theorder.save!
