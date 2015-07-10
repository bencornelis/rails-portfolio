class ProjectsController < ApplicationController
  def new
    @skill   = Skill.find(params[:skill_id])
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
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

  def edit
    @skill   = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    authorize @project, :update?
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated."
      redirect_to skill_project_path(@project.skill, @project)
    else
      flash[:alert] = "Unable to update project, try again."
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Project successfully deleted."
    Project.find(params[:id]).destroy
    redirect_to(Skill.find(params[:skill_id]))
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :github_url)
  end
end
