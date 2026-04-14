package projects.tanks.clients.fp10.libraries.tanksservices.service
{
   import flash.utils.Dictionary;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class TimeOutTruncateConsumers
   {
      
      private const TRUNCATE_PERIOD:int = 300000;
      
      private var _intervalId:uint;
      
      private var _consumersLastAccessTime:Dictionary = new Dictionary();
      
      private var _consumers:Dictionary;
      
      private var _truncateFunction:Function;
      
      public function TimeOutTruncateConsumers()
      {
         super();
         this._intervalId = setInterval(this.truncateOutdatedConsumers,this.TRUNCATE_PERIOD);
      }
      
      public function get truncateFunction() : Function
      {
         return this._truncateFunction;
      }
      
      public function set truncateFunction(_arg_1:Function) : void
      {
         this._truncateFunction = _arg_1;
      }
      
      private function truncateOutdatedConsumers() : void
      {
         var _local_2:IInfoLabelUpdater = null;
         var _local_1:* = undefined;
         if(this.truncateFunction == null)
         {
            return;
         }
         var _local_3:Vector.<String> = new Vector.<String>();
         var _local_4:Number = new Date().time - this.TRUNCATE_PERIOD;
         for(_local_1 in this._consumers)
         {
            _local_2 = this._consumers[_local_1];
            if(_local_2.lastAccessTime < _local_4 && _local_2.visibleLabelsCounter == 0)
            {
               _local_3.push(_local_1);
            }
         }
         if(_local_3.length > 0)
         {
            this.truncateFunction(_local_3);
         }
      }
      
      public function updateLastAccessTime(_arg_1:String) : void
      {
         this._consumersLastAccessTime[_arg_1] = new Date().time;
      }
      
      public function set consumers(_arg_1:Dictionary) : void
      {
         this._consumers = _arg_1;
      }
      
      public function stop() : void
      {
         clearInterval(this._intervalId);
      }
   }
}

