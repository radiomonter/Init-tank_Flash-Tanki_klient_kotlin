package alternativa.tanks.model.item
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   
   public class Zuvojaf implements IBattleItem
   {
      
      private var object:IGameObject;
      
      private var impl:IBattleItem;
      
      public function Zuvojaf(_arg_1:IGameObject, _arg_2:IBattleItem)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getConstructor() : BattleItemCC
      {
         var result:BattleItemCC = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getConstructor();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

