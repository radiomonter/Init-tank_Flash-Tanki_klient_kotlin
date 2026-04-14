package alternativa.tanks.models.user.outgoing
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanUserOutgoingModelEvents implements IClanUserOutgoingModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanUserOutgoingModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getOutgoingClans() : Vector.<String>
      {
         var result:Vector.<String> = null;
         var i:int = 0;
         var m:IClanUserOutgoingModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserOutgoingModel(this.impl[i]);
               result = m.getOutgoingClans();
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

