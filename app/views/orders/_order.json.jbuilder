json.extract! order, :id, :store_id, :user_id, :technician_id, :call_datetime, :repair_datetime, :expected_completion_datetime, :completion_datetime, :status, :device_id, :issue_id, :work_id, :user_ref, :acknowledge_datetime, :notes, :created_at, :updated_at
json.url order_url(order, format: :json)
