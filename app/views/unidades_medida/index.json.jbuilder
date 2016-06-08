json.array!(@unidades_medidas) do |unidade_medida|
  json.extract! unidade_medida, :id, :nome
  json.url unidade_medida_url(unidade_medida, format: :json)
end
