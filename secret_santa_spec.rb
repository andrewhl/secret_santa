require './secret_santa.rb'

describe Matrix do

  it "should initialize" do
    Matrix.new(4).should be_true
  end

  describe "#list" do
    it "should display a list" do
      matrix = Matrix.new(2)
      matrix.list.should == [[1,0],[0,1]]
      matrix = Matrix.new(3)
      matrix.list.should == [[1,0,0],[0,1,0],[0,0,1]]
      matrix = Matrix.new(5)
      matrix.list.should == [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]
    end
  end

  describe "#solution" do
    it "should display a solution for 3 people" do
      matrix = Matrix.new(3)
      matrix.set_solution!([2,0,1])
      matrix.solution.should == [[1,1,0],[0,1,1],[1,0,1]]
    end

    it "should display a solution for 5 people" do
      matrix = Matrix.new(5)
      matrix.set_solution!([4,0,3,1,2])
      matrix.solution.should == [[1,1,1,1,0],[0,1,1,1,1],[1,1,1,0,1],[1,0,1,1,1],[1,1,0,1,1]]
    end
  end

  describe "#update list" do
    subject(:matrix) { Matrix.new(3) }

    it "should set the values to the argument" do
      matrix.update_list!(1)
      matrix.list.should == [[1,1,1],[1,1,1],[1,1,1]]
    end
  end

  describe "#evaluate solution" do
    subject(:matrix) { Matrix.new(5) }

    it "should fail on [0,1,2,3,4]" do
      matrix.set_solution!([4,0,3,1,2])
      matrix.evaluate_solution([0,1,2,3,4]).should == 4
    end

    it "should succeed on [4,0,3,1,2]" do
      matrix.set_solution!([4,0,3,1,2])
      puts matrix.to_s
      matrix.evaluate_solution([4,0,3,1,2]).should == 0
    end
  end

end