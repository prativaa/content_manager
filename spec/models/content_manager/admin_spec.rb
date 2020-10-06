require 'rails_helper'

module ContentManager
  RSpec.describe Admin, type: :model do
    subject { described_class.new(username: 'username', email: 'user@somemail.com', password: 'password', password_confirmation: 'password') }
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate username' do
      subject.save
      new_admin = Admin.new(username: 'username', email: 'new@somemail.com')

      expect(new_admin).to_not be_valid
    end
  end
end
