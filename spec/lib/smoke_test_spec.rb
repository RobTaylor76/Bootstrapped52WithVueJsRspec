require 'rails_helper'

RSpec.describe 'smoke test', :vcr do
  it 'should do something' do
    result = API::Rest.get('https://www.bbc.co.uk/', {})
    expect(result[:status]).to eq(200)
  end
end