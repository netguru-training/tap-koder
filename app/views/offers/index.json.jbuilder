json.array!(@offers) do |offer|
  json.extract! offer, :id, :name, :destription, :user_id, :code_limit
  json.url offer_url(offer, format: :json)
end
