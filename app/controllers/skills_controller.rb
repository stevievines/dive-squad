class SkillsController < ApplicationController
  before_action :set_fundamental
  before_action :set_skill, only: [:show, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = @fundamental.skills
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = @fundamental.skills.new
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = @fundamental.skills.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to [@fundamental, @skill], success: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to fundamental_skills_url(@fundamental), success: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = @fundamental.skills.find(params[:id])
    end

    def set_fundamental
      @fundamental = Fundamental.find(params[:fundamental_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name, :fundamental_id, drills_attributes: [:name, :progression])
    end
end
