package alternativa.tanks.model.bonus.showing.items
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   
   public class BonusItemAdapt implements BonusItem
   {
      
      private var object:IGameObject;
      
      private var impl:BonusItem;
      
      public function BonusItemAdapt(_arg_1:IGameObject, _arg_2:BonusItem)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getItem() : BonusItemCC
      {
         var result:BonusItemCC = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getItem();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

