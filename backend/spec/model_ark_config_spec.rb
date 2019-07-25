require 'spec_helper'

describe 'ArkConfig model' do

	it "does not create an additional row in the ArkConfig table" do
		expect{ArkConfig.create(:arks_enabled => true,
												    :default_naan => "foo",
												    :ark_url_prefix => "http://bar.com",
														:arks_in_all_exports => true)}.to raise_error(Sequel::ValidationFailed)
	end

	it "requires ark_url_prefix to be a URL" do
		ac = ArkConfig.first
		expect { ac.update(:ark_url_prefix => "wrong") }.to raise_error(Sequel::ValidationFailed)
	end
end
