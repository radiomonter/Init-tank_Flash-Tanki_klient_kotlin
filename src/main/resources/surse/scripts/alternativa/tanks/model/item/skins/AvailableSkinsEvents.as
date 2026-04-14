package alternativa.tanks.model.item.skins
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class AvailableSkinsEvents implements AvailableSkins
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function AvailableSkinsEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getSkins() : Vector.<Object>
      {
         var result:Vector.<Object> = null;
         var i:int = 0;
         var m:AvailableSkins = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = AvailableSkins(this.impl[i]);
               result = m.getSkins();
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

