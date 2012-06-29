#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'bmmaster_types'

module Master
  class Client
    include ::Thrift::Client

    def ping()
      send_ping()
      return recv_ping()
    end

    def send_ping()
      send_message('ping', Ping_args)
    end

    def recv_ping()
      result = receive_message(Ping_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'ping failed: unknown result')
    end

    def getFacet(facet_id)
      send_getFacet(facet_id)
      return recv_getFacet()
    end

    def send_getFacet(facet_id)
      send_message('getFacet', GetFacet_args, :facet_id => facet_id)
    end

    def recv_getFacet()
      result = receive_message(GetFacet_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getFacet failed: unknown result')
    end

    def getFacetList(user_id)
      send_getFacetList(user_id)
      return recv_getFacetList()
    end

    def send_getFacetList(user_id)
      send_message('getFacetList', GetFacetList_args, :user_id => user_id)
    end

    def recv_getFacetList()
      result = receive_message(GetFacetList_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getFacetList failed: unknown result')
    end

    def setFacet(facet)
      send_setFacet(facet)
      return recv_setFacet()
    end

    def send_setFacet(facet)
      send_message('setFacet', SetFacet_args, :facet => facet)
    end

    def recv_setFacet()
      result = receive_message(SetFacet_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise result.fn unless result.fn.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'setFacet failed: unknown result')
    end

    def setFacetImage(facet_id, image_url)
      send_setFacetImage(facet_id, image_url)
      return recv_setFacetImage()
    end

    def send_setFacetImage(facet_id, image_url)
      send_message('setFacetImage', SetFacetImage_args, :facet_id => facet_id, :image_url => image_url)
    end

    def recv_setFacetImage()
      result = receive_message(SetFacetImage_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'setFacetImage failed: unknown result')
    end

    def checkFacetNameExist(facet_name)
      send_checkFacetNameExist(facet_name)
      return recv_checkFacetNameExist()
    end

    def send_checkFacetNameExist(facet_name)
      send_message('checkFacetNameExist', CheckFacetNameExist_args, :facet_name => facet_name)
    end

    def recv_checkFacetNameExist()
      result = receive_message(CheckFacetNameExist_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise result.fn unless result.fn.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'checkFacetNameExist failed: unknown result')
    end

    def getUser(websession_id)
      send_getUser(websession_id)
      return recv_getUser()
    end

    def send_getUser(websession_id)
      send_message('getUser', GetUser_args, :websession_id => websession_id)
    end

    def recv_getUser()
      result = receive_message(GetUser_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getUser failed: unknown result')
    end

    def checkUserEmailExist(email)
      send_checkUserEmailExist(email)
      return recv_checkUserEmailExist()
    end

    def send_checkUserEmailExist(email)
      send_message('checkUserEmailExist', CheckUserEmailExist_args, :email => email)
    end

    def recv_checkUserEmailExist()
      result = receive_message(CheckUserEmailExist_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'checkUserEmailExist failed: unknown result')
    end

    def getFacebookId(user_id)
      send_getFacebookId(user_id)
      return recv_getFacebookId()
    end

    def send_getFacebookId(user_id)
      send_message('getFacebookId', GetFacebookId_args, :user_id => user_id)
    end

    def recv_getFacebookId()
      result = receive_message(GetFacebookId_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise result.ba unless result.ba.nil?
      raise result.ndf unless result.ndf.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getFacebookId failed: unknown result')
    end

    def setMedia(media)
      send_setMedia(media)
      return recv_setMedia()
    end

    def send_setMedia(media)
      send_message('setMedia', SetMedia_args, :media => media)
    end

    def recv_setMedia()
      result = receive_message(SetMedia_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'setMedia failed: unknown result')
    end

    def startMediaTransaction(fingerprint, user_id, facet_id, mode)
      send_startMediaTransaction(fingerprint, user_id, facet_id, mode)
      return recv_startMediaTransaction()
    end

    def send_startMediaTransaction(fingerprint, user_id, facet_id, mode)
      send_message('startMediaTransaction', StartMediaTransaction_args, :fingerprint => fingerprint, :user_id => user_id, :facet_id => facet_id, :mode => mode)
    end

    def recv_startMediaTransaction()
      result = receive_message(StartMediaTransaction_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise result.ba unless result.ba.nil?
      raise result.ndf unless result.ndf.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'startMediaTransaction failed: unknown result')
    end

    def stopMediaTransaction(token)
      send_stopMediaTransaction(token)
      return recv_stopMediaTransaction()
    end

    def send_stopMediaTransaction(token)
      send_message('stopMediaTransaction', StopMediaTransaction_args, :token => token)
    end

    def recv_stopMediaTransaction()
      result = receive_message(StopMediaTransaction_result)
      return result.success unless result.success.nil?
      raise result.se unless result.se.nil?
      raise result.ba unless result.ba.nil?
      raise result.ndf unless result.ndf.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'stopMediaTransaction failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_ping(seqid, iprot, oprot)
      args = read_args(iprot, Ping_args)
      result = Ping_result.new()
      result.success = @handler.ping()
      write_result(result, oprot, 'ping', seqid)
    end

    def process_getFacet(seqid, iprot, oprot)
      args = read_args(iprot, GetFacet_args)
      result = GetFacet_result.new()
      begin
        result.success = @handler.getFacet(args.facet_id)
      rescue ServiceErrorException => se
        result.se = se
      end
      write_result(result, oprot, 'getFacet', seqid)
    end

    def process_getFacetList(seqid, iprot, oprot)
      args = read_args(iprot, GetFacetList_args)
      result = GetFacetList_result.new()
      begin
        result.success = @handler.getFacetList(args.user_id)
      rescue ServiceErrorException => se
        result.se = se
      end
      write_result(result, oprot, 'getFacetList', seqid)
    end

    def process_setFacet(seqid, iprot, oprot)
      args = read_args(iprot, SetFacet_args)
      result = SetFacet_result.new()
      begin
        result.success = @handler.setFacet(args.facet)
      rescue ServiceErrorException => se
        result.se = se
      rescue ForbiddenNameException => fn
        result.fn = fn
      end
      write_result(result, oprot, 'setFacet', seqid)
    end

    def process_setFacetImage(seqid, iprot, oprot)
      args = read_args(iprot, SetFacetImage_args)
      result = SetFacetImage_result.new()
      begin
        result.success = @handler.setFacetImage(args.facet_id, args.image_url)
      rescue ServiceErrorException => se
        result.se = se
      end
      write_result(result, oprot, 'setFacetImage', seqid)
    end

    def process_checkFacetNameExist(seqid, iprot, oprot)
      args = read_args(iprot, CheckFacetNameExist_args)
      result = CheckFacetNameExist_result.new()
      begin
        result.success = @handler.checkFacetNameExist(args.facet_name)
      rescue ServiceErrorException => se
        result.se = se
      rescue ForbiddenNameException => fn
        result.fn = fn
      end
      write_result(result, oprot, 'checkFacetNameExist', seqid)
    end

    def process_getUser(seqid, iprot, oprot)
      args = read_args(iprot, GetUser_args)
      result = GetUser_result.new()
      begin
        result.success = @handler.getUser(args.websession_id)
      rescue ServiceErrorException => se
        result.se = se
      end
      write_result(result, oprot, 'getUser', seqid)
    end

    def process_checkUserEmailExist(seqid, iprot, oprot)
      args = read_args(iprot, CheckUserEmailExist_args)
      result = CheckUserEmailExist_result.new()
      begin
        result.success = @handler.checkUserEmailExist(args.email)
      rescue ServiceErrorException => se
        result.se = se
      end
      write_result(result, oprot, 'checkUserEmailExist', seqid)
    end

    def process_getFacebookId(seqid, iprot, oprot)
      args = read_args(iprot, GetFacebookId_args)
      result = GetFacebookId_result.new()
      begin
        result.success = @handler.getFacebookId(args.user_id)
      rescue ServiceErrorException => se
        result.se = se
      rescue BadArgumentException => ba
        result.ba = ba
      rescue NoDataFoundException => ndf
        result.ndf = ndf
      end
      write_result(result, oprot, 'getFacebookId', seqid)
    end

    def process_setMedia(seqid, iprot, oprot)
      args = read_args(iprot, SetMedia_args)
      result = SetMedia_result.new()
      begin
        result.success = @handler.setMedia(args.media)
      rescue ServiceErrorException => se
        result.se = se
      end
      write_result(result, oprot, 'setMedia', seqid)
    end

    def process_startMediaTransaction(seqid, iprot, oprot)
      args = read_args(iprot, StartMediaTransaction_args)
      result = StartMediaTransaction_result.new()
      begin
        result.success = @handler.startMediaTransaction(args.fingerprint, args.user_id, args.facet_id, args.mode)
      rescue ServiceErrorException => se
        result.se = se
      rescue BadArgumentException => ba
        result.ba = ba
      rescue NoDataFoundException => ndf
        result.ndf = ndf
      end
      write_result(result, oprot, 'startMediaTransaction', seqid)
    end

    def process_stopMediaTransaction(seqid, iprot, oprot)
      args = read_args(iprot, StopMediaTransaction_args)
      result = StopMediaTransaction_result.new()
      begin
        result.success = @handler.stopMediaTransaction(args.token)
      rescue ServiceErrorException => se
        result.se = se
      rescue BadArgumentException => ba
        result.ba = ba
      rescue NoDataFoundException => ndf
        result.ndf = ndf
      end
      write_result(result, oprot, 'stopMediaTransaction', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Ping_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Ping_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetFacet_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    FACET_ID = 1

    FIELDS = {
      FACET_ID => {:type => ::Thrift::Types::I32, :name => 'facet_id'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetFacet_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => Facet},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetFacetList_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    USER_ID = 1

    FIELDS = {
      USER_ID => {:type => ::Thrift::Types::I32, :name => 'user_id'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetFacetList_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => Facet}},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class SetFacet_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    FACET = 1

    FIELDS = {
      FACET => {:type => ::Thrift::Types::STRUCT, :name => 'facet', :class => Facet}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class SetFacet_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1
    FN = 2

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException},
      FN => {:type => ::Thrift::Types::STRUCT, :name => 'fn', :class => ForbiddenNameException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class SetFacetImage_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    FACET_ID = 1
    IMAGE_URL = 2

    FIELDS = {
      FACET_ID => {:type => ::Thrift::Types::I32, :name => 'facet_id'},
      IMAGE_URL => {:type => ::Thrift::Types::STRING, :name => 'image_url'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class SetFacetImage_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class CheckFacetNameExist_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    FACET_NAME = 1

    FIELDS = {
      FACET_NAME => {:type => ::Thrift::Types::STRING, :name => 'facet_name'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class CheckFacetNameExist_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1
    FN = 2

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException},
      FN => {:type => ::Thrift::Types::STRUCT, :name => 'fn', :class => ForbiddenNameException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetUser_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    WEBSESSION_ID = 1

    FIELDS = {
      WEBSESSION_ID => {:type => ::Thrift::Types::STRING, :name => 'websession_id'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetUser_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => User},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class CheckUserEmailExist_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    EMAIL = 1

    FIELDS = {
      EMAIL => {:type => ::Thrift::Types::STRING, :name => 'email'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class CheckUserEmailExist_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetFacebookId_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    USER_ID = 1

    FIELDS = {
      USER_ID => {:type => ::Thrift::Types::I32, :name => 'user_id'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GetFacebookId_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1
    BA = 2
    NDF = 3

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException},
      BA => {:type => ::Thrift::Types::STRUCT, :name => 'ba', :class => BadArgumentException},
      NDF => {:type => ::Thrift::Types::STRUCT, :name => 'ndf', :class => NoDataFoundException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class SetMedia_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    MEDIA = 1

    FIELDS = {
      MEDIA => {:type => ::Thrift::Types::STRUCT, :name => 'media', :class => Media}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class SetMedia_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class StartMediaTransaction_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    FINGERPRINT = 1
    USER_ID = 2
    FACET_ID = 3
    MODE = 4

    FIELDS = {
      FINGERPRINT => {:type => ::Thrift::Types::STRING, :name => 'fingerprint'},
      USER_ID => {:type => ::Thrift::Types::I32, :name => 'user_id'},
      FACET_ID => {:type => ::Thrift::Types::I32, :name => 'facet_id'},
      MODE => {:type => ::Thrift::Types::I32, :name => 'mode', :enum_class => MediaTransactionMode}
    }

    def struct_fields; FIELDS; end

    def validate
      unless @mode.nil? || MediaTransactionMode::VALID_VALUES.include?(@mode)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field mode!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class StartMediaTransaction_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1
    BA = 2
    NDF = 3

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException},
      BA => {:type => ::Thrift::Types::STRUCT, :name => 'ba', :class => BadArgumentException},
      NDF => {:type => ::Thrift::Types::STRUCT, :name => 'ndf', :class => NoDataFoundException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class StopMediaTransaction_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    TOKEN = 1

    FIELDS = {
      TOKEN => {:type => ::Thrift::Types::STRING, :name => 'token'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class StopMediaTransaction_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    SE = 1
    BA = 2
    NDF = 3

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
      SE => {:type => ::Thrift::Types::STRUCT, :name => 'se', :class => ServiceErrorException},
      BA => {:type => ::Thrift::Types::STRUCT, :name => 'ba', :class => BadArgumentException},
      NDF => {:type => ::Thrift::Types::STRUCT, :name => 'ndf', :class => NoDataFoundException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

