require_relative 'utils'

# populates the ark_config table with default values

Sequel.migration do
  up do

    $stderr.puts("Adding dafault values to ARK config table")
    arks_enabled = 0
    default_naan = 'f000001'
    ark_url_prefix = AppConfig[:public_proxy_url]
    arks_in_all_exports = 0

    self[:ark_config].insert(:arks_enabled        => arks_enabled,
                             :default_naan        => default_naan,
                             :ark_url_prefix      => ark_url_prefix,
                             :arks_in_all_exports => arks_in_all_exports,
                             :lock_version        => 0,
                             :create_time         => Time.now,
                             :system_mtime        => Time.now,
                             :user_mtime          => Time.now,
                             :created_by          => "admin")
  end

  down do
  end

end
