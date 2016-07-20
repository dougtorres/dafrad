class User < ApplicationRecord
  # include ActiveUUID::UUID
  validates :name, presence: true
  validates :cpf, format: { with: /\A\d{11}\z/,
    message: "only allows 11 digits" }

  def cpf_parse()
    cpf.sub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4')
  end
end
