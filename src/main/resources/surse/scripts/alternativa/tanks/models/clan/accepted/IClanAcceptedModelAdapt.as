package alternativa.tanks.models.clan.accepted
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanAcceptedModelAdapt implements IClanAcceptedModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanAcceptedModel;
      
      public function IClanAcceptedModelAdapt(_arg_1:IGameObject, _arg_2:IClanAcceptedModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getAcceptedUsers() : Vector.<String>
      {
         var result:Vector.<String> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getAcceptedUsers();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

