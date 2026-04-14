package alternativa.tanks.model.item.skins
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class AvailableSkinsAdapt implements AvailableSkins
   {
      
      private var object:IGameObject;
      
      private var impl:AvailableSkins;
      
      public function AvailableSkinsAdapt(_arg_1:IGameObject, _arg_2:AvailableSkins)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getSkins() : Vector.<Object>
      {
         var result:Vector.<Object> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getSkins();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

