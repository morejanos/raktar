class ComponentsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource

  def kivet
    if !params[:kivet].nil? then
      if params[:kivet].to_i > 0 then

        @component = Component.find(params[:id])

        if @component.inventory < params[:kivet].to_i then
          redirect_to :back, alert: 'Nem lehet kivenni több alkatrészt, mint amennyi a raktárban van'
          return
        end

        @component.inventory -= params[:kivet].to_i

        if @component.inventory <= @component.criticalNrOfPieces then
            if @component.status != Status.find(1) then
                @component.status = Status.find(1)
            end
        end

        respond_to do |format|
          if @component.save
            logger.info "Kivet happend by #{current_user} on item #{@component.name} in #{params[:kivet]} pieces. New number of pieces is #{@component.inventory}."

            if (!@component.criticalNrOfPieces.nil? && @component.criticalNrOfPieces != 0) then

                if @component.status == Status.find(1) then
                    Usermailer.criticalNrOfPieces_email(@component).deliver
                end

                format.html { redirect_to :back, notice: "#{params[:kivet]} db: #{@component.name} alkatrész sikeresen kivételezésre került."  }
            else
                format.html { redirect_to :back, notice: "#{params[:kivet]} db: #{@component.name} alkatrész sikeresen kivételezésre került.", alert: "Ennek az alkatrésznek hiányzik a rendeléshez szükséges darabszáma!!"  }
                format.json { render :show, status: :created, location: @component }
            end

          else
            format.html { redirect_to @component, alert: 'Hiba lépett fel a mentés közben.' }
            format.json { render json: @component.errors, status: :unprocessable_entity }
          end
        end
      else
            flash[:alert] = "Alkatrész sikertelen kivétele: #{@component.name}"
      end
    end
  end

  def purchase
    if !params[:status_id].nil? then
      if params[:status_id] == 1 then

        @component = Component.find(params[:id])

        @component.status = 2

        respond_to do |format|
          if @component.save
            logger.info "#{@component.name} alkatrész megrendelésre került."

            format.html { redirect_to :back, notice: "#{@component.name} alkatrész megrendelésre került." }
            format.json { render :show, status: :created, location: @component }

          else
            format.html { redirect_to @component, alert: 'Hiba lépett fel a mentés közben.' }
            format.json { render json: @component.errors, status: :unprocessable_entity }
          end
        end
      else
            flash[:alert] = "Alkatrész megrendelése sikertelen: #{@component.name}"
      end
    end
  end

  def purchases
    params[:search].strip! if params[:search].class == String

    update_search_session(params[:search])

#    @components = Component.search(session[:search], session[:status]).order(sort_column + " " + sort_direction)
    if params[:status].nil? then
        @components = Component.status(1)
        session[:status] = Component.status(1)
    else
        @components = Component.status(params[:status][:id])
        session[:status] = params[:status][:id]
    end

  end

  # GET /components
  # GET /components.json
  def index
    params[:search].strip! if params[:search].class == String

    update_search_session(params[:search])

    update_componenttype_session(params[:componenttype])

    if ((session[:search].nil? || session[:search] == "") && (session[:componenttype].nil? || session[:componenttype] == "" )) then
        @components = Component.last(5)
    else
        @components = Component.search(session[:search], session[:componenttype]).order(sort_column + " " + sort_direction)
    end
 
    respond_to do |format|
        format.html
        format.csv { send_data @components.to_csv }
        format.xls
    end
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

    if @component.status.nil? then
	@component.status = Status.find(3) # nincs megrendelési igény beállítása
    end

    respond_to do |format|
      if @component.save
        format.html { redirect_to components_path, notice: "Alkatrész sikeresen elkészült: #{@component.name}" }
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

    if @component.status.nil? then
	@component.status = Status.find(3) # nincs megrendelési igény beállítása
    end

    respond_to do |format|
      if @component.update(component_params)
        Usermailer.criticalNrOfPieces_email(@component).deliver if @component.inventory <= @component.criticalNrOfPieces 
        format.html { redirect_to components_path, notice: "Alkatrész sikeresen frissült: #{@component.name}" }
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
      params.require(:component).permit(:name, :partnumber, :image, :inductivity, :inventory, :power, :voltage, :current, :resistance, :dimension, :temperature, :capacity, :location, :comment, :criticalNrOfPieces, :packaging_id, :user_id, :componenttype_id, :manufacturer_id, :status_id)
    end

    def update_search_session(search)
      if session[:search].nil? && !search.nil? && !search.empty? then
        session[:search] = search
      elsif session[:search].nil? && !search.nil? then
        session[:search] = search
      elsif !search.nil? && session[:search] != search then
        session[:search] = search
      else
        session[:search] ||= ""
      end
    end
    
    def update_componenttype_session(componenttype)
      if session[:componenttype].nil? && !componenttype.nil? then
          session[:componenttype] = componenttype[:id]
      elsif session[:componenttype].nil? || componenttype.nil? then
          session[:componenttype] ||= ""
      elsif session[:componenttype] != componenttype[:id] then
          session[:componenttype] = componenttype[:id]
      end
    end

  def sort_column
    Component.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end  
end
