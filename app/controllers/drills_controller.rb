class DrillsController < ApplicationController
  before_action :set_drill, only: [:show, :edit, :update, :destroy]
  before_action :set_skill

  # GET /drills
  # GET /drills.json
  def index
    @drills = @skill.drills
  end

  # GET /drills/1
  # GET /drills/1.json
  def show
  end

  # GET /drills/new
  def new
    @drill = @skill.drills.new
  end

  # POST /drills
  # POST /drills.json
  def create
    @drill = Drill.new(drill_params)

    respond_to do |format|
      if @drill.save
        format.html { redirect_to @drill, success: 'Drill was successfully created.' }
        format.json { render :show, status: :created, location: @drill }
      else
        format.html { render :new }
        format.json { render json: @drill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drills/1
  # DELETE /drills/1.json
  def destroy
    @drill.destroy
    respond_to do |format|
      format.html { redirect_to drills_url, success: 'Drill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drill
      @drill = @skill.drills.find(params[:id])
    end

    def set_skill
      @skill = Skill.find(params[:skill_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drill_params
      params.require(:drill).permit(:name, :progression, :skill_id)
    end
end
