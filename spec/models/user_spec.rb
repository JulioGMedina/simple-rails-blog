require "spec_helper"

describe User do
  describe 'DB' do
    it "should have an email column" do
      expect(subject).to have_db_column(:email).of_type(:string).with_options(null:  false)
    end

    it "should have a password column" do
      expect(subject).to have_db_column(:encrypted_password).of_type(:string).with_options(null: false)
    end

    it "should have a reset_password_token column" do
      expect(subject).to have_db_column(:reset_password_token).of_type(:string)
    end

    it "should have a reset_password_sent_at column" do
      expect(subject).to have_db_column(:reset_password_sent_at).of_type(:datetime)
    end

    it "should have a remember_created_at column" do
      expect(subject).to have_db_column(:remember_created_at).of_type(:datetime)
    end

    it "should have a sign_in_count column" do
      expect(subject).to have_db_column(:sign_in_count).of_type(:integer)
    end

    it "should have a current_sign_in_at column" do
      expect(subject).to have_db_column(:current_sign_in_at).of_type(:datetime)
    end

    it "should have a current_sign_in_at column" do
      expect(subject).to have_db_column(:current_sign_in_at).of_type(:datetime)
    end

    it "should have a last_sign_in_at column" do
      expect(subject).to have_db_column(:last_sign_in_at).of_type(:datetime)
    end

    it "should have a current_sign_in_ip column" do
      expect(subject).to have_db_column(:current_sign_in_ip).of_type(:string)
    end

    it "should have a last_sign_in_ip column" do
      expect(subject).to have_db_column(:last_sign_in_ip).of_type(:string)
    end

    it "should have a created_at column" do
      expect(subject).to have_db_column(:created_at).of_type(:datetime)
    end

    it "should have updated_at column" do
      expect(subject).to have_db_column(:updated_at).of_type(:datetime)
    end

    it "should have DB index for email" do
      expect(subject).to have_db_index(:email).unique(true)
    end

    it "shold have DB idex for reset_password_token" do
      expect(subject).to have_db_index(:reset_password_token)
    end
  end

  describe "associations" do
    it "should have many posts" do
      expect(subject).to have_many(:posts)
    end

    it "should have many comments" do
      expect(subject).to have_many(:comments)
    end

    it "should have many sub_comments" do
      expect(subject).to have_many(:sub_comments)
    end
  end

  describe "validations" do
    it "should validate presence of email" do
      expect(subject).to validate_presence_of(:email)
    end



    it "should validate that user has set password" do
      user = build(:user) do |u|
        u.password = ''
      end

      expect(user).to be_invalid
    end

    it "should create valid user" do
      user = create(:user)
      expect(user).to be_valid

    end
  end


end
