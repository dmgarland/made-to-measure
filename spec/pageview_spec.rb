# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MadeToMeasure::Pageview do
  let(:pageview) { MadeToMeasure::Pageview.new(*pageview_params) }
  let(:pageview_params) do
    [page: '/test', title: 'test', document_hostname: 'mytest.com', client_id: '111']
  end

  before do
    MadeToMeasure.config do |c|
      c.version = 1
      c.property_id = 'UA-12345-6'
    end
  end

  describe 'commit' do
    before do
      @request = stub_request(:post, 'https://www.google-analytics.com/collect?cid=111&dh=mytest.com&dp=/test&dt=test&t=pageview&tid=UA-12345-6&v=1')
                 .with(headers: { 'User-Agent': 'MadeToMeasure/0.2.2 (+https://github.com/dmgarland/made-to-measure)' })
                 .to_return(status: 200, body: '', headers: {})
    end

    context 'including all required parameters' do
      before { pageview.commit }

      it 'should send a page tracker request to google' do
        expect(@request).to have_been_requested
      end
    end

    context 'missing required parameters' do
      let(:pageview_params) { [title: 'test', document_hostname: 'mytest.com', client_id: '111'] }

      it 'should raise an argument' do
        expect { pageview.commit }.to raise_error(ArgumentError).with_message('missing keyword: page')
      end
    end
  end

  describe '#to_h' do
    it 'should return a hash of query parameters' do
      expect(pageview.to_h).to eq(
        {
          v:   1,
          tid: 'UA-12345-6',
          t:   'pageview',
          cid: '111',
          dp:  '/test',
          dt:  'test',
          dh:  'mytest.com'
        }
      )
    end
  end
end
