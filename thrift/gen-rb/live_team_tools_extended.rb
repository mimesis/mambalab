#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'live_team_tools'
require 'ltt_types'

    module GameService
      module LiveTeamToolsExtended
        class Client < GameService::LiveTeamTools::Client 
          include ::Thrift::Client

          def createRoomInstanceByRoomName(roomName)
            send_createRoomInstanceByRoomName(roomName)
            return recv_createRoomInstanceByRoomName()
          end

          def send_createRoomInstanceByRoomName(roomName)
            send_message('createRoomInstanceByRoomName', CreateRoomInstanceByRoomName_args, :roomName => roomName)
          end

          def recv_createRoomInstanceByRoomName()
            result = receive_message(CreateRoomInstanceByRoomName_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise result.rnde unless result.rnde.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'createRoomInstanceByRoomName failed: unknown result')
          end

          def createRoomInstanceByRoomNameOnLeastLoadedServer(roomName)
            send_createRoomInstanceByRoomNameOnLeastLoadedServer(roomName)
            return recv_createRoomInstanceByRoomNameOnLeastLoadedServer()
          end

          def send_createRoomInstanceByRoomNameOnLeastLoadedServer(roomName)
            send_message('createRoomInstanceByRoomNameOnLeastLoadedServer', CreateRoomInstanceByRoomNameOnLeastLoadedServer_args, :roomName => roomName)
          end

          def recv_createRoomInstanceByRoomNameOnLeastLoadedServer()
            result = receive_message(CreateRoomInstanceByRoomNameOnLeastLoadedServer_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'createRoomInstanceByRoomNameOnLeastLoadedServer failed: unknown result')
          end

          def listPlayers(room)
            send_listPlayers(room)
            return recv_listPlayers()
          end

          def send_listPlayers(room)
            send_message('listPlayers', ListPlayers_args, :room => room)
          end

          def recv_listPlayers()
            result = receive_message(ListPlayers_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'listPlayers failed: unknown result')
          end

          def kickAllByOwner(roomName)
            send_kickAllByOwner(roomName)
            return recv_kickAllByOwner()
          end

          def send_kickAllByOwner(roomName)
            send_message('kickAllByOwner', KickAllByOwner_args, :roomName => roomName)
          end

          def recv_kickAllByOwner()
            result = receive_message(KickAllByOwner_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise result.rnde unless result.rnde.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'kickAllByOwner failed: unknown result')
          end

          def notifyToAll(mode, title, msg, imageUrl, linkUrl)
            send_notifyToAll(mode, title, msg, imageUrl, linkUrl)
            return recv_notifyToAll()
          end

          def send_notifyToAll(mode, title, msg, imageUrl, linkUrl)
            send_message('notifyToAll', NotifyToAll_args, :mode => mode, :title => title, :msg => msg, :imageUrl => imageUrl, :linkUrl => linkUrl)
          end

          def recv_notifyToAll()
            result = receive_message(NotifyToAll_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'notifyToAll failed: unknown result')
          end

          def notifyToUser(mode, userId, title, titleArgs, msg, msgArgs, imageUrl, linkUrl)
            send_notifyToUser(mode, userId, title, titleArgs, msg, msgArgs, imageUrl, linkUrl)
            return recv_notifyToUser()
          end

          def send_notifyToUser(mode, userId, title, titleArgs, msg, msgArgs, imageUrl, linkUrl)
            send_message('notifyToUser', NotifyToUser_args, :mode => mode, :userId => userId, :title => title, :titleArgs => titleArgs, :msg => msg, :msgArgs => msgArgs, :imageUrl => imageUrl, :linkUrl => linkUrl)
          end

          def recv_notifyToUser()
            result = receive_message(NotifyToUser_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise result.udee unless result.udee.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'notifyToUser failed: unknown result')
          end

          def notifyToRoom(mode, roomName, title, msg, imageUrl, linkUrl)
            send_notifyToRoom(mode, roomName, title, msg, imageUrl, linkUrl)
            return recv_notifyToRoom()
          end

          def send_notifyToRoom(mode, roomName, title, msg, imageUrl, linkUrl)
            send_message('notifyToRoom', NotifyToRoom_args, :mode => mode, :roomName => roomName, :title => title, :msg => msg, :imageUrl => imageUrl, :linkUrl => linkUrl)
          end

          def recv_notifyToRoom()
            result = receive_message(NotifyToRoom_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise result.rnde unless result.rnde.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'notifyToRoom failed: unknown result')
          end

          def mutePlayer(playerId, duration)
            send_mutePlayer(playerId, duration)
            return recv_mutePlayer()
          end

          def send_mutePlayer(playerId, duration)
            send_message('mutePlayer', MutePlayer_args, :playerId => playerId, :duration => duration)
          end

          def recv_mutePlayer()
            result = receive_message(MutePlayer_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'mutePlayer failed: unknown result')
          end

          def unmutePlayer(playerId)
            send_unmutePlayer(playerId)
            return recv_unmutePlayer()
          end

          def send_unmutePlayer(playerId)
            send_message('unmutePlayer', UnmutePlayer_args, :playerId => playerId)
          end

          def recv_unmutePlayer()
            result = receive_message(UnmutePlayer_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'unmutePlayer failed: unknown result')
          end

          def listMutedPlayers()
            send_listMutedPlayers()
            return recv_listMutedPlayers()
          end

          def send_listMutedPlayers()
            send_message('listMutedPlayers', ListMutedPlayers_args)
          end

          def recv_listMutedPlayers()
            result = receive_message(ListMutedPlayers_result)
            return result.success unless result.success.nil?
            raise result.exc unless result.exc.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'listMutedPlayers failed: unknown result')
          end

          def inviteToRoom(userId, roomTitle, roomName)
            send_inviteToRoom(userId, roomTitle, roomName)
            return recv_inviteToRoom()
          end

          def send_inviteToRoom(userId, roomTitle, roomName)
            send_message('inviteToRoom', InviteToRoom_args, :userId => userId, :roomTitle => roomTitle, :roomName => roomName)
          end

          def recv_inviteToRoom()
            result = receive_message(InviteToRoom_result)
            return result.success unless result.success.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'inviteToRoom failed: unknown result')
          end

          def recall(userId, roomName)
            send_recall(userId, roomName)
            return recv_recall()
          end

          def send_recall(userId, roomName)
            send_message('recall', Recall_args, :userId => userId, :roomName => roomName)
          end

          def recv_recall()
            result = receive_message(Recall_result)
            return result.success unless result.success.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'recall failed: unknown result')
          end

          def clearCache()
            send_clearCache()
            recv_clearCache()
          end

          def send_clearCache()
            send_message('clearCache', ClearCache_args)
          end

          def recv_clearCache()
            result = receive_message(ClearCache_result)
            raise result.exc unless result.exc.nil?
            return
          end

          def clearArticleAndItemTypeCache()
            send_clearArticleAndItemTypeCache()
            recv_clearArticleAndItemTypeCache()
          end

          def send_clearArticleAndItemTypeCache()
            send_message('clearArticleAndItemTypeCache', ClearArticleAndItemTypeCache_args)
          end

          def recv_clearArticleAndItemTypeCache()
            result = receive_message(ClearArticleAndItemTypeCache_result)
            raise result.exc unless result.exc.nil?
            return
          end

        end

        class Processor < GameService::LiveTeamTools::Processor 
          include ::Thrift::Processor

          def process_createRoomInstanceByRoomName(seqid, iprot, oprot)
            args = read_args(iprot, CreateRoomInstanceByRoomName_args)
            result = CreateRoomInstanceByRoomName_result.new()
            begin
              result.success = @handler.createRoomInstanceByRoomName(args.roomName)
            rescue GameService::LTTException => exc
              result.exc = exc
            rescue GameService::RoomNameDontExistException => rnde
              result.rnde = rnde
            end
            write_result(result, oprot, 'createRoomInstanceByRoomName', seqid)
          end

          def process_createRoomInstanceByRoomNameOnLeastLoadedServer(seqid, iprot, oprot)
            args = read_args(iprot, CreateRoomInstanceByRoomNameOnLeastLoadedServer_args)
            result = CreateRoomInstanceByRoomNameOnLeastLoadedServer_result.new()
            begin
              result.success = @handler.createRoomInstanceByRoomNameOnLeastLoadedServer(args.roomName)
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'createRoomInstanceByRoomNameOnLeastLoadedServer', seqid)
          end

          def process_listPlayers(seqid, iprot, oprot)
            args = read_args(iprot, ListPlayers_args)
            result = ListPlayers_result.new()
            begin
              result.success = @handler.listPlayers(args.room)
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'listPlayers', seqid)
          end

          def process_kickAllByOwner(seqid, iprot, oprot)
            args = read_args(iprot, KickAllByOwner_args)
            result = KickAllByOwner_result.new()
            begin
              result.success = @handler.kickAllByOwner(args.roomName)
            rescue GameService::LTTException => exc
              result.exc = exc
            rescue GameService::RoomNameDontExistException => rnde
              result.rnde = rnde
            end
            write_result(result, oprot, 'kickAllByOwner', seqid)
          end

          def process_notifyToAll(seqid, iprot, oprot)
            args = read_args(iprot, NotifyToAll_args)
            result = NotifyToAll_result.new()
            begin
              result.success = @handler.notifyToAll(args.mode, args.title, args.msg, args.imageUrl, args.linkUrl)
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'notifyToAll', seqid)
          end

          def process_notifyToUser(seqid, iprot, oprot)
            args = read_args(iprot, NotifyToUser_args)
            result = NotifyToUser_result.new()
            begin
              result.success = @handler.notifyToUser(args.mode, args.userId, args.title, args.titleArgs, args.msg, args.msgArgs, args.imageUrl, args.linkUrl)
            rescue GameService::LTTException => exc
              result.exc = exc
            rescue GameService::UserDontExistException => udee
              result.udee = udee
            end
            write_result(result, oprot, 'notifyToUser', seqid)
          end

          def process_notifyToRoom(seqid, iprot, oprot)
            args = read_args(iprot, NotifyToRoom_args)
            result = NotifyToRoom_result.new()
            begin
              result.success = @handler.notifyToRoom(args.mode, args.roomName, args.title, args.msg, args.imageUrl, args.linkUrl)
            rescue GameService::LTTException => exc
              result.exc = exc
            rescue GameService::RoomNameDontExistException => rnde
              result.rnde = rnde
            end
            write_result(result, oprot, 'notifyToRoom', seqid)
          end

          def process_mutePlayer(seqid, iprot, oprot)
            args = read_args(iprot, MutePlayer_args)
            result = MutePlayer_result.new()
            begin
              result.success = @handler.mutePlayer(args.playerId, args.duration)
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'mutePlayer', seqid)
          end

          def process_unmutePlayer(seqid, iprot, oprot)
            args = read_args(iprot, UnmutePlayer_args)
            result = UnmutePlayer_result.new()
            begin
              result.success = @handler.unmutePlayer(args.playerId)
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'unmutePlayer', seqid)
          end

          def process_listMutedPlayers(seqid, iprot, oprot)
            args = read_args(iprot, ListMutedPlayers_args)
            result = ListMutedPlayers_result.new()
            begin
              result.success = @handler.listMutedPlayers()
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'listMutedPlayers', seqid)
          end

          def process_inviteToRoom(seqid, iprot, oprot)
            args = read_args(iprot, InviteToRoom_args)
            result = InviteToRoom_result.new()
            result.success = @handler.inviteToRoom(args.userId, args.roomTitle, args.roomName)
            write_result(result, oprot, 'inviteToRoom', seqid)
          end

          def process_recall(seqid, iprot, oprot)
            args = read_args(iprot, Recall_args)
            result = Recall_result.new()
            result.success = @handler.recall(args.userId, args.roomName)
            write_result(result, oprot, 'recall', seqid)
          end

          def process_clearCache(seqid, iprot, oprot)
            args = read_args(iprot, ClearCache_args)
            result = ClearCache_result.new()
            begin
              @handler.clearCache()
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'clearCache', seqid)
          end

          def process_clearArticleAndItemTypeCache(seqid, iprot, oprot)
            args = read_args(iprot, ClearArticleAndItemTypeCache_args)
            result = ClearArticleAndItemTypeCache_result.new()
            begin
              @handler.clearArticleAndItemTypeCache()
            rescue GameService::LTTException => exc
              result.exc = exc
            end
            write_result(result, oprot, 'clearArticleAndItemTypeCache', seqid)
          end

        end

        # HELPER FUNCTIONS AND STRUCTURES

        class CreateRoomInstanceByRoomName_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          ROOMNAME = 1

          FIELDS = {
            ROOMNAME => {:type => ::Thrift::Types::STRING, :name => 'roomName'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class CreateRoomInstanceByRoomName_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1
          RNDE = 2

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException},
            RNDE => {:type => ::Thrift::Types::STRUCT, :name => 'rnde', :class => GameService::RoomNameDontExistException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class CreateRoomInstanceByRoomNameOnLeastLoadedServer_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          ROOMNAME = 1

          FIELDS = {
            ROOMNAME => {:type => ::Thrift::Types::STRING, :name => 'roomName'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class CreateRoomInstanceByRoomNameOnLeastLoadedServer_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ListPlayers_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          ROOM = 1

          FIELDS = {
            ROOM => {:type => ::Thrift::Types::STRING, :name => 'room'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ListPlayers_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::I64}},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class KickAllByOwner_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          ROOMNAME = 1

          FIELDS = {
            ROOMNAME => {:type => ::Thrift::Types::STRING, :name => 'roomName'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class KickAllByOwner_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1
          RNDE = 2

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException},
            RNDE => {:type => ::Thrift::Types::STRUCT, :name => 'rnde', :class => GameService::RoomNameDontExistException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class NotifyToAll_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          MODE = 1
          TITLE = 2
          MSG = 3
          IMAGEURL = 4
          LINKURL = 5

          FIELDS = {
            MODE => {:type => ::Thrift::Types::STRING, :name => 'mode'},
            TITLE => {:type => ::Thrift::Types::STRING, :name => 'title'},
            MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'},
            IMAGEURL => {:type => ::Thrift::Types::STRING, :name => 'imageUrl'},
            LINKURL => {:type => ::Thrift::Types::STRING, :name => 'linkUrl'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class NotifyToAll_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class NotifyToUser_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          MODE = 1
          USERID = 2
          TITLE = 3
          TITLEARGS = 4
          MSG = 5
          MSGARGS = 6
          IMAGEURL = 7
          LINKURL = 8

          FIELDS = {
            MODE => {:type => ::Thrift::Types::STRING, :name => 'mode'},
            USERID => {:type => ::Thrift::Types::I64, :name => 'userId'},
            TITLE => {:type => ::Thrift::Types::STRING, :name => 'title'},
            TITLEARGS => {:type => ::Thrift::Types::LIST, :name => 'titleArgs', :element => {:type => ::Thrift::Types::STRING}},
            MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'},
            MSGARGS => {:type => ::Thrift::Types::LIST, :name => 'msgArgs', :element => {:type => ::Thrift::Types::STRING}},
            IMAGEURL => {:type => ::Thrift::Types::STRING, :name => 'imageUrl'},
            LINKURL => {:type => ::Thrift::Types::STRING, :name => 'linkUrl'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class NotifyToUser_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1
          UDEE = 2

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException},
            UDEE => {:type => ::Thrift::Types::STRUCT, :name => 'udee', :class => GameService::UserDontExistException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class NotifyToRoom_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          MODE = 1
          ROOMNAME = 2
          TITLE = 3
          MSG = 4
          IMAGEURL = 5
          LINKURL = 6

          FIELDS = {
            MODE => {:type => ::Thrift::Types::STRING, :name => 'mode'},
            ROOMNAME => {:type => ::Thrift::Types::STRING, :name => 'roomName'},
            TITLE => {:type => ::Thrift::Types::STRING, :name => 'title'},
            MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'},
            IMAGEURL => {:type => ::Thrift::Types::STRING, :name => 'imageUrl'},
            LINKURL => {:type => ::Thrift::Types::STRING, :name => 'linkUrl'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class NotifyToRoom_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1
          RNDE = 2

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException},
            RNDE => {:type => ::Thrift::Types::STRUCT, :name => 'rnde', :class => GameService::RoomNameDontExistException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class MutePlayer_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          PLAYERID = 1
          DURATION = 2

          FIELDS = {
            PLAYERID => {:type => ::Thrift::Types::I64, :name => 'playerId'},
            DURATION => {:type => ::Thrift::Types::I64, :name => 'duration'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class MutePlayer_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class UnmutePlayer_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          PLAYERID = 1

          FIELDS = {
            PLAYERID => {:type => ::Thrift::Types::I64, :name => 'playerId'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class UnmutePlayer_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ListMutedPlayers_args
          include ::Thrift::Struct, ::Thrift::Struct_Union

          FIELDS = {

          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ListMutedPlayers_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          EXC = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::I64}},
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class InviteToRoom_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          USERID = 1
          ROOMTITLE = 2
          ROOMNAME = 3

          FIELDS = {
            USERID => {:type => ::Thrift::Types::I64, :name => 'userId'},
            ROOMTITLE => {:type => ::Thrift::Types::STRING, :name => 'roomTitle'},
            ROOMNAME => {:type => ::Thrift::Types::STRING, :name => 'roomName'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class InviteToRoom_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Recall_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          USERID = 1
          ROOMNAME = 2

          FIELDS = {
            USERID => {:type => ::Thrift::Types::I64, :name => 'userId'},
            ROOMNAME => {:type => ::Thrift::Types::STRING, :name => 'roomName'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Recall_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ClearCache_args
          include ::Thrift::Struct, ::Thrift::Struct_Union

          FIELDS = {

          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ClearCache_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          EXC = 1

          FIELDS = {
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ClearArticleAndItemTypeCache_args
          include ::Thrift::Struct, ::Thrift::Struct_Union

          FIELDS = {

          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ClearArticleAndItemTypeCache_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          EXC = 1

          FIELDS = {
            EXC => {:type => ::Thrift::Types::STRUCT, :name => 'exc', :class => GameService::LTTException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

      end

    end
