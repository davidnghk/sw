json.array!(@order_parties) do |order_party|
  json.extract! order_party, :id, :order_id, :name, :designation, :organization
  json.url order_party_url(order_party, format: :json)
end
