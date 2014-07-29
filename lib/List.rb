class List
  @@all_lists = []

  def List.clear
    @@all_lists = []
  end

  def List.all
    @@all_lists
  end

  def save
    @@all_lists << self
  end

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
