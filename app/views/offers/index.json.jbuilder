json.array!(offers) do |offer|
  json.extract! offer, :id, :code_limit
end