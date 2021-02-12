module ApplicationHelper
    def current_order
      puts "in_def"
      if !session[:order_id].nil?
        puts "session not nul"
        begin
        current_order = Order.find(session[:order_id])
        rescue
          flash[:notice] = "ERROR"
          reset_session
          puts "session nulle"
          redirect_to root_path
          return Order.new
        end
      else
        puts "session nulle"
        Order.new
      end
    end
end
