RSpec.describe "ArticleSerializer" do
  let(:current_user) { create :user, email: 'hanhoan43@gmail.com', password: 123 }
  let(:article) {create :article, url: 'https://www.youtube.com/watch?v=oV8XoOc4WWE', user_id: current_user.id}
  let(:serializer) {Articles::ArticleSerializer.new(article, scope: { current_user: current_user})}

  it 'has the same url' do
    expect(serializer.serializable_hash[:url]).to eql("https://www.youtube.com/embed/oV8XoOc4WWE")
  end

  it 'has the same title' do
    expect(serializer.serializable_hash[:title]).to eql('khi co don em nho ai')
  end

  it "has the same user_email" do
    expect(serializer.serializable_hash[:user_email]).to eql(current_user.email)
  end

  it "has the same description" do
    expect(serializer.serializable_hash[:description]).to eql('hoang nam giang-may xay dung B_k45')
  end

  describe "vote action" do
    context "thumbs up" do
      before do
        current_user.vote_up_for(article)
      end

      it "has the same number" do
        expect(serializer.serializable_hash[:like]).to eql(1)
      end
    end

    context "thumbs down" do
      before do
        current_user.vote_down_for(article)
      end

      it "has the same number" do
        expect(serializer.serializable_hash[:dislike]).to eql(1)
      end
    end

    context "unvote" do
      before do
        current_user.unvote_for(article)
      end

      it "has the same number" do
        expect(serializer.serializable_hash[:like]).to eql(0)
        expect(serializer.serializable_hash[:dislike]).to eql(0)
      end
    end
  end
end
