package forms.userlabel
{
   import flash.events.MouseEvent;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   
   public class LobbyChatUserLabel extends ChatUserLabel
   {
      
      public function LobbyChatUserLabel(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:ChatModeratorLevel)
      {
         _uid = _arg_2;
         _rank = _arg_3;
         _writeInChat = true;
         _forciblySubscribeFriend = true;
         _blockUserEnable = true;
         inviteBattleEnable = true;
         _chatModeratorLevel = _arg_4;
         super(_arg_1);
      }
      
      override protected function updateProperties() : void
      {
         setUid(_uid);
         setRank(_rank);
         setFriendState(_friendInfoUpdater.state);
      }
      
      override protected function onMouseClick(_arg_1:MouseEvent) : void
      {
         var _local_2:Boolean = false;
         var _local_3:Boolean = false;
         var _local_4:Boolean = false;
         var _local_5:Boolean = false;
         var _local_6:Boolean = false;
         if(userPropertiesService.userId == _userId)
         {
            dispatchEvent(new UserLabelEvent(UserLabelEvent.CLICK_WITH_CTRL,_uid,true));
            return;
         }
         if(_arg_1.ctrlKey)
         {
            dispatchEvent(new UserLabelEvent(UserLabelEvent.CLICK_WITH_CTRL,_uid,true));
         }
         else
         {
            switch(_friendState)
            {
               case FriendState.ACCEPTED:
                  _local_3 = true;
                  break;
               case FriendState.INCOMING:
                  _local_4 = true;
                  _local_5 = true;
                  break;
               case FriendState.OUTGOING:
                  _local_6 = true;
                  break;
               default:
                  _local_2 = true;
            }
            contextMenuService.show(stage.mouseX,stage.mouseY,_userId,_rank,_uid,_local_2,_local_3,_local_4,_local_5,_local_6,_writeInChat,inviteBattleEnable,false,_blockUserEnable);
         }
      }
   }
}

