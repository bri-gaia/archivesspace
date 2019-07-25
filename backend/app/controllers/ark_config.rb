class ArchivesSpaceService < Sinatra::Base

  # get ark_config record
  Endpoint.get('/ark_config')
    .description("Get the ARK Config record")
    .permissions([])
    .returns([200, "[(:ark_config)]"]) \
  do
    handle_unlimited_listing(ArkConfig, params)
  end

  # update ark_config record
  Endpoint.post('/ark_config')
    .description("Update the ARK config record")
    .params(["ark_config",
             JSONModel(:ark_config),
             "The updated record",
             :body => true])
    .permissions([:create_repository])
    .returns([200, :updated]) \
  do
    update_ark_config(params)
  end

  # update ark_config record
  # same as above, but update the single record in table
  # no matter what ID is passed in
  Endpoint.post('/ark_config/:id')
    .description("Update the ARK config record")
    .params(["ark_config",
             JSONModel(:ark_config),
             "The updated record",
             :body => true])
    .permissions([:create_repository])
    .returns([200, :updated]) \
  do
    update_ark_config(params)
  end

  def update_ark_config(params)
    ac = ArkConfig.first
    json = params[:ark_config]

    ac.update(:arks_enabled         => json["arks_enabled"],
              :default_naan         => json["default_naan"],
              :ark_url_prefix       => json["ark_url_prefix"],
              :arks_in_all_exports  => json["arks_in_all_exports"]
              )

    updated_response(ac, json)
  end
end
