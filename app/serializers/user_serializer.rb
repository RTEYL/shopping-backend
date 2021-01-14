class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :admin, :id
end
