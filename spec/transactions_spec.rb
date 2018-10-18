require 'spec_helper'

RSpec.describe MadeToMeasure::Ecommerce::Transaction do
  let(:item) do
    {
      :name => 'sofa',
      :price => 300,
      :quantity => 2,
      :sku => 'u3eqds43',
      :variant => 'furniture',
    }
  end

  let(:transaction) do
     MadeToMeasure::Ecommerce::Transaction.new(
      :id => 12345,
      :client_id => 555,
      :affiliation => 'westernWear',
      :revenue => 50.0,
      :shipping => 32.0,
      :tax => 12.0,
      :currency_code => 'EUR'
    )
  end

  before do
    MadeToMeasure.config do |c|
      c.version = 1
      c.property_id = 'UA-XXXXX-Y'
    end
  end

  describe "commit" do
    before do
      stub_request(:post, "https://www.google-analytics.com/collect?v=1&tid=UA-XXXXX-Y&cid=555&t=transaction&ti=12345&ta=westernWear&tr=50.0&ts=32.0&tt=12.0&cu=EUR").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
      }).to_return(status: 200, body: "", headers: {})
    end

    it "sends info to Google" do
      transaction.commit
    end

    context "with some items" do
      before do
        transaction.items << item

        stub_request(:post, "https://www.google-analytics.com/collect?cid=555&cu=EUR&ic=u3eqds43&in=sofa&ip=300&iq=2&iv=furniture&t=item&ti=12345&tid=UA-12345-3&v=1").
        with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
         }).
        to_return(status: 200, body: "", headers: {})
      end

      it "sends a transaction and an associated item" do
        transaction.commit
      end
    end
  end

end
