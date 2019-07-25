class ArkConfig < Sequel::Model(:ark_config)
  include ASModel
  corresponds_to JSONModel(:ark_config)

  set_model_scope :global

  # validations
  # only one row in table allowed
  # arks_enabled must have a value
  # default_naan must have a value
  # ark_url_prefix must have a value and be a valid url

  def validate
  	validate_single_record

  	validates_presence :arks_enabled
  	validates_presence :default_naan
  	validates_presence :ark_url_prefix

    validate_ark_url_prefix_is_url
  end

  def validate_single_record
  	record_count = ArkConfig.all.count

  	unless record_count == 0
      # if we have an existing record, we'd better be updating that one record
      first_record = ArkConfig.first

      if self.id.nil? || first_record.id != self.id
        errors.add(:base, 'Cannot have more than one record in ark_config table.')
      end
  	end
  end

  def validate_ark_url_prefix_is_url
    unless URI.parse(self.ark_url_prefix).kind_of?(URI::HTTP)
      errors.add(:ark_url_prefix, 'must be a valid URL')
    end
  end

end
