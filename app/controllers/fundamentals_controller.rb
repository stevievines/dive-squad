class FundamentalsController < ApplicationController
  before_action :set_fundamental, only: [:show, :edit, :update, :destroy]

  # GET /fundamentals
  # GET /fundamentals.json
  def index
    @fundamentals = Fundamental.all
  end

  # GET /fundamentals/1
  # GET /fundamentals/1.json
  def show
  end

  # GET /fundamentals/new
  def new
    @fundamental = Fundamental.new
  end

  # GET /fundamentals/1/edit
  def edit
  end

  # POST /fundamentals
  # POST /fundamentals.json
  def create
    @fundamental = Fundamental.new(fundamental_params)

    respond_to do |format|
      if @fundamental.save
        format.html { redirect_to @fundamental, notice: 'Fundamental was successfully created.' }
        format.json { render :show, status: :created, location: @fundamental }
      else
        format.html { render :new }
        format.json { render json: @fundamental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fundamentals/1
  # PATCH/PUT /fundamentals/1.json
  def update
    respond_to do |format|
      if @fundamental.update(fundamental_params)
        format.html { redirect_to @fundamental, notice: 'Fundamental was successfully updated.' }
        format.json { render :show, status: :ok, location: @fundamental }
      else
        format.html { render :edit }
        format.json { render json: @fundamental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fundamentals/1
  # DELETE /fundamentals/1.json
  def destroy
    @fundamental.destroy
    respond_to do |format|
      format.html { redirect_to fundamentals_url, notice: 'Fundamental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fundamental
      @fundamental = Fundamental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fundamental_params
      params.require(:fundamental).permit(:name)
    end
end
