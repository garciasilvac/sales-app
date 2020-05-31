class TimeblocksController < ApplicationController
  before_action :set_timeblock, only: [:show, :edit, :update, :destroy]

  # GET /timeblocks
  # GET /timeblocks.json
  def index
    @timeblocks = Timeblock.all
  end

  # GET /timeblocks/1
  # GET /timeblocks/1.json
  def show
  end

  # GET /timeblocks/new
  def new
    @timeblock = Timeblock.new
  end

  # GET /timeblocks/1/edit
  def edit
  end

  # POST /timeblocks
  # POST /timeblocks.json
  def create
    @timeblock = Timeblock.new(timeblock_params)

    respond_to do |format|
      if @timeblock.save
        format.html { redirect_to @timeblock, notice: 'Timeblock was successfully created.' }
        format.json { render :show, status: :created, location: @timeblock }
      else
        format.html { render :new }
        format.json { render json: @timeblock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeblocks/1
  # PATCH/PUT /timeblocks/1.json
  def update
    respond_to do |format|
      if @timeblock.update(timeblock_params)
        format.html { redirect_to @timeblock, notice: 'Timeblock was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeblock }
      else
        format.html { render :edit }
        format.json { render json: @timeblock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeblocks/1
  # DELETE /timeblocks/1.json
  def destroy
    @timeblock.destroy
    respond_to do |format|
      format.html { redirect_to timeblocks_url, notice: 'Timeblock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeblock
      @timeblock = Timeblock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timeblock_params
      params.require(:timeblock).permit(:name, :start_time, :end_time)
    end
end
