class SalesController < ApplicationController
  load_and_authorize_resource
  before_action :set_sale, only: [:show, :new_adress, :create_adress, :edit, :edit_step_2, :edit_step_3, :update, :update_step_2, :update_step_3, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    
    ##### INDEX DATA #######

    pre_sales = Sale.all.order(sale_datetime: :desc)
    paid_sales = [false,true]
    @sales = paid_sales.map {|val| [val,pre_sales.where(paid: val)]}
    
    ##### INDEX DASHBOARD ########

    # -------------- Sales, costs and earnings ($)---------------

    dateformat = "%b%y"
    @salesdata = Sale.group_by_month(:sale_datetime, format:dateformat).sum(:total_amount)
    @costsdata = Cost.group_by_month(:cost_datetime, format:dateformat).sum(:value)
    months = (@salesdata.keys + @costsdata.keys).uniq
    @e = Hash.new
    months.each do |m|
      if @salesdata[m] == nil
        @e[m] = -@costsdata[m]
      elsif @costsdata[m] == nil
        @e[m] = @salesdata[m]
      else
        @e[m] = @salesdata[m]-@costsdata[m]
      end
    end

    @e.inject(0) do |sum,(date,total)|
      @e[date]=sum+total
    end

    # -------------- Sales (q) ---------------

    @salesq = Sale.group_by_month(:sale_datetime, format:dateformat).count(:id)

    # -------------- products (q) ---------------

    phash = Hash.new
    Product.where(deleted:false).each do |p|
      phash[p.name] = ShoppingCart.where(product_id: p.id).joins(:sale).group_by_month(:sale_datetime, format:dateformat).sum(:product_q)
    end

    @pdata = []
    phash.each do |k,v|
			@pdata << {name: k, data: v}
    end
    
    @pdata.sort_by {|p| p[:name]}


  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    puts 'action: new_adress' 
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @sale.client = Client.find(params[:client]) unless params[:client].nil?
  end

  # GET /sales/1/new_adress
  def new_adress
    @client = @sale.client
    @adress = @client.adresses.new
    render 'adresses/new'
  end

   def new_client
    @client = Client.new
    render 'clients/new'
  end

  # GET /sales/1/edit
  def edit
  end

  # GET /sales/1/edit_step_2
  def edit_step_2
    render :edit
  end

  def edit_step_3
    respond_to do |format|
      if @sale.paid?
          format.html { redirect_to sales_path, notice: t(".already_paid") }
      else
          format.html {render :edit}
      end
    end
  end
  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save 
        format.html { redirect_to sale_shopping_carts_path(@sale), notice: t(".success") }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /sales
  # POST /sales.json
  def create_adress
    @client = @sale.client
    @adress = @client.adresses.new(adress_params)

    respond_to do |format|
      if @adress.save
        format.html { redirect_to new_sale_delivery_path(@sale, adress: @adress), notice: t(".adress_created") }
        format.json { render :show, status: :created, location: @adress }
      else
        format.html { render 'adresses/new' }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_client
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to new_sale_path(client: @client) , notice: t(".client_created") }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render 'clients/new', alert: t(".problem") }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params) 
        format.html { redirect_to sales_path, notice: t(".success") }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json

  def update_step_2
    @sale.delivery_type_id = sale_params[:delivery_type_id]
    respond_to do |format|
      if @sale.save context: :step_2
        ## if sale requires delivery, then render deliveries path. O/W, render sales path as sale finished
        if !(@sale.delivery_type.blank?) && @sale.delivery_type.requires_delivery? 
          format.html { redirect_to new_sale_delivery_path(@sale), notice: t(".delivery") }
          format.json { render :show, status: :ok, location: @sale }
        else
          format.html { redirect_to sales_path, notice: t(".order_finished") }
          format.json { render :show, status: :ok, location: @sale }
        end
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json

  def update_step_3
    @sale.payment_type_id = sale_params[:payment_type_id]
    respond_to do |format|
      if @sale.save context: :step_3
        ## comments
        @sale.update(paid: true)
        format.html { redirect_to sales_path, notice: t(".paid") }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: t(".success") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:sale_datetime, :client_id,:total_amount ,:paid, :payment_type_id, :delivery_type_id)
    end

    def adress_params
      params.require(:adress).permit(:street, :str_number, :adr_unit, :adr_other, :adr_zip, :adr_county, :adr_state, :adr_country)
    end

    def client_params
      params.require(:client).permit(:email,:email_confirmation, :first_name, :middle_name, :last_name, :phone_countrycode, :phone_number, :birthdate, :sex)
    end
end
