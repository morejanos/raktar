class ComponentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /components
  # GET /components.json
  def index
    update_search_session(params[:search])
    update_componenttype_session(params[:componenttype])
    
    @components = Component.search(session[:search], session[:componenttype])
  end

  # GET /components/1
  # GET /components/1.json
  def show
  end

  # GET /components/new
  def new
  end

  # GET /components/1/edit
  def edit
  end

  # POST /components
  # POST /components.json
  def create
    @component.user_id = current_user.id

    respond_to do |format|
      if @component.save
        format.html { redirect_to @component, notice: 'Alkatrész sikeresen elkészült.' }
        format.json { render :show, status: :created, location: @component }
      else
        format.html { render :new }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components/1
  # PATCH/PUT /components/1.json
  def update
    @component.user_id = current_user.id
    respond_to do |format|
      if @component.update(component_params)
        Usermailer.criticalNrOfPieces_email(@component).deliver if @component.inventory <= @component.criticalNrOfPieces 
        format.html { redirect_to @component, notice: 'Alkatrész sikeresen frissült.' }
        format.json { render :show, status: :ok, location: @component }
      else
        format.html { render :edit }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component.destroy
    respond_to do |format|
      format.html { redirect_to components_url, notice: 'Alkatrész sikeresen törölve lett.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:component).permit(:name, :partnumber, :inventory, :power, :voltage, :current, :resistance, :dimension, :temperature, :capacity, :location, :comment, :comment, :criticalNrOfPieces, :packaging_id, :user_id, :componenttype_id, :manufacturer_id)
    end

    def update_search_session(search)
      if session[:search].nil? && !search.empty? then
        session[:search] = search
      elsif session[:search].nil? then
        session[:search] = search
      elsif session[:search] != search then
        session[:search] = search
      end
    end
    
    def update_componenttype_session(componenttype)
      if session[:componenttype].nil? && !componenttype.nil? then
        session[:componenttype] = componenttype
      elsif session[:componenttype].nil? || componenttype.nil? then
        session[:componenttype] = ""
      elsif session[:componenttype] != componenttype then
        session[:componenttype] = componenttype
      end
    end

end
