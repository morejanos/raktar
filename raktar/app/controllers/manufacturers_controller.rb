class ManufacturersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

    def index
        @manufacturers = Manufacturer.all
    end

    def show
    end

    def new
        @manufacturer = Manufacturer.new
    end

    def create
        @manufacturer = Manufacturer.new(manufacturer_params)

        respond_to do |format|
            if @manufacturer.save
                format.html { redirect_to @manufacturer, notice: 'Gyártó sikeresen el lett mentve.' }
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
                format.html { redirect_to @manufacturer, notice: 'Gyártó sikeresen frissítve lett.' }
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
    def set_manufacturer
        @manufacturer = Manufacturer.find(params[:id])
    end

    def manufacturer_params
        params.require(:manufacturer).permit(:name, :contactPerson, :address, :email, :phone)
    end
end

