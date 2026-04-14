package platform.client.models.commons.periodtime
{
   public class TimePeriodModelCC
   {
      
      private var _isEnabled:Boolean;
      
      private var _isTimeless:Boolean;
      
      private var _timeLeftInSeconds:int;
      
      private var _timeToStartInSeconds:int;
      
      public function TimePeriodModelCC(_arg_1:Boolean = false, _arg_2:Boolean = false, _arg_3:int = 0, _arg_4:int = 0)
      {
         super();
         this._isEnabled = _arg_1;
         this._isTimeless = _arg_2;
         this._timeLeftInSeconds = _arg_3;
         this._timeToStartInSeconds = _arg_4;
      }
      
      public function get isEnabled() : Boolean
      {
         return this._isEnabled;
      }
      
      public function set isEnabled(_arg_1:Boolean) : void
      {
         this._isEnabled = _arg_1;
      }
      
      public function get isTimeless() : Boolean
      {
         return this._isTimeless;
      }
      
      public function set isTimeless(_arg_1:Boolean) : void
      {
         this._isTimeless = _arg_1;
      }
      
      public function get timeLeftInSeconds() : int
      {
         return this._timeLeftInSeconds;
      }
      
      public function set timeLeftInSeconds(_arg_1:int) : void
      {
         this._timeLeftInSeconds = _arg_1;
      }
      
      public function get timeToStartInSeconds() : int
      {
         return this._timeToStartInSeconds;
      }
      
      public function set timeToStartInSeconds(_arg_1:int) : void
      {
         this._timeToStartInSeconds = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TimePeriodModelCC [";
         _local_1 += "isEnabled = " + this.isEnabled + " ";
         _local_1 += "isTimeless = " + this.isTimeless + " ";
         _local_1 += "timeLeftInSeconds = " + this.timeLeftInSeconds + " ";
         _local_1 += "timeToStartInSeconds = " + this.timeToStartInSeconds + " ";
         return _local_1 + "]";
      }
   }
}

