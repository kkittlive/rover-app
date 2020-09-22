# frozen_string_literal: true

require 'controller'

describe Controller do
  before :all do
    @controller = Controller.new
  end

  describe '.new' do
    it 'creates a new, Controller object' do
      # expect { Controller.new }.to change { View.all.count }.by(1)
      expect(@controller).to exist
    end

    it 'creates a new, empty View object' do
      # expect { Controller.new }.to change { View.all.count }.by(1)
      expect(@view).to exist
    end
  end
end

# describe '.new' do
#   context 'given an bubu' do
#     it 'returns zero' do
#       expect(ModelName.new('bubu')).to eq(0)
#     end
#   end
# end
