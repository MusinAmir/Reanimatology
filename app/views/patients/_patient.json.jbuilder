json.extract! patient, :id, :name, :age_type, :clinic_diagnosis, :created_at, :updated_at
json.url patient_url(patient, format: :json)
