require_relative 'utils'

Sequel.migration do
  up do
  	# add columns
    alter_table(:repository) do
      add_column(:naan, String, text: true)
      # add_column(:oai_only_ark_export, Integer, :default => 0)
      # add_column(:ark_export, Integer, :default => 0)
    end
  end

end
