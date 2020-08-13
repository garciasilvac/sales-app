class CostClassesController < ApplicationController
  load_and_authorize_resource
  before_action :set_cost_class, only: [:show, :edit, :update, :destroy]

  # GET /cost_classes
  # GET /cost_classes.json
  def index
    @cost_classes = CostClass.all
  end

  # GET /cost_classes/1
  # GET /cost_classes/1.json
  def show
  end

  # GET /cost_classes/new
  def new
    @cost_class = CostClass.new
  end

  # GET /cost_classes/1/edit
  def edit
  end

  # POST /cost_classes
  # POST /cost_classes.json
  def create
    @cost_class = CostClass.new(cost_class_params)

    respond_to do |format|
      if @cost_class.save
        format.html { redirect_to @cost_class, notice: 'Cost class was successfully created.' }
        format.json { render :show, status: :created, location: @cost_class }
      else
        format.html { render :new }
        format.json { render json: @cost_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_classes/1
  # PATCH/PUT /cost_classes/1.json
  def update
    respond_to do |format|
      if @cost_class.update(cost_class_params)
        format.html { redirect_to @cost_class, notice: 'Cost class was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost_class }
      else
        format.html { render :edit }
        format.json { render json: @cost_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_classes/1
  # DELETE /cost_classes/1.json
  def destroy
    @cost_class.destroy
    respond_to do |format|
      format.html { redirect_to cost_classes_url, notice: 'Cost class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost_class
      @cost_class = CostClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cost_class_params
      params.require(:cost_class).permit(:deleted, :name, :parent_id)
    end
end
