require 'spec_helper'

RSpec.describe MadeToMeasure::Item do

  let(:item) do
     MadeToMeasure::Item.new(
      :transaction_id => 12345,
      :client_id => 555,
      :name => 'sofa',
      :price => 300,
      :quantity => 2,
      :sku => 'u3eqds43',
      :variant => 'furniture',
      :currency_code => 'EUR'
    )
  end

  before do
    MadeToMeasure.config do |c|
      c.version = 1
      c.property_id = 'UA-12345-3'
    end
  end

  describe "commit" do
    before do
      stub_request(:post, "https://www.google-analytics.com/collect?cid=555&cu=EUR&ic=u3eqds43&in=sofa&ip=300&iq=2&iv=furniture&t=item&ti=12345&tid=UA-12345-3&v=1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: "", headers: {})
    end

    it "sends info to Google" do
      item.commit
    end
  end

end
