class DeliveriesController < ApplicationController
  before_action :get_sale, except: :driver_index
  before_action :set_delivery, only: [:show, :edit, :edit_step_2, :update, :update_step_2, :destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    pre_deliveries = @sale.deliveries.order(sched_date: :desc)
    dates = pre_deliveries.select(:sched_date).distinct.order(:sched_date).map {|d| d.sched_date}
    @deliveries = dates.map {|date| [date,pre_deliveries.where(sched_date: date)]}
  end

  # GET /deliveries
  # GET /deliveries.json
  def driver_index
    pre_deliveries = Delivery.where({ delivered: [false,nil] }).order(sched_date: :asc)
    dates = pre_deliveries.select(:sched_date).distinct.order(:sched_date).map {|d| d.sched_date}
    @deliveries = dates.map {|date| [date,pre_deliveries.where(sched_date: date)]}

    render :index
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
  end

  # GET /deliveries/new
  def new
    @delivery = @sale.deliveries.new
  end

  # GET /deliveries/1/edit
  def edit
  end

  # GET /deliveries/1/edit_step_2
  def edit_step_2
    @delivery.real_date = DateTime.now
    render :edit
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = @sale.deliveries.new(delivery_params)

    respond_to do |format|
      if @delivery.save
        @sale.update(total_amount: @sale.total_amount + @delivery.price)
        format.html { redirect_to sales_path, notice: 'Delivery was successfully created.' }
        format.json { render :show, status: :created, location: @delivery }
      else
        format.html { render :new }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    old_price = @delivery.price
    respond_to do |format|
      if @delivery.update(delivery_params)
        @sale.update(total_amount: @sale.total_amount - old_price + @delivery.price)
        format.html { redirect_to sale_deliveries_path(@sale), notice: 'Delivery was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery }
      else
        format.html { render :edit }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_step_2
    respond_to do |format|
      if @delivery.update(delivery_params)
        @delivery.update(delivered: true)
        format.html { redirect_to driver_index_path, notice: 'Delivery was successfully executed' }
        format.json { render :show, status: :ok, location: @delivery }
      else
        format.html { render :edit }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @sale.update(total_amount: @sale.total_amount - @delivery.price)
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to sale_deliveries_path(@sale), notice: 'Delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delivery_params
      params.require(:delivery).permit(:sale_id, :sched_date, :sched_timeblock, :delivered, :real_date, :real_timeblock, :successful, :driver_comment, :adress_id, :price)
    end

    def get_sale
      @sale = Sale.find(params[:sale_id])
    end
end
