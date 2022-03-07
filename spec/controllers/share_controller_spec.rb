RSpec.describe ShareController, type: :controller do
  let(:current_user) { create :user, email: 'hanhoan43@gmail.com', password: 123 }
  it "response status 200" do
    expect(response.status).to eq(200)
  end
  # it "redirect_to home page" do
  #   post :create, params: { article: {url: 'https://www.youtube.com/watch?v=oV8XoOc4WWE'} }
  #   expect(response).to redirect_to root_path
  # end
  describe "GET new" do
    context "not logged in" do
      it "redirects to login page" do
        get :new
        expect(response).to redirect_to new_user_registration_path
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
        post :create, params: { article: {url: 'https://www.youtube.com/watch?v=oV8XoOc4WWE'} }
        expect(response).to redirect_to root_path
      end

    end
  end
end