require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User registration test' do
    context 'Correct input of Name, email and password' do
      it 'New account succesfully created' do
        correct_sign_up = FactoryBot.build(:user)
        expect(correct_sign_up).to be_valid
      end
    end
    context 'Empty user name' do
      it 'Validation (Name: nil), Fail registration' do
        empty_name = FactoryBot.build(:user, name: nil)
        expect(empty_name).not_to be_valid
      end
    end
    context 'length name longer than 50 characters' do
      it 'Validation error (Null constraint of name) and fails' do
        long_name = FactoryBot.build(:user, name: 'G' * 51)
        expect(long_name).not_to be_valid
      end
    end
    context 'If email is empty' do
      it 'Validation error (Null constraint of email) and fails' do
        empty_email = FactoryBot.build(:user, email: nil)
        expect(empty_email).not_to be_valid
      end
    end
    context 'If the format of email is different' do
      it 'Validation error (email format error) and fails' do
        different_types_email = FactoryBot.build(:user, email: 'email.com')
        expect(different_types_email).not_to be_valid
      end
    end
    context 'If password is empty' do
      it 'Validation error (Null constraint of password) and fails' do
        empty_password = FactoryBot.build(:user, password: nil)
        expect(empty_password).not_to be_valid
      end
    end
  end
end