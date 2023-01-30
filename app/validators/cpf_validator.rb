class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cpf_regex = /(([0-9]{3})[\.]?([0-9]{3})[\.]?([0-9]{3})[-]?([0-9]{2}))/
    unless value =~ cpf_regex
      record.errors.add attribute, (options[:message] || "format is invalid; please use XXX.XXX.XXX-XX")
      return
    end
    cpf = value.match(cpf_regex)[2..5].join
    if !valid_number?(cpf)
      record.errors.add attribute, (options[:message] || "cpf is invalid")
    end
  end

  private

  def valid_number?(cpf)
    valid_first_digit?(cpf) && valid_second_digit?(cpf)
  end

  def valid_first_digit?(cpf) = valid_digits?(8, cpf)
  def valid_second_digit?(cpf) = valid_digits?(9, cpf)

  def valid_digits?(size, cpf)
    digits_sum = cpf[0..size].chars.map.with_index { |digit, index| digit.to_i * (size + 2 - index) }.sum
    remainder = digits_sum % 11
    verification_digit = remainder < 2 ? 0 : 11 - remainder
    verification_digit == cpf[size + 1].to_i
  end
end
