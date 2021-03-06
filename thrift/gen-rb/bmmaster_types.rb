#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module FacebookStatus
  FACEBOOK_PRIVATE = 1
  FACEBOOK_PUBLIC = 2
  VALUE_MAP = {1 => "FACEBOOK_PRIVATE", 2 => "FACEBOOK_PUBLIC"}
  VALID_VALUES = Set.new([FACEBOOK_PRIVATE, FACEBOOK_PUBLIC]).freeze
end

module MediaTransactionMode
  STANDARD = 1
  FB_EXPORT = 2
  VALUE_MAP = {1 => "STANDARD", 2 => "FB_EXPORT"}
  VALID_VALUES = Set.new([STANDARD, FB_EXPORT]).freeze
end

# ServiceErrorException signals that an error occured in server side
# message member gives presicion (optional)
class ServiceErrorException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# BadArgumentException indicates an illegal or invalid argument was passed into a procedure
# message member gives presicion (optional)
class BadArgumentException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# NoDataFoundException indicates no data can be found for this request
# message member gives presicion (optional)
class NoDataFoundException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# FobiddenNameException signals that a name is forbidden
# message member gives presicion (optional)
class ForbiddenNameException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# AllreadyExistException signals that data already exists
# message member gives presicion (optional)
class AllreadyExistException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# NoCredentialException indicates that identification is needed and not defined
# what message gives presicion (optional)
class NoCredentialException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# WrongPasswordException indicates that password is not correct
# message member gives presicion (optional)
class WrongPasswordException < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.message = message
  end

  MESSAGE = 1

  FIELDS = {
    MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# Struct Facet defines a Blackmamba Facet
class Facet
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ID = 1
  NAME = 2
  STATUS = 3
  USER_ID = 4
  GENDER = 5
  FACETTYPE = 6
  EQUIPMENT = 7
  FINGERPRINT = 8
  CONFIRMED = 9
  FACEBOOKSTATUS = 10

  FIELDS = {
    ID => {:type => ::Thrift::Types::I32, :name => 'id', :default => 0},
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    STATUS => {:type => ::Thrift::Types::STRING, :name => 'status'},
    USER_ID => {:type => ::Thrift::Types::I32, :name => 'user_id', :default => 0},
    GENDER => {:type => ::Thrift::Types::STRING, :name => 'gender'},
    FACETTYPE => {:type => ::Thrift::Types::STRING, :name => 'facetType'},
    EQUIPMENT => {:type => ::Thrift::Types::LIST, :name => 'equipment', :element => {:type => ::Thrift::Types::STRING}},
    FINGERPRINT => {:type => ::Thrift::Types::STRING, :name => 'fingerprint'},
    CONFIRMED => {:type => ::Thrift::Types::BOOL, :name => 'confirmed'},
    FACEBOOKSTATUS => {:type => ::Thrift::Types::I32, :name => 'facebookStatus', :enum_class => FacebookStatus}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @facebookStatus.nil? || FacebookStatus::VALID_VALUES.include?(@facebookStatus)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field facebookStatus!')
    end
  end

  ::Thrift::Struct.generate_accessors self
end

# Struct User defines a Blackmamba User
class User
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ID = 1
  ROLE = 2
  EMAIL = 3

  FIELDS = {
    ID => {:type => ::Thrift::Types::I32, :name => 'id', :default => 0},
    ROLE => {:type => ::Thrift::Types::LIST, :name => 'role', :element => {:type => ::Thrift::Types::STRING}},
    EMAIL => {:type => ::Thrift::Types::STRING, :name => 'email'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

# Struct Media defines a Blackmamba Media
class Media
  include ::Thrift::Struct, ::Thrift::Struct_Union
  ID = 1
  FACET_ID = 2
  TYPE = 3
  TITLE = 4
  DESCRIPTION = 5
  URL = 6
  TAGS = 7
  STATUS = 8

  FIELDS = {
    ID => {:type => ::Thrift::Types::I32, :name => 'id', :default => 0},
    FACET_ID => {:type => ::Thrift::Types::I32, :name => 'facet_id'},
    TYPE => {:type => ::Thrift::Types::STRING, :name => 'type'},
    TITLE => {:type => ::Thrift::Types::STRING, :name => 'title'},
    DESCRIPTION => {:type => ::Thrift::Types::STRING, :name => 'description'},
    URL => {:type => ::Thrift::Types::STRING, :name => 'url'},
    TAGS => {:type => ::Thrift::Types::LIST, :name => 'tags', :element => {:type => ::Thrift::Types::STRING}},
    STATUS => {:type => ::Thrift::Types::STRING, :name => 'status', :default => %q"active"}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

