class ApplicationController < ActionController::Base
   
   
    private


    def require_signin
      unless current_user
        redirect_to new_session_url
      end
    end

    def current_user
      current_user = User.find(session[:user_id]) if session[:user_id]
    end
    
    helper_method :current_user


    def require_owner
      unless current_user_owner?
        redirect_to root_url
      end
    end
      
    def current_user_owner?
      current_user && current_user.owner?
    end

    helper_method :current_user_owner?


    def book_seat(busdetail)
      busdetail.available_seats = busdetail.available_seats - @reservation.no_of_seat
      busdetail.save(validate: false) 
    end
  
    helper_method :available


    def free_seat(busdetail)
      busdetail.available_seats = busdetail.available_seats + @reservation.no_of_seat
      busdetail.save(validate: false) 
    end
  
    helper_method :available
    

end
