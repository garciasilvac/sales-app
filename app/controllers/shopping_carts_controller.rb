class ShoppingCartsController < ApplicationController
  load_and_authorize_resource
  before_action :get_sale
  before_action :set_shopping_cart, only: [:show, :edit, :update, :destroy]

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    @shopping_carts = @sale.shopping_carts
  end

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  def show
  end

  # GET /shopping_carts/new
  def new
    @shopping_cart = @sale.shopping_carts.new
  end

  # GET /shopping_carts/1/edit
  def edit
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = @sale.shopping_carts.new(shopping_cart_params)

    respond_to do |format|
      if @shopping_cart.save
        @shopping_cart.update(subtotal:(@shopping_cart.product_q * @shopping_cart.product.price * (1 - (@shopping_cart.discount/100))).round) 
        @sale.update(total_amount: @sale.total_amount + @shopping_cart.subtotal)
        format.html { redirect_to sale_shopping_carts_path(@sale), notice: t(".success" , total: view_context.number_to_currency(@sale.shopping_carts.sum(:subtotal)))}
        format.json { render :show, status: :created, location: @shopping_cart }
      else
        format.html { render :new }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_carts/1
  # PATCH/PUT /shopping_carts/1.json
  def update
    respond_to do |format|
      if @shopping_cart.update(shopping_cart_params)
        old_subtotal = @shopping_cart.subtotal
        @shopping_cart.update(subtotal: (@shopping_cart.product_q * Product.find(@shopping_cart.product_id).price * (1 - (@shopping_cart.discount/100))).round)
        @sale.update(total_amount: @sale.total_amount - old_subtotal + @shopping_cart.subtotal)
        format.html { redirect_to sale_shopping_carts_path(@sale), notice: t(".success" , total: view_context.number_to_currency(@sale.shopping_carts.sum(:subtotal)))}
        format.json { render :show, status: :ok, location: @shopping_cart }
      else
        format.html { render :edit }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    @sale.update(total_amount: @sale.total_amount - @shopping_cart.subtotal)
    @shopping_cart.destroy
    respond_to do |format|
      format.html { redirect_to sale_shopping_carts_path(@sale), notice: t(".success") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_cart_params
      params.require(:shopping_cart).permit(:sale_id, :product_id, :product_q, :discount)
    end

    def get_sale
      @sale = Sale.find(params[:sale_id])
    end
end
