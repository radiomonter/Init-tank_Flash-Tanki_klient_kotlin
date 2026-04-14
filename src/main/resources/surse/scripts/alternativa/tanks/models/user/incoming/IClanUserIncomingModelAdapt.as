package alternativa.tanks.models.user.incoming
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanUserIncomingModelAdapt implements IClanUserIncomingModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanUserIncomingModel;
      
      public function IClanUserIncomingModelAdapt(_arg_1:IGameObject, _arg_2:IClanUserIncomingModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getIncomingClans() : Vector.<String>
      {
         var result:Vector.<String> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getIncomingClans();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

