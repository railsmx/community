class FutureDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? || value <= DateTime.now
      record.errors[attribute] <<
        (options[:message] || I18n.t('activerecord.errors.messages.invalid'))
    end
  end
end
