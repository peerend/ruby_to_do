class List
  def initialize(list_name)
    @list_name = list_name
    @tasks = []
  end

  def tasks
    @tasks
  end

  def add_task(task)
    @tasks << task
  end

  def list_name
    @list_name
  end
end
