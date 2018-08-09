class User < Granite::Base
  adapter pg
  table_name users

  # id : Int64 primary key is created for you
  field email : String
  field encrypted_password : String
  timestamps
end
