require 'rspec'
require 'Task'
require 'List'
describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('scrub the zebra')
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the description out' do
    test_task = Task.new('scrub the zebra')
    test_task.description.should eq 'scrub the zebra'
  end
end

describe List do
  before do
    List.clear
  end

  describe '#save' do
    it 'saves lists to all_lists' do
      test_list = List.new('new list item')
      test_list.save
      List.all.should eq [test_list]
    end
  end

  describe '.clear' do
    it 'empties all the saved lists' do
      List.new('washing').save
      List.clear
      List.all.should eq []
    end
  end

  it("starts out with an empty list of tasks") do
    test_list = List.new("School stuff")
    test_list.tasks.should eq []
  end

  it("can add tasks") do
    test_list = List.new("School stuff")
    test_task = Task.new("Learn Ruby")
    test_list.add_task(test_task)
    test_list.tasks.should eq [test_task]
  end
end
