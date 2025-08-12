require 'rails_helper'

RSpec.describe User, type: :model do
it 'returns the full_name for a user' do
  user = User.create(first_name: 'Chipper', last_name: 'Roe')

  expect(user.full_name).to eq 'Chipper Roe'
end
end
