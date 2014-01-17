require 'pry'
require 'pry-nav'

class Matrix

  attr_accessor :length, :list
  alias_method :solution, :list

  def initialize(length)
    @length = length
    @list = []
    @solution = []
    create_list
  end

  def create_list(num = 0)
    @length.times do |i|
      # rand_num = rand(@length)
      temp_list = []

      @length.times do |j|
        temp_list.push(num)
      end
      temp_list[i] = 1
      @list.push(temp_list)
    end
  end

  def update_list!(num)
    new_list = @list.dup
    @list.each_with_index do |row, x|
      row.each_with_index do |col, y|
        new_list[x][y] = 1
      end
    end
    @list = new_list
  end

  def set_solution!(solution)
    raise "cannot exceed length of list" if solution.length > @length

    update_list!(1)
    @list.each_with_index do |row, index|
      @list[index][solution[index]] = 0
    end

    # @list[0][4] = 0
    # @list[1][0] = 0
    # @list[2][3] = 0
    # @list[3][1] = 0
    # @list[4][2] = 0
  end

  def evaluate_solution(numbers)
    sum = 0
    puts numbers.to_s + "\n"
    numbers.each_with_index do |num, index|
      sum += @list[num][numbers[(index+1) % numbers.length]]
    end
    sum
  end

  def to_s
    puts "\n"
    @list.each do |i|
      puts i.to_s
    end
    nil
  end
end

# test = Matrix.new(5)
# test.set_solution!([4,0,3,1,2])
# test.evaluate_solution([0,1,2,3,4])
# test.evaluate_solution([4,2,3,1,0])