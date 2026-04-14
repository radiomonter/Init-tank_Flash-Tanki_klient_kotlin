package alternativa.tanks.models.clan.info
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class IClanInfoModelAdapt implements IClanInfoModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanInfoModel;
      
      public function IClanInfoModelAdapt(_arg_1:IGameObject, _arg_2:IClanInfoModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getClanName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getClanName();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getClanTag();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getDescription();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getClanFlag();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getRankIndexForAddClan();
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
         try
         {
            Model.object = this.object;
            result = this.impl.incomingRequestEnabled();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getCreatorId();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getCreateTime();
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
         try
         {
            Model.object = this.object;
            result = this.impl.getUsersCount();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

