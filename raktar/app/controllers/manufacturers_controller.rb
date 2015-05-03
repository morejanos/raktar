class ManufacturersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

    def index
        @manufacturers = Manufacturer.all
    end

    def show
    end

    def new
    end

    def create

        respond_to do |format|
            if @manufacturer.save
                format.html { redirect_to manufacturers_path, notice: "Gyártó sikeresen frissült: #{@manufacturer.name}" }
                format.json { render :show, status: :created, location: @manufacturer }
            else
                format.html { render :new }
                format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
            end
        end
    end 


    def update
        respond_to do |format|
            if @manufacturer.update(manufacturer_params)
                format.html { redirect_to manufacturers_path, notice: "Gyártó sikeresen frissült: #{@manufacturer.name}" }
                format.json { render :show, status: :ok, location: @manufacturer }
            else
                format.html { render :edit }
                format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def destroy
        @manufacturer.destroy
        respond_to do |format|
            format.html { redirect_to manufacturers_url, notice: 'Gyártó sikeresen le lett törölve.' }
            format.json { head :no_content }
        end
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name, :contactPerson, :address, :email, :phone)
    end
end

