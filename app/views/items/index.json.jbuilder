json.array!(@items) do |item|
  json.extract! item, :id, :order_id, :defect_id, :location, :followup, :due_date, :responsible_person, :completion_date, :remarks
  json.url item_url(item, format: :json)
end
