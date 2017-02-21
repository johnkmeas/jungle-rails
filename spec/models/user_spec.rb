require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have valid user name, email and password' do
      @user = User.create!({
        name: 'Joe',
        email: 'joe@gmail.com',
        password: 'joe'
        })
      @user2 = User.create!({
        name: 'Robert',
        email: 'robert@gmail.com',
        password: 'robert'
        })
      expect(@user2).to be_valid
    end
    it 'should have a password with at least 3 characters' do
      @user = User.new({
        name: 'Joe',
        email: 'joe@gmail.com',
        password: 'jo'
        })
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should authenticate with correct credentials' do
      @user2 = User.create!({
        name: 'Robert',
        email: 'robert@gmail.com',
        password: 'robert'
        })
      user = User.authenticate_with_credentials("robert@gmail.com", "robert")
      expect(user.name).to eq("Robert")
    end
    it 'should not authenticate with wrong credentials' do
      @user2 = User.create!({
        name: 'Robert',
        email: 'robert@gmail.com',
        password: 'robert'
        })
      user = User.authenticate_with_credentials("robert@gmail.com", "BAD PASSWORD")
      expect(user).to eq(nil)
    end
  end

  describe 'edge cases' do
    # examples for this class method here
    it 'should omit empty spaces in email when authenticating' do
      @user = User.create!({
        name: 'Jobert',
        email: 'jobert@gmail.com',
        password: 'jobert'
        })
      user = User.authenticate_with_credentials(" jobert@gmail.com ", "jobert")
      expect(user.email).to eq("jobert@gmail.com")
    end
    it 'should authenticate even when email is entered with different case' do
      @user = User.create!({
        name: 'Jobert',
        email: 'joBert@gmail.com',
        password: 'jobert'
        })
      user = User.authenticate_with_credentials("JOBERT@gmail.com", "jobert")
      expect(user.email).to eq("jobert@gmail.com")
    end
  end
end
