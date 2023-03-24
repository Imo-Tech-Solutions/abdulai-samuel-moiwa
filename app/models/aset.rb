class Aset < ApplicationRecord
  validates :name, :serial_number, :purchase_date, :purchase_price, :location, :current_owner, :warranty_expiration_date, :asset_category, :asset_status, presence: true
  validates :serial_number, uniqueness: true

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
