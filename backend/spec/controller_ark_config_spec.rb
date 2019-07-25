require 'spec_helper'

describe 'ARK config controller' do
  it "gets the ARK config record" do
    ark_config = create(:json_ark_config)

    ark_config_json = JSONModel(:ark_config).all.first
    expect(ark_config["arks_enabled"]).to eq(ark_config_json["arks_enabled"])
    expect(ark_config["default_naan"]).to eq(ark_config_json["default_naan"])
    expect(ark_config["ark_url_prefix"]).to eq(ark_config_json["ark_url_prefix"])
    expect(ark_config["arks_in_all_exports"]).to eq(ark_config_json["arks_in_all_exports"])
  end

  it "updates the ARK config record" do
    ark_config = create(:json_ark_config)

    ark_config.default_naan = "default_naan"
    ark_config.save

    ark_config_json = JSONModel(:ark_config).all.first
    expect(ark_config_json["default_naan"]).to eq("default_naan")
  end
end
