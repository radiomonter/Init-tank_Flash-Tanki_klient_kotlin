package alternativa.tanks.models.clan.accepted
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanAcceptedModelEvents implements IClanAcceptedModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanAcceptedModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getAcceptedUsers() : Vector.<String>
      {
         var result:Vector.<String> = null;
         var i:int = 0;
         var m:IClanAcceptedModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanAcceptedModel(this.impl[i]);
               result = m.getAcceptedUsers();
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

