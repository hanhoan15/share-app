RSpec.describe HomeController, type: :controller do
  it "response status 200" do
    expect(response.status).to eq(200)
  end
end