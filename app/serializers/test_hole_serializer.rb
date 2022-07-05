class TestHoleSerializer
  include JSONAPI::Serializer
  attributes :property_id, :shwt, :ledge_depth, :notes, :inspector_present, :date, :load_rate, :created_at, :updated_at
end
