require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Tester', email: 'foo@bar.com', password: 'password') }

  context 'When Testing new user validity' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have aN EMAIL' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should have a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
