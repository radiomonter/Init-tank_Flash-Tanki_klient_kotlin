package alternativa.tanks.model.item.temporary
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ITemporaryItemEvents implements ITemporaryItem
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<ITemporaryItem>;
      
      public function ITemporaryItemEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<ITemporaryItem>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getStopDate() : Date
      {
         var result:Date = null;
         var i:int = 0;
         var m:ITemporaryItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getStopDate();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function startTiming(param1:int) : void
      {
         var i:int = 0;
         var m:ITemporaryItem = null;
         var remainingTime:int = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.startTiming(remainingTime);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getTimeRemainingInMSec() : Number
      {
         var i:int = 0;
         var m:ITemporaryItem = null;
         var result:Number = NaN;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTimeRemainingInMSec();
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

