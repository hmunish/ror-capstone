require 'rails_helper'

RSpec.describe User, type: :Model do
  let(:user) do
    User.new(name: 'munish', email: 'munish@gmail.com', password: 'munish123', confirmed_at: Time.now)
  end
  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'name should be 2 characters and above' do
    user.name = 'c'
    expect(user).to_not be_valid
  end

  it 'name should be 40 characters and less' do
    user.name = 'co' * 45
    expect(user).to_not be_valid
  end
end
