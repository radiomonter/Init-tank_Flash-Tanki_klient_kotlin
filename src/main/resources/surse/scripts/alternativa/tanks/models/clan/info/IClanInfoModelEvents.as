package alternativa.tanks.models.clan.info
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class IClanInfoModelEvents implements IClanInfoModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanInfoModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getClanName() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getClanName();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getClanTag() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getClanTag();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getDescription() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getDescription();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getClanFlag() : ClanFlag
      {
         var result:ClanFlag = null;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getClanFlag();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getRankIndexForAddClan() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getRankIndexForAddClan();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function incomingRequestEnabled() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.incomingRequestEnabled();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getCreatorId() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getCreatorId();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getCreateTime() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getCreateTime();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getUsersCount() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IClanInfoModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanInfoModel(this.impl[i]);
               result = m.getUsersCount();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

