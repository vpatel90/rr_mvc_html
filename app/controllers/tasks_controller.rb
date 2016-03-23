class TasksController < ApplicationController
  def index
    @all_tasks = get_all_tasks
    render_template 'all_tasks.html.erb'
  end

  def show
    @task = get_task_at_id
    return render({message:"404"}.to_json, status:"404, User Not Found") if @task.nil?
    render_template 'task.html.erb'
  end

  def create
    return render({message:"400"}.to_json, status:"400, Bad Request") if params["body"].nil?
    get_all_tasks << Task.new(TaskSetUp.new_id, params["body"])
    index
  end

  def update

  end

  def destroy

  end

  private

  def get_all_tasks
    TaskSetUp.all_tasks
  end

  def get_task_at_id
    get_all_tasks.find { |tsk| tsk.id == params[:id].to_i }
  end

end
