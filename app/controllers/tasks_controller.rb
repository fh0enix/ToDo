class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])
  
    render json: { message: "Успіх!" }
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Завдання створено!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
