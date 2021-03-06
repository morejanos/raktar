class ComponenttypesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

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
  end

  # GET /componenttypes/1/edit
  def edit
  end

  # POST /componenttypes
  # POST /componenttypes.json
  def create

    respond_to do |format|
      if @componenttype.save
        format.html { redirect_to componenttypes_path, notice: "Alkatrész típusa sikeresen létrejött:  #{@componenttype.name}" }
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
        format.html { redirect_to componenttypes_path, notice: "Alkatrész típusa sikeresen frissült: #{@componenttype.name}" }
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
      format.html { redirect_to componenttypes_url, notice: "Alkatrész típusa sikeresen törölve lett: #{@componenttype.name}" }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def componenttype_params
      params.require(:componenttype).permit(:name)
    end
end
