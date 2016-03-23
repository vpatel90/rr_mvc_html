class Task
  attr_accessor :id, :body, :completed
  def initialize(id, body)
    @id = id
    @body = body
    @completed = false
    TaskSetUp::ID += 1
  end

  def to_json(_ = nil)
    {
      id: id,
      body: body,
      completed: completed
    }.to_json
  end
end
