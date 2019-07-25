{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
    "version" => 1,
    "type" => "object",
    "uri" => "/ark_config",

    "properties" => {
      "arks_enabled" => {"type" => "boolean", "default" => false},
      "default_naan" => {"type" => "string"},
      "ark_url_prefix" => {"type" => "string"},
      "arks_in_all_exports" => {"type" => "boolean", "default" => false}
    },
  },
}
