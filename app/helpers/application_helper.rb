module ApplicationHelper
    def current_order
      # puts "in_def"
      if !session[:order_id].nil?
        # puts "session not nul"
        begin
        current_order = Order.find(session[:order_id])
        rescue
          flash[:notice] = "ERROR"
          reset_session
          # puts "session nulle"
          redirect_to root_path
          return Order.new
        end
      else
        # puts "session nulle"
        Order.new
      end
    end

    # if user is logged in, return current_user, else return guest_user
    def current_or_guest_user
      if current_user
        if session[:guest_user_id] && session[:guest_user_id] != current_user.id
          logging_in
          # reload guest_user to prevent caching problems before destruction
          guest_user(with_retry = false).try(:destroy)
          session[:guest_user_id] = nil
        end
        current_user
      else
        guest_user
      end
    end

    # find guest_user object associated with the current session,
    # creating one as needed
    def guest_user(with_retry = true)
      # Cache the value the first time it's gotten.
      @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

    rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
       session[:guest_user_id] = nil
       guest_user if with_retry
    end


    private

    # called (once) when the user logs in, insert any code your application needs
    # to hand off from guest_user to current_user.
    def logging_in
      # For example:
      # guest_comments = guest_user.comments.all
      # guest_comments.each do |comment|
        # comment.user_id = current_user.id
        # comment.save!
      # end
      # puts "---------------logging_in-----------------------"
      current_order = guest_user.orders.first
      current_order.user = current_user
      current_order.save!
      # puts "------------------------------------------------"
    end

    def create_guest_user
      u = User.new(:nick_name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}devise@example.com")
      u.save!(:validate => false)
      session[:guest_user_id] = u.id
      u
    end
end
