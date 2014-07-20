json.array!(offers) do |offer|
  json.extract! offer, :id, :codes_used
end