class CompatibleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless Part.compare_parts(value)
      record.errors[attribute] << (options[:message] || "are not compatible")
    end
  end
end
