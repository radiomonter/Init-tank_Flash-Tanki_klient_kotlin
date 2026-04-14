package alternativa.tanks.models.user.incoming
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanUserIncomingModelEvents implements IClanUserIncomingModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanUserIncomingModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getIncomingClans() : Vector.<String>
      {
         var result:Vector.<String> = null;
         var i:int = 0;
         var m:IClanUserIncomingModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserIncomingModel(this.impl[i]);
               result = m.getIncomingClans();
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

