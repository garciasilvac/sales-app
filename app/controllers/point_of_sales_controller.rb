class PointOfSalesController < ApplicationController
  before_action :set_point_of_sale, only: [:show, :edit, :update, :destroy]

  # GET /point_of_sales
  # GET /point_of_sales.json
  def index
    @point_of_sales = PointOfSale.all
  end

  # GET /point_of_sales/1
  # GET /point_of_sales/1.json
  def show
  end

  # GET /point_of_sales/new
  def new
    @point_of_sale = PointOfSale.new
  end

  # GET /point_of_sales/1/edit
  def edit
  end

  # POST /point_of_sales
  # POST /point_of_sales.json
  def create
    @point_of_sale = PointOfSale.new(point_of_sale_params)

    respond_to do |format|
      if @point_of_sale.save
        format.html { redirect_to point_of_sales_url, notice: 'Point of sale was successfully created.' }
        format.json { render :show, status: :created, location: @point_of_sale }
      else
        format.html { render :new }
        format.json { render json: @point_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_of_sales/1
  # PATCH/PUT /point_of_sales/1.json
  def update
    respond_to do |format|
      if @point_of_sale.update(point_of_sale_params)
        format.html { redirect_to point_of_sales_url, notice: 'Point of sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_of_sale }
      else
        format.html { render :edit }
        format.json { render json: @point_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_of_sales/1
  # DELETE /point_of_sales/1.json
  def destroy
    @point_of_sale.destroy
    respond_to do |format|
      format.html { redirect_to point_of_sales_url, notice: 'Point of sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_of_sale
      @point_of_sale = PointOfSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_of_sale_params
      params.require(:point_of_sale).permit(:name,:timezone, adresses_attributes: [:id, :street, :str_number, :adr_unit, :adr_other, :adr_zip, :adr_county, :adr_state, :adr_country, :_destroy])
    end
end
