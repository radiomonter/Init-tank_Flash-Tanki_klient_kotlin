package alternativa.tanks.models.battle.battlefield
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattlefieldEventsEvents implements BattlefieldEvents
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<BattlefieldEvents>;
      
      public function BattlefieldEventsEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<BattlefieldEvents>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function notedeg() : void
      {
         var hutace:int = 0;
         var nyfusi:BattlefieldEvents = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               nyfusi.notedeg();
               hutace += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

