class PermissionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @permissions = Permission.all
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    if @permission.users.length == 0
      @assosciated_users = "Senki"
    else
      @assosciated_users = @permission.users.map(&:name).join(", ")
    end
  end

  # GET /permissions/new
  def new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  # POST /permissions.json
  def create

    respond_to do |format|
      if @permission.save
        format.html { redirect_to @permission, notice: 'Jogosultság sikeresen elkészült.' }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to @permission, notice: 'Jogosultság sikeresen frissült.' }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'Jogosultság sikeresen törölve lett.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:name)
    end
end
