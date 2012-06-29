namespace java net.blackmamba.thrift.ltt
namespace php ltt
namespace rb GameService

typedef i32 Int
typedef i64 Long

// user
typedef i64 UserId

// room
typedef string RoomName

exception LTTException {
  1:string message
}

exception RoomNameDontExistException {
  1:string message
}

exception UserDontExistException {
  1:string message
}


service LiveTeamTools {
  Int countAllPlayers() throws (1:LTTException exc),
  list<UserId> listAllPlayers() throws (1:LTTException exc),
  string kickPlayer(1:UserId userId, 2:Long ttl, 3:string msg) throws (1:LTTException exc),
  string kickPlayerFromRoom(1:UserId userId, 2:Long ttl, 3:string title, 4:string msg) throws (1:LTTException exc),
  string broadcastMessage(1:string msg) throws (1:LTTException exc),
  string broadcastNotice(1:string msg) throws (1:LTTException exc),
  bool disconnectUser(1:UserId userId, 2:string serverName) throws (1:LTTException exc)
}


service LiveTeamToolsExtended extends LiveTeamTools {

    // Fonctions de gestion des rooms
  string createRoomInstanceByRoomName(1:RoomName roomName) throws (1:LTTException exc, 2:RoomNameDontExistException rnde),
  string createRoomInstanceByRoomNameOnLeastLoadedServer(1:RoomName roomName) throws (1:LTTException exc),
  list<UserId> listPlayers(1:RoomName room) throws (1:LTTException exc),
  bool kickAllByOwner(1:RoomName roomName) throws (1:LTTException exc, 2:RoomNameDontExistException rnde),

  // BRM notifications
  //possible values for mode : Alert, PopUp
  bool notifyToAll(1:string mode, 2:string title, 3:string msg, 4:string imageUrl, 5:string linkUrl) throws (1:LTTException exc),
  bool notifyToUser(1:string mode, 2:UserId userId, 3:string title, 4: list<string> titleArgs, 5:string msg, 6:list<string> msgArgs, 7:string imageUrl, 8:string linkUrl) throws (1:LTTException exc, 2:UserDontExistException udee),
  bool notifyToRoom(1:string mode, 2:RoomName roomName, 3:string title, 4:string msg, 5:string imageUrl, 6:string linkUrl) throws (1:LTTException exc, 2:RoomNameDontExistException rnde),

  // Moderation
  bool mutePlayer(1:UserId playerId, 2:i64 duration) throws (1:LTTException exc),
  bool unmutePlayer(1:UserId playerId) throws (1:LTTException exc),
  list<UserId> listMutedPlayers() throws (1:LTTException exc),
  bool inviteToRoom(1:UserId userId, 2:string roomTitle, 3:RoomName roomName),
  bool recall(1:UserId userId, 2:RoomName roomName),
  void clearCache() throws (1:LTTException exc),
  void clearArticleAndItemTypeCache() throws (1:LTTException exc)

}

