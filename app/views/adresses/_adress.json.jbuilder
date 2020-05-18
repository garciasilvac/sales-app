json.extract! adress, :id, :street, :str_number, :adr_unit, :adr_other, :adr_zip, :adr_county, :adr_state, :adr_country, :created_at, :updated_at
json.url adress_url(adress, format: :json)
