class TasksController < ApplicationController
  def index
    if params[:search].nil? || params[:search].empty?
      @incomplete_tasks = get_incomplete_tasks
      @complete_tasks = get_complete_tasks
      if @request[:format] == "json"
        all = @incomplete_tasks + @complete_tasks
        render all.to_json
      else
        render_template 'all_tasks.html.erb'
      end
    else
      tasks = get_search
      @incomplete_tasks = tasks.select {|tsk| tsk.completed == false}
      @complete_tasks = tasks.select {|tsk| tsk.completed == true}
      render_template 'all_tasks.html.erb'
    end
  end

  def show
    @task = get_task_at_id
    return render({message:"404"}.to_json, status:"404, User Not Found") if @task.nil?
    return render @task.to_json if @request[:format] == "json"
    if @task.completed
      @title = "Completed Task"
    else
      @title = "Incomplete Task"
    end
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

  def incomplete
    @incomplete_tasks = get_incomplete_tasks
    return render @incomplete_tasks.to_json if @request[:format] == "json"
    render_template 'incomplete_tasks.html.erb'
  end

  def complete
    @complete_tasks = get_complete_tasks
    return render @complete_tasks.to_json if @request[:format] == "json"
    render_template 'complete_tasks.html.erb'
  end

  def mark_complete
    @task = get_task_at_id
    @task.completed = true
    render '', status: '303 SEE OTHER', location: params[:back]
  end

  def get_search
    str = params[:search]
    get_all_tasks.select {|task| task.body.downcase.match(/#{str.downcase}/)}
  end

  private

  def get_complete_tasks
    get_all_tasks.select { |tsk| tsk.completed == true }
  end

  def get_incomplete_tasks
    get_all_tasks.select { |tsk| tsk.completed == false }
  end

  def get_all_tasks
    TaskSetUp.all_tasks
  end

  def get_task_at_id
    get_all_tasks.find { |tsk| tsk.id == params[:id].to_i }
  end

end
