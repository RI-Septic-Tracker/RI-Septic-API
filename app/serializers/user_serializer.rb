class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :city, :phone, :email
end
