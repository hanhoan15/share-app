RSpec.describe Article do
  let(:user) {create :user, email: 'hanhoan43@gmail.com', password: 123}
  describe ".create_invalid_article" do
    it "is empty url" do
      expect(FactoryBot.build(:article, url: nil, user_id: user.id)).not_to be_valid
    end
    it "is empty user id" do
      expect(FactoryBot.build(:article, url: "https://www.youtube.com/watch?v=oV8XoOc4WWE", user_id: nil)).not_to be_valid
    end
  end

  describe ".create_valid_article" do
    it "is valid" do
      expect(FactoryBot.build(:article, url: "https://www.youtube.com/watch?v=oV8XoOc4WWE", user_id: user.id)).to be_valid
    end
  end
end
