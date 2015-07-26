require "spec_helper"

describe Post do

  describe "DB" do
    it "should have user_id column" do
      expect(subject).to have_db_column(:user_id).of_type(:integer)
    end

    it "should have content column" do
      expect(subject).to have_db_column(:content).of_type(:text)
    end
  end

  describe "associations" do
    it "should belong_to user" do
      expect(subject).to belong_to(:user)
    end

    it "should have_many comments" do
      expect(subject).to have_many(:comments)
    end

    it "should have_many sub_comments" do
      expect(subject).to have_many(:sub_comments)
    end
  end

  describe "validations" do
    it "shoul validate presence of user_id" do
      expect(subject).to validate_presence_of(:user_id)
    end

    it "shoul validate presence of content" do
      expect(subject).to validate_presence_of(:content)
    end

    it "should be invalid without content" do
      post = build(:post) do |p|
        p.content = ''
      end

      expect(post).to be_invalid
    end

    it "should be invalid without a user_id" do
      post = build(:post) do |p|
        p.user_id = ''
      end

      expect(post).to be_invalid
    end

    it "should allow creation of valid posts" do
      post = create(:post)
      expect(post).to be_valid
    end
  end

  describe "instance methods" do
    it "#total_comment_count" do
      post = create(:post) do |p|
        p.comments.create(attributes_for(:comment))
      end

      expect(post.total_comment_count).to eql(1)
    end
  end
end
