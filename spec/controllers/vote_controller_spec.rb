RSpec.describe VoteController, type: :controller do
  let(:current_user) { create :user, email: 'hanhoan43@gmail.com', password: 123 }
  let(:article) { create :article, url: 'https://www.youtube.com/watch?v=oV8XoOc4WWE', user_id: current_user.id }

  describe "GET new" do
    context "not logged in" do
      it "redirects to login page" do
        post :thumbs_up, params: { id: article.id }
        expect(response.status).to eq(302)
      end
    end

    context "logged in" do
      before do
        sign_in current_user
      end

      it "response status 200" do
        expect(response.status).to eq(200)
      end

      it "redirects to root page" do
        post :thumbs_up, params: { id: article.id }
        expect(response).to redirect_to root_path
      end

      it "redirects to root page" do
        post :thumbs_down, params: { id: article.id }
        expect(response).to redirect_to root_path
      end

      it "redirects to root page" do
        post :unvote, params: { id: article.id }
        expect(response).to redirect_to root_path
      end

    end
  end
end