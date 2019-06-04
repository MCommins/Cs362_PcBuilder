class CompatibleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.parts_compatible?
      record.errors[attribute] << (options[:message] || "are not compatible")
    end
  end
end
