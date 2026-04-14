package alternativa.tanks.models.user.outgoing
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanUserOutgoingModelAdapt implements IClanUserOutgoingModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanUserOutgoingModel;
      
      public function IClanUserOutgoingModelAdapt(_arg_1:IGameObject, _arg_2:IClanUserOutgoingModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getOutgoingClans() : Vector.<String>
      {
         var result:Vector.<String> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getOutgoingClans();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

