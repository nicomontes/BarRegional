class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]

  # GET /drinks
  # GET /drinks.json
  def index
    @drinks = Drink.all
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
  end

  # GET /drinks/new
  def new
    @drink = Drink.new
  end

  # GET /drinks/1/edit
  def edit
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @drink = Drink.new(drink_params)
    if params[:admin_password] == ENV["ADMIN_PASSWORD"]
      respond_to do |format|
        if @drink.save
          format.html { redirect_to Drink, notice: 'La boisson a bien été créée' }
          format.json { render :show, status: :created, location: @drink }
        else
          format.html { render :new }
          format.json { render json: @drink.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_back fallback_location:  ""
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    if params[:admin_password] == ENV["ADMIN_PASSWORD"]
      if params[:drk][:delete] == "yes"
        @drink.destroy
        respond_to do |format|
          format.html { redirect_to Drink, notice: "La boisson a été supprimé." }
        end
      else
        respond_to do |format|
          if @drink.update(drink_params)
            format.html { redirect_to Drink, notice: 'La boisson a bien été modifiée' }
            format.json { render :show, status: :ok, location: @drink }
          else
            format.html { render :edit }
            format.json { render json: @drink.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      redirect_back fallback_location:  ""
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    if params[:admin_password] == ENV["ADMIN_PASSWORD"]
      @drink.destroy
      respond_to do |format|
        format.html { redirect_to Drink, notice: 'La boisson a bien été supprimée' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :drink_type, :price)
    end
end
