class InPastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, (options[:message] || :in_past)) unless in_past?(value)
  end

  def in_past?(date)
    date.present? && date < Time.zone.today
  end
end