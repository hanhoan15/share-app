RSpec.describe User do
  describe ".create_invalid_article" do
    it "is empty email" do
      expect(FactoryBot.build(:user, email: nil, password: 123)).not_to be_valid
    end
    it "is empty password" do
      expect(FactoryBot.build(:user, email: 'hanhoan43@gmail.com', password: nil)).not_to be_valid
    end
  end

  describe ".create_valid_article" do
    it "is valid" do
      expect(FactoryBot.build(:user, email: 'hanhoan43@gmail.com', password: 123)).to be_valid
    end
  end
end
