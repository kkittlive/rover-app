# frozen_string_literal: true

# Once Controller.new is run, test that
#   @view exists and is of View class
#   @plateau exists and is of Plateau class
#   @rover exists and is of Rover class
#   @continue = 'Y'
#   @results = []

require 'controller'

describe Controller do
  before :all do
    @controller = Controller.new
  end

  describe '#new' do
    it 'should return a new solution object' do
      expect(@solution).to be_a Solution
    end

    it 'should not return nil' do
      expect(@solution).not_to be_nil
    end
  end

  describe '#input_grid_valid' do
    it 'should return true for valid input grid coordinates' do
      expect(@solution.input_grid_valid?(5, 5)).to be_truthy
    end

    it 'should return false for invalid  input grid coordinates' do
      expect(@solution.input_grid_valid?('a', 5)).to be_falsey
    end
  end

  describe '#take_grid_coordinates' do
    it 'should take input grid and create MarsGrid object' do
      allow(@solution).to receive(:gets).and_return('5 5')
      @solution.take_grid_coordinates
      expect(@solution.grid.top_right_x).to eq(5)
      expect(@solution.grid.top_right_y).to eq(5)
    end

    it 'should raise ArgumentError on invalid grip input' do
      allow(@solution).to receive(:gets).and_return('a 5')
      expect { @solution.take_grid_coordinates }.to raise_error(ArgumentError)
    end
  end

  describe '#process_instruction' do
    it 'should process valid instruction' do
      allow(STDOUT).to receive(:puts)
      @solution.rover = MarsRover.new(0, 1, 1, 'N')
      expect(@solution.process_instruction('L')).not_to be_falsey
    end

    it 'should return false on invalid instruction' do
      allow(STDOUT).to receive(:puts)
      @solution.rover = MarsRover.new(0, 1, 1, 'N')
      expect(@solution.process_instruction('Q')).to be_falsey
    end
  end
end












require 'controller'

describe Controller do
  before :all do
    @controller = Controller.new
  end

  it '@controller should exist' do
    expect(@controller.exists?).to eq(true)
  end

  # describe '.new' do
  #   it 'creates a new, Controller object' do
  #     # expect { Controller.new }.to change { View.all.count }.by(1)
  #     expect(@controller).to exist
  #   end

  #   it 'creates a new, empty View object' do
  #     # expect { Controller.new }.to change { View.all.count }.by(1)
  #     expect(@view).to exist
  #   end
  # end
end

# describe '.new' do
#   context 'given an bubu' do
#     it 'returns zero' do
#       expect(ModelName.new('bubu')).to eq(0)
#     end
#   end
# end

# describe 'Controller' do
#   describe '#name', if: recipe_helper.file_and_class_valid? do
#     it 'should return the name of recipe' do
#       expect(recipe_one).to respond_to :name
#     end
#   end

#   describe '#description', if: recipe_helper.file_and_class_valid? do
#     it 'should return the description of recipe' do
#       expect(recipe_one).to respond_to :description
#     end
#   end

#   describe '#initialize', if: recipe_helper.file_and_class_valid? do
#     it 'should create a recipe with a list of attributes' do
#       expect(recipe_one.name).to eq 'Brownie'
#       expect(recipe_one.description).to eq 'Delicious chocolate cake'
#       expect(recipe_two.name).to eq 'Lasagna'
#       expect(recipe_two.description).to eq 'Italian lasagna recipe from grandma'
#     end
#   end
# end
