package alternativa.tanks.model.item
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Qeharesi implements BattleItem
   {
      
      private var object:IGameObject;
      
      private var impl:BattleItem;
      
      public function Qeharesi(_arg_1:IGameObject, _arg_2:BattleItem)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function onAddFriend(param1:String) : void
      {
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.onAddFriend(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function onDeleteFriend(param1:String) : void
      {
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.onDeleteFriend(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

