class GoalsController < ApplicationController
before_filter :logged_in_user, only: [:show,:create, :edit]

def index
 @goals = current_user.goals
end


def new
 @goal = current_user.goals.build if logged_in?
end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:success] = "Your goal has been created!"
      redirect_to goals_url
    else
      render user_url
    end
  end
  
  private
  def goal_params
    params.require(:goal).permit(:name)
  end
end