# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :city, :phone, :email
end
