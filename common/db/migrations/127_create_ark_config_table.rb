require_relative 'utils'

Sequel.migration do
  up do
    $stderr.puts("Adding ARK config table")
    create_table(:ark_config) do
      primary_key :id

      Integer :arks_enabled
      String :default_naan
      String :ark_url_prefix
      Integer :arks_in_all_exports

      String :created_by
      String :last_modified_by
      DateTime :create_time
      DateTime :system_mtime
      DateTime :user_mtime
      Integer :lock_version, default: 0
    end
  end

  down do
    drop_table(:oai_config)
  end
end
