class TasksController < ApplicationController
  def index
    @all_tasks = get_all_tasks
    return render @all_tasks.to_json if @request[:format] == "json"
    render_template 'all_tasks.html.erb'
  end

  def show
    @task = get_task_at_id
    return render({message:"404"}.to_json, status:"404, User Not Found") if @task.nil?
    return render @task.to_json if @request[:format] == "json"
    render_template 'task.html.erb'
  end

  def create
    return render({message:"400"}.to_json, status:"400, Bad Request") if params["body"].nil?
    get_all_tasks << Task.new(TaskSetUp::ID, params["body"])
    return render @task.to_json if @request[:format] == "json"
    index
  end

  def update
    @task = get_task_at_id
    return render({message:"404"}.to_json, status:"404, User Not Found") if @task.nil? || params["body"].empty?
    if params["body"]
      @task.body = params["body"]
    end
    return render {message:"Updated", @task}.to_json if @request[:format] == "json"
    show
  end

  def destroy
    @task = get_task_at_id
    return render({message:"404"}.to_json, status:"404, User Not Found") if @task.nil?
    return render {message:"Deleted"}.to_json if @request[:format] == "json"

    get_all_tasks.delete(@task)

  end

  private

  def get_all_tasks
    TaskSetUp.all_tasks
  end

  def get_task_at_id
    get_all_tasks.find { |tsk| tsk.id == params[:id].to_i }
  end

end
