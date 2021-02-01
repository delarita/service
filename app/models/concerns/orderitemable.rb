module Orderitemable
  extend ActiveSupport::Concern

  included do
    has_many :order_items, :as => :orderitemable
  end
end
