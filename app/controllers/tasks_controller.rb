class TasksController < ApplicationController
 before_filter :logged_in_user, only: [:show,:create, :edit]
 
def new
 @goal = Goal.find(params[:goal_id])
 @task = @goal.tasks.build if logged_in?
end

  def create
    @goal = Goal.find(params[:goal_id])
    @task = @goal.tasks.build(task_params)
    if @task.save
      flash[:success] = "You task has been added"
      redirect_to goals_url
    else
      render goals_url
    end
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :frequency, :completion_status)
  end
end