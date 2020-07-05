RSpec.describe "API Requests" do

  let(:service) { ApiTest::Service.new }

  describe "if returns a successful message" do
    before do
      url = "https://biodata.herokuapp.com"
      body = {
        "email": "icemission@gmail.com",
        "first_name": "Roshan",
        "last_name": "Tamil Sellvan"
      }.to_json

      @stub_api = stub_request(:get, url).to_return(status: 200, body: body)
    end

    it "validates the return response" do
      resume = service.get_resume
      expect(resume['email']).to eq('icemission@gmail.com')
      expect(resume['first_name']).to eq('Roshan')
      expect(resume['last_name']).to eq('Tamil Sellvan')
    end
  end

  describe "if response returns empty body" do
    before do
      url = "https://biodata.herokuapp.com"
      @stub_api = stub_request(:get, url).to_return(status: 404, body: '')
    end

    it "should raise APIError" do
      expect{service.get_resume}.to raise_error(ApiTest::APIError)
    end
  end

  describe "if request times out" do

  end
end
