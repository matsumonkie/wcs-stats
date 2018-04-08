require "rails_helper"

RSpec.describe RPParserService, :type => :service do

  context "from a registry json response" do

    shared_examples "a valid json record" do |expected|
      before :each do
        create(:invitational)
        create(:champion)
        create(:all_star)
        create(:advanced)
        create(:professional)
      end

      it "should parse a record" do
        rp = RegistryPoint.new(json: subject)
        res = RPParserService.parse(rp)

        expect(res[:dancer].first_name).to eq(expected[:first_name])
        expect(res[:dancer].last_name).to eq(expected[:last_name])

        expect(res[:event_division_competitions].count).to eq(expected[:nb_competitions])
      end

      it "should build a record" do
        rp = RegistryPoint.new(json: subject)
        parsed = RPParserService.parse(rp)
        RPParserService.build(parsed[:dancer],
                              parsed[:event_division_competitions])
        dancer = Dancer.first

        expect(dancer.first_name).to eq(expected[:first_name])
        expect(dancer.last_name).to eq(expected[:last_name])
        expect(dancer.competitions.count).to eq(expected[:nb_competitions])
      end
    end

    describe "Kellese Key", "RP's json reply" do
      subject { JSON.parse(file_fixture("kellese_key.json").read) }
      it_should_behave_like "a valid json record", {
          first_name: "Kellese",
          last_name: "Key",
          nb_competitions: 69
      }
    end

    describe "Kellese Key", "RP's json reply" do
      subject { JSON.parse(file_fixture("kyle_redd.json").read) }
      it_should_behave_like "a valid json record", {
          first_name: "Kyle",
          last_name: "Redd",
          nb_competitions: 19
      }
    end

    describe "Lori Matsuhara", "RP's json reply" do
      subject { JSON.parse(file_fixture("lori_matsuhara.json").read) }
      it_should_behave_like "a valid json record", {
          first_name: "Lori",
          last_name: "Matsuhara",
          nb_competitions: 1
      }
    end
  end
end


