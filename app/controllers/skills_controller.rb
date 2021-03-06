class SkillsController < ApplicationController
  def index
    @references = Reference.all
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
    authorize @skill, :create?
  end

  def create
    @skill = Skill.new(skill_params)
    authorize @skill
    if @skill.save
      flash[:notice] = "Skill successfully added."
      redirect_to skills_path
    else
      flash[:alert] = "Unable to add skill, try again."
      redirect_to :back
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def edit
    @skill = Skill.find(params[:id])
    authorize @skill, :update?
  end

  def update
    @skill = Skill.find(params[:id])
    authorize @skill
    @skill.update(skill_params)
    flash[:notice] = "Skill successfully updated."
    redirect_to skill_path(@skill)
  end

  def destroy
    flash[:notice] = "Skill successfully deleted."
    skill = Skill.find(params[:id])
    authorize skill
    skill.destroy
    redirect_to skills_path
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
