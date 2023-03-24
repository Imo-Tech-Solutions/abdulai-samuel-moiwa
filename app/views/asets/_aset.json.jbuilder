json.extract! aset, :id, :name, :serial_number, :purchase_date, :purchase_price, :location, :current_owner, :warranty_expiration_date, :maintenance_history, :asset_category, :asset_status, :created_at, :updated_at
json.url aset_url(aset, format: :json)
