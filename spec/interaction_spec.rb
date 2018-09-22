require 'spec_helper'

RSpec.describe MadeToMeasure::Interaction do

  describe "to_h" do
    it "uses a UUID version 4 as default client_id" do
      uuid = '58f61617-9854-425a-b25d-5fa0561ad6a8'
      expect(SecureRandom).to receive(:uuid).and_return(uuid)
      expect(MadeToMeasure::Interaction.new.to_h[:cid]).to eq(uuid)
    end

    it "uses a 1 as the default protocol version" do
      expect(MadeToMeasure::Interaction.new.to_h[:v]).to eq(1)
    end
  end

end
