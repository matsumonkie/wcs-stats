require "rails_helper"

RSpec.describe RPParserService, :type => :service do

  context "from a registry json response" do

    before :each do
      create(:invitational)
      create(:champion)
      create(:all_star)
      create(:advanced)
      create(:professional)
    end

    it "parses a record" do
      json = JSON.parse(file_fixture("kellese_key.json").read)
      rp = RegistryPoint.new(json: json)
      res = RPParserService.parse(rp)

      expect(res[:dancer].first_name).to eq("Kellese")
      expect(res[:dancer].last_name).to eq("Key")

      expect(res[:event_division_competitions].count).to eq(69)
    end

    it "build a record" do
      json = JSON.parse(file_fixture("kellese_key.json").read)
      rp = RegistryPoint.new(json: json)
      parsed = RPParserService.parse(rp)
      RPParserService.build(parsed[:dancer],
                            parsed[:event_division_competitions])
      dancer = Dancer.first

      expect(dancer.first_name).to eq("Kellese")
      expect(dancer.last_name).to eq("Key")
      expect(dancer.competitions.count). to eq(69)
    end
  end
end
