class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy]

  # GET /operations
  # GET /operations.json
  def index
    @operations = Operation.all
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @drink = Drink.all
    @operation = Operation.new
    @operation.user_id=params[:userid]
  end

  # GET /operations/add
  def add
    @operation = Operation.new
    @operation.user_id=params[:userid]
  end

  # GET /operations/1/edit
  def edit
    @userid = params[:userid]
  end

  # POST /operations
  # POST /operations.json
  def create
    if User.find(operation_params[:user_id]).password_digest == params[:password]
      if params[:post]
        drink_id = params[:post][:drink]
        drink_price = Drink.find(drink_id).price.to_f
        sum = 0 - operation_params[:sum].to_f * drink_price
      else
        sum = operation_params[:sum].to_f
      end
      @operation = Operation.new(operation_params.merge(sum: sum))
      respond_to do |format|
        if @operation.save
          format.html { redirect_to controller: 'users'}
          format.json { render :show, status: :created, location: @operation }
        else
          format.html { render :new }
          format.json { render json: @operation.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :back
    end
  end

  # PATCH/PUT /operations/1
  # PATCH/PUT /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to @operation, notice: 'Operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation.destroy
    respond_to do |format|
      format.html { redirect_to operations_url, notice: 'Operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operation_params
      params.require(:operation).permit(:date, :sum, :user_id)
    end
end
