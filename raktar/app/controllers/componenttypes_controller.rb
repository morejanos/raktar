class ComponenttypesController < ApplicationController
  before_action :set_componenttype, only: [:show, :edit, :update, :destroy]

  # GET /componenttypes
  # GET /componenttypes.json
  def index
    @componenttypes = Componenttype.all
  end

  # GET /componenttypes/1
  # GET /componenttypes/1.json
  def show
  end

  # GET /componenttypes/new
  def new
    @componenttype = Componenttype.new
  end

  # GET /componenttypes/1/edit
  def edit
  end

  # POST /componenttypes
  # POST /componenttypes.json
  def create
    @componenttype = Componenttype.new(componenttype_params)

    respond_to do |format|
      if @componenttype.save
        format.html { redirect_to @componenttype, notice: 'Alkatrész típusa sikeresen elkészült.' }
        format.json { render :show, status: :created, location: @componenttype }
      else
        format.html { render :new }
        format.json { render json: @componenttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /componenttypes/1
  # PATCH/PUT /componenttypes/1.json
  def update
    respond_to do |format|
      if @componenttype.update(componenttype_params)
        format.html { redirect_to @componenttype, notice: 'Alkatrész típusa sikeresen frissült.' }
        format.json { render :show, status: :ok, location: @componenttype }
      else
        format.html { render :edit }
        format.json { render json: @componenttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /componenttypes/1
  # DELETE /componenttypes/1.json
  def destroy
    @componenttype.destroy
    respond_to do |format|
      format.html { redirect_to componenttypes_url, notice: 'Alkatrész típusa sikeresen törölve lett.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_componenttype
      @componenttype = Componenttype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def componenttype_params
      params.require(:componenttype).permit(:name)
    end
end
