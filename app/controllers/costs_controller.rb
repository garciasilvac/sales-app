class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :edit_paid, :update_paid, :destroy]
  require 'mini_magick'

  # GET /costs
  # GET /costs.json
  def index

    pre_costs = Cost.all.order(cost_datetime: :desc)
    paid_costs = [false,true]
    @costs = paid_costs.map {|val| [val,pre_costs.where(paid: val)]}
    
  end

  # GET /costs/1
  # GET /costs/1.json
  def show
  end

  # GET /costs/new
  def new
    @cost = Cost.new
  end

  # GET /costs/1/edit
  def edit
  end
  # GET /costs/1/edit
  def edit_paid
    render :edit
  end

  # POST /costs
  # POST /costs.json
  def create
    @cost = Cost.new(cost_params)

    respond_to do |format|
      if @cost.save
        if cost_params[:document_image] != nil
          comp_image = MiniMagick::Image.new(cost_params[:document_image].tempfile.path)
          comp_image.resize '150x150!'
        end
        format.html { redirect_to @cost, notice: 'Cost was successfully created.' }
        format.json { render :show, status: :created, location: @cost }
      else
        format.html { render :new }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    respond_to do |format|
      if @cost.update(cost_params)
        if cost_params[:document_image] != nil && (cost_params[:document_image] != Cost.find(@cost.id).document_image)
          comp_image = MiniMagick::Image.new(cost_params[:document_image].tempfile.path)
          comp_image.resize '150x150!'
        end
        format.html { redirect_to @cost, notice: 'Cost was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost }
      else
        format.html { render :edit }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_paid
    respond_to do |format|
      if @cost.update(cost_params)
        @cost.update(paid: true)
        if cost_params[:document_image] != nil && (cost_params[:document_image] != Cost.find(@cost.id).document_image)
          comp_image = MiniMagick::Image.new(cost_params[:document_image].tempfile.path)
          comp_image.resize '150x150!'
        end
        format.html { redirect_to @cost, notice: 'Cost was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost }
      else
        format.html { render :edit }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost.destroy
    respond_to do |format|
      format.html { redirect_to costs_url, notice: 'Cost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cost_params
      params.require(:cost).permit(:deleted, :name, :value, :document_id,:document_image, :cost_datetime, :cost_class_id,:paid)
    end
end
