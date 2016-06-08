json.array!(@medicamentos) do |medicamento|
  json.extract! medicamento, :id, :nome
  json.url medicamento_url(medicamento, format: :json)
end
