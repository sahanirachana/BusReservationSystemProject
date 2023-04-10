class ReservationsController < ApplicationController
  before_action :require_signin
  before_action :set_reservation

  def index
    @reservations=@busdetail.reservations
  end

  def new
    @reservation=@busdetail.reservations.new
  end

  def create
    @reservation=@busdetail.reservations.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      # redirect_to busdetail_reservations_path(@busdetail)
      book_seat(@busdetail)
      redirect_to user_path( @reservation.user)
    else
      render "new"
    end
  end

  def show
  end

  def destroy
    @reservation = @busdetail.reservations.find(params[:id])
    user_id = @reservation.user_id
    free_seat(@busdetail)
    if @reservation.destroy
      redirect_to user_path(user_id)
    end
  end

private

  def set_reservation
    @busdetail=Busdetail.find(params[:busdetail_id])
  end


  def reservation_params
    params.require(:reservation).permit(:passenger,:no_of_seat,:from,:to,:date_of_journey)
  end

end
