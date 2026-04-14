package alternativa.tanks.model.bonus.showing.items
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   
   public class BonusItemEvents implements BonusItem
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<BonusItem>;
      
      public function BonusItemEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<BonusItem>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getItem() : BonusItemCC
      {
         var result:BonusItemCC = null;
         var i:int = 0;
         var m:BonusItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getItem();
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

