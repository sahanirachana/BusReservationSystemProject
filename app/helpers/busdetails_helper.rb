module BusdetailsHelper
    def seats(busdetail)
        if busdetail.available_seats == 0
            "Not Available"
        # else
        #     available_seats = available_seats - params[]

        end
    end

end
