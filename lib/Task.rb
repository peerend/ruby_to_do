class Task
  @@all_tasks = []

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks = []
  end

  def save
    @@all_tasks << self
  end

  def initialize(description)
    @description = description
  end
  def description
    @description
  end
end
