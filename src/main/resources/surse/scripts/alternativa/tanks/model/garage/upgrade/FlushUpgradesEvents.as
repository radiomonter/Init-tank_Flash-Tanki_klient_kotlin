package alternativa.tanks.model.garage.upgrade
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class FlushUpgradesEvents implements FlushUpgrades
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<FlushUpgrades>;
      
      public function FlushUpgradesEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         var _loc3_:int = 0;
         super();
         this.object = param1;
         this.impl = new Vector.<FlushUpgrades>();
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function flushToServer(delayUpgrades:DelayUpgrades, item:IGameObject) : void
      {
         var i:int = 0;
         var m:FlushUpgrades = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.flushToServer(delayUpgrades,item);
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

