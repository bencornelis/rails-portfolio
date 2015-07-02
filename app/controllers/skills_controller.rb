class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = "Skill successfully added."
      redirect_to skills_path
    else
      flash[:alert] = "Unable to add skill, try again."
      render :new
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
