package alternativa.tanks.model.item
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Lybokan implements BattleItem
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<BattleItem>;
      
      public function Lybokan(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<BattleItem>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function onAddFriend(param1:String) : void
      {
         var i:int = 0;
         var m:BattleItem = null;
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onAddFriend(userId);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function onDeleteFriend(param1:String) : void
      {
         var i:int = 0;
         var m:BattleItem = null;
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onDeleteFriend(userId);
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

