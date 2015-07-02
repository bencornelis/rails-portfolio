class ProjectsController < ApplicationController
  def new
    @skill   = Skill.find(params[:skill_id])
    @project = Project.new
  end

  def create
    @skill   = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added."
      redirect_to skill_path(@skill)
    else
      flash[:alert] = "Unable to add project, try again."
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :github_url)
  end
end
