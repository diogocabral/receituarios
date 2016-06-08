json.array!(@receitas) do |receita|
  json.extract! receita, :id, :paciente
  json.url receita_url(receita, format: :json)
end
