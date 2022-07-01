# frozen_string_literal: true

class PropertySerializer
  include JSONAPI::Serializer
  attributes :city, :street, :num, :bedrooms
end
