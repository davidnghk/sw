json.array!(@defects) do |defect|
  json.extract! defect, :id, :code, :name, :chi_name
  json.url defect_url(defect, format: :json)
end
