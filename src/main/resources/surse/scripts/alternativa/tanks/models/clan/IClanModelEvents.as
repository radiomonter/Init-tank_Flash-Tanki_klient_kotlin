package alternativa.tanks.models.clan
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanModelEvents implements IClanModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function leaveClan() : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.leaveClan();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function addClanMember(userId:String) : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.addClanMember(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function excludeClanMember(userId:String) : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.excludeClanMember(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function rejectRequest(userId:String) : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.rejectRequest(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function acceptRequest(userId:String) : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.acceptRequest(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function rejectAllRequests() : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.rejectAllRequests();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function inviteByUid(uid:String) : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.inviteByUid(uid);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function revokeRequest(userId:String) : void
      {
         var i:int = 0;
         var m:IClanModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanModel(this.impl[i]);
               m.revokeRequest(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

