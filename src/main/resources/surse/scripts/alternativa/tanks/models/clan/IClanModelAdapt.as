package alternativa.tanks.models.clan
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanModelAdapt implements IClanModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanModel;
      
      public function IClanModelAdapt(_arg_1:IGameObject, _arg_2:IClanModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function leaveClan() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.leaveClan();
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function addClanMember(userId:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.addClanMember(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function excludeClanMember(userId:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.excludeClanMember(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function rejectRequest(userId:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.rejectRequest(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function acceptRequest(userId:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.acceptRequest(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function rejectAllRequests() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.rejectAllRequests();
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function inviteByUid(uid:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.inviteByUid(uid);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function revokeRequest(userId:String) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.revokeRequest(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

