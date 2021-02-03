module ApplicationHelper
    def current_order
      puts "in_def"
      if !session[:order_id].nil?
        puts "session not nul"
        Order.find(session[:order_id])
      else
        puts "session nulle"
        Order.new
      end
    end
end
