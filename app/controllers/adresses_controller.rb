class AdressesController < ApplicationController
  before_action :get_parent
  before_action :set_adress, only: [:show, :edit, :update, :destroy]
  before_action :puts_parent
  before_action :puts_adress, only: [:show, :edit, :update, :destroy]

  # GET /adresses
  # GET /adresses.json
  def index
    if @parent.class.name == "Client"
      @adresses = @parent.adresses
    else
      @adresses = @parent.adress.nil? ? nil : [@parent.adress]
    end
  end

  # GET /adresses/1
  # GET /adresses/1.json
  def show
  end

  # GET /adresses/new
  def new
    if @parent.class.name == "Client"
      @adress = @parent.adresses.new
    else
      if @parent.adress.nil?
        @adress = Adress.new
        @adress.adressable = @parent
      else
        redirect_to polymorphic_path([@parent,Adress]), alert: 'Already has an adress' 
      end
    end
  end

  # GET /adresses/1/edit
  def edit
  end

  # POST /adresses
  # POST /adresses.json
  def create
    if @parent.class.name == "Client"
      @adress = @parent.adresses.new(adress_params)
    else
      if @parent.adress.nil?
        @adress = Adress.new(adress_params)
        @parent.adress = @adress
      else
        redirect_to polymorphic_path([@parent,Adress]), alert: 'Already has an adress' 
      end
    end

    respond_to do |format|
      if @adress.save
        format.html { redirect_to polymorphic_path([@parent, Adress]), notice: 'Adress was successfully created.' }
        format.json { render :show, status: :created, location: @adress }
      else
        format.html { render :new }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adresses/1
  # PATCH/PUT /adresses/1.json
  def update
    respond_to do |format|
      if @adress.update(adress_params)
        format.html { redirect_to polymorphic_path([@parent, Adress]), notice: 'Adress was successfully updated.' }
        format.json { render :show, status: :ok, location: @adress }
      else
        format.html { render :edit }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adresses/1
  # DELETE /adresses/1.json
  def destroy
    @adress.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path([@parent, Adress]), notice: 'Adress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
      if @parent.class.name == "Client"
        @adress = @parent.adresses.find(params[:id])
      else
        @adress = @parent.adress
      end
    end

    # Only allow a list of trusted parameters through.
    def adress_params
      params.require(:adress).permit(:street, :str_number, :adr_unit, :adr_other, :adr_zip, :adr_county, :adr_state, :adr_country)
    end

	  def get_parent
      if params[:client_id]
          @parent = Client.find(params[:client_id])
      else
          @parent = PointOfSale.find(params[:point_of_sale_id])
      end

    end
    
    def puts_parent
          puts "///////////////////////////\n 
          /////////////////////////////\n
          \n
          parent : #{@parent}\n
          pname : #{@parent.formatted_name(:compact)}\n
          \n
         ///////////////////////////\n 
          ////////////////////////////// "
    end
    def puts_adress
          puts "///////////////////////////\n 
          /////////////////////////////\n
          \n
          adress : #{@adress}\n
          aname : #{@adress.full_adress}\n

          \n
         ///////////////////////////\n 
          ////////////////////////////// "
    end

end
