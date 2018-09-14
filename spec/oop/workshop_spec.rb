require 'oop/workshop'

RSpec.describe Oop::Workshop do
  it 'has a version number' do
    expect(Oop::Workshop::VERSION).not_to be nil
  end

  # it 'broccoli is gross' do
  #   expect(Oop::Workshop::Food.portray('Broccoli')).to eql('Gross!')
  # end

  # it 'anything else is delicious' do
  #   expect(Oop::Workshop::Food.portray('Not Broccoli')).to eql('Delicious!')
  # end
end
