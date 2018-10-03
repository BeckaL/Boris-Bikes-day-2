require 'bike'

describe Bike do
  it 'responds to working? method' do
    expect(Bike.new).respond_to?(:working?)
    
  end

end
