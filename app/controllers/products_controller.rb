class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  require 'mini_magick'
  

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        if product_params[:product_image] != nil
          comp_image = MiniMagick::Image.new(product_params[:product_image].tempfile.path)
          comp_image.resize '150x150!'
        end 
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if product_params[:product_image] != nil && (product_params[:product_image] != Product.find(@product.id).product_image)
          comp_image = MiniMagick::Image.new(product_params[:product_image].tempfile.path)
          comp_image.resize '150x150!'
        end
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def get_subtype_name
  	get_subtype.name
  end
    def get_type_name
  	get_type.name
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :subtype_id, :price, :product_image)
    end
    def get_subtype
      @subtype = Subtype.find(params[:subtype_id])
    end
	def get_type
      @type = Type.find(params[get_subtype.type_id])
    end
end
