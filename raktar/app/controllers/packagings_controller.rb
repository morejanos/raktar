class PackagingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @packagings = Packaging.all
  end

  # GET /packagings/1
  # GET /packagings/1.json
  def show
  end

  # GET /packagings/new
  def new
  end

  # GET /packagings/1/edit
  def edit
  end

  # POST /packagings
  # POST /packagings.json
  def create

    respond_to do |format|
      if @packaging.save
        format.html { redirect_to packagings_path, notice: "Tokozás sikeresen el lett mentve: #{@packaging.name}" }
        format.json { render :show, status: :created, location: @packaging }
      else
        format.html { render :new }
        format.json { render json: @packaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packagings/1
  # PATCH/PUT /packagings/1.json
  def update
    respond_to do |format|
      if @packaging.update(packaging_params)
        format.html { redirect_to packagings_path, notice: "Tokozás sikeresen frissítve lett: #{@packaging.name}" }
        format.json { render :show, status: :ok, location: @packaging }
      else
        format.html { render :edit }
        format.json { render json: @packaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packagings/1
  # DELETE /packagings/1.json
  def destroy
    @packaging.destroy
    respond_to do |format|
      format.html { redirect_to packagings_url, notice: 'Tokozás sikeresen törölve lett.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def packaging_params
      params.require(:packaging).permit(:name)
    end
end
