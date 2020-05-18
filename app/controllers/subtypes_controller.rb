class SubtypesController < ApplicationController
  before_action :get_type, :sort_by_full_subtype
  before_action :set_subtype, only: [:show, :edit, :update, :destroy]

  # GET /subtypes
  # GET /subtypes.json
  def index
    @subtypes = @type.subtypes
  end

  # GET /subtypes/1
  # GET /subtypes/1.json
  def show
  end

  # GET /subtypes/new
  def new
    @subtype = @type.subtypes.new
  end

  # GET /subtypes/1/edit
  def edit
  end

  # POST /subtypes
  # POST /subtypes.json
  def create
    @subtype = @type.subtypes.new(subtype_params)

    respond_to do |format|
      if @subtype.save
        format.html { redirect_to type_subtypes_path(@type), notice: 'Subtype was successfully created.' }
        format.json { render :show, status: :created, location: @subtype }
      else
        format.html { render :new }
        format.json { render json: @subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtypes/1
  # PATCH/PUT /subtypes/1.json
  def update
    respond_to do |format|
      if @subtype.update(subtype_params)
        format.html { redirect_to type_subtypes_path(@type), notice: 'Subtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @subtype }
      else
        format.html { render :edit }
        format.json { render json: @subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtypes/1
  # DELETE /subtypes/1.json
  def destroy
    @subtype.destroy
    respond_to do |format|
      format.html { redirect_to type_subtypes_path(@type), notice: 'Subtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtype
      @subtype = @type.subtypes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subtype_params
      params.require(:subtype).permit(:name)
    end
	  def get_type
      @type = Type.find(params[:type_id])
    end

    def sort_by_full_subtype
      @sorted_st = Subtype.all.sort_by {|st| [st.type.name, st.name]}
    end
end
