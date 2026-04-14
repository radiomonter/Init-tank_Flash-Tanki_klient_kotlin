package forms.userlabel
{
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class ChatUserLabel extends UserLabel
   {
      
      public static const CHAT_MODERATOR_STATUS_ICON_CONT_WIDTH:int = 16;
      
      private static const cmStatusIconClass:Class = ChatUserLabel_cmStatusIconClass;
      
      private static const goldStatusIconClass:Class = ChatUserLabel_goldStatusIconClass;
      
      private static const silverStatusIconClass:Class = ChatUserLabel_silverStatusIconClass;
      
      private static const bronzeStatusIconClass:Class = ChatUserLabel_bronzeStatusIconClass;
      
      private static const bitmapDatas:Dictionary = new Dictionary();
      
      bitmapDatas[ChatModeratorLevel.COMMUNITY_MANAGER] = new cmStatusIconClass().bitmapData;
      bitmapDatas[ChatModeratorLevel.ADMINISTRATOR] = new goldStatusIconClass().bitmapData;
      bitmapDatas[ChatModeratorLevel.MODERATOR] = new silverStatusIconClass().bitmapData;
      bitmapDatas[ChatModeratorLevel.CANDIDATE] = new bronzeStatusIconClass().bitmapData;
      
      protected var _chatModeratorLevel:ChatModeratorLevel;
      
      protected var _needDrawAdditionalIcons:Boolean = this._chatModeratorLevel != ChatModeratorLevel.NONE;
      
      public function ChatUserLabel(_arg_1:String, _arg_2:Boolean = true)
      {
         super(_arg_1);
      }
      
      override protected function createAdditionalIcons() : void
      {
         var _local_1:Bitmap = null;
         _local_1 = null;
         if(this._needDrawAdditionalIcons)
         {
            _local_1 = new Bitmap(bitmapDatas[this._chatModeratorLevel]);
            _local_1.x = RANK_ICON_CONT_WIDTH + 1;
            _local_1.y = 3;
            shadowContainer.addChild(_local_1);
         }
      }
      
      override protected function getAdditionalIconsWidth() : Number
      {
         return !this._needDrawAdditionalIcons ? Number(0) : Number(CHAT_MODERATOR_STATUS_ICON_CONT_WIDTH);
      }
   }
}

