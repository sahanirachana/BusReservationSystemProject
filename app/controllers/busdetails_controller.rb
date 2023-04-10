class BusdetailsController < ApplicationController
  before_action :set_busdetail, only: %i[ show edit update destroy ]
  before_action :require_signin, except: [:index, :show]
  before_action :require_owner, except: [:index, :show]

  # GET /busdetails or /busdetails.json
  def index
    if params[:search]
      @busdetails = Busdetail.search(params[:search])
    else
      @busdetails = Busdetail.all
    end
  end


  # def search
  #   if params[:search].blank?
  #     redirect_to busdetails_path
  #   else
  #     @value = params[:search]
  #     @results = Busdetail.all.where("bus_name LIKE :search",search: "%#{@value}%")
  #   end
  # end

  # GET /busdetails/1 or /busdetails/1.json
  def show
  end

  # GET /busdetails/new
  def new
    @busdetail = Busdetail.new
  end

  # GET /busdetails/1/edit
  def edit
  end

  # POST /busdetails or /busdetails.json
  def create
    @busdetail = Busdetail.new(busdetail_params)
    @busdetail.user = current_user
    respond_to do |format|
      if @busdetail.save
        format.html { redirect_to busdetail_url(@busdetail), notice: "Busdetail was successfully created." }
        format.json { render :show, status: :created, location: @busdetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @busdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busdetails/1 or /busdetails/1.json
  def update
    respond_to do |format|
      if @busdetail.update(busdetail_params)
        format.html { redirect_to busdetail_url(@busdetail), notice: "Busdetail was successfully updated." }
        format.json { render :show, status: :ok, location: @busdetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @busdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busdetails/1 or /busdetails/1.json
  def destroy
    @busdetail.destroy

    respond_to do |format|
      format.html { redirect_to busdetails_url, notice: "Busdetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busdetail
      @busdetail = Busdetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def busdetail_params
      params.require(:busdetail).permit(:bus_name, :bus_no, :total_seats, :available_seats, :start_time, :end_time,:route_id)
    end
end
