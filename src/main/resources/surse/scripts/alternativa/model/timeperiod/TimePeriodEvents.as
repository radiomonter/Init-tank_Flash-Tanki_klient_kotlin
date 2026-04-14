package alternativa.model.timeperiod
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class TimePeriodEvents implements TimePeriod
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<TimePeriod>;
      
      public function TimePeriodEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<TimePeriod>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function isEnabled() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isEnabled();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function isTimeless() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isTimeless();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getModelLoadingTimeInMillis() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getModelLoadingTimeInMillis();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeLeftInSeconds() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTimeLeftInSeconds();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeToStartInSeconds() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTimeToStartInSeconds();
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

