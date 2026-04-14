package alternativa.tanks.model.item.countable
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ICountableItemEvents implements ICountableItem
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<ICountableItem>;
      
      public function ICountableItemEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<ICountableItem>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getCount() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:ICountableItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getCount();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setCount(param1:int) : void
      {
         var i:int = 0;
         var m:ICountableItem = null;
         var value:int = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.setCount(value);
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

