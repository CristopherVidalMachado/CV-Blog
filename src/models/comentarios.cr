class Comentarios < Granite::Base
  adapter pg
  table_name comentarios

  # id : Int64 primary key is created for you
  field nome : String
  field email : String
  field texto : String
  timestamps
end
