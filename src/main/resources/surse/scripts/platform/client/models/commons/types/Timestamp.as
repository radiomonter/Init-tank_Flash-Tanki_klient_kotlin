package platform.client.models.commons.types
{
   public class Timestamp
   {
      
      private var _day:int;
      
      private var _hours:int;
      
      private var _minutes:int;
      
      private var _month:int;
      
      private var _seconds:int;
      
      private var _year:int;
      
      public function Timestamp(_arg_1:int = 0, _arg_2:int = 0, _arg_3:int = 0, _arg_4:int = 0, _arg_5:int = 0, _arg_6:int = 0)
      {
         super();
         this._day = _arg_1;
         this._hours = _arg_2;
         this._minutes = _arg_3;
         this._month = _arg_4;
         this._seconds = _arg_5;
         this._year = _arg_6;
      }
      
      public function get day() : int
      {
         return this._day;
      }
      
      public function set day(_arg_1:int) : void
      {
         this._day = _arg_1;
      }
      
      public function get hours() : int
      {
         return this._hours;
      }
      
      public function set hours(_arg_1:int) : void
      {
         this._hours = _arg_1;
      }
      
      public function get minutes() : int
      {
         return this._minutes;
      }
      
      public function set minutes(_arg_1:int) : void
      {
         this._minutes = _arg_1;
      }
      
      public function get month() : int
      {
         return this._month;
      }
      
      public function set month(_arg_1:int) : void
      {
         this._month = _arg_1;
      }
      
      public function get seconds() : int
      {
         return this._seconds;
      }
      
      public function set seconds(_arg_1:int) : void
      {
         this._seconds = _arg_1;
      }
      
      public function get year() : int
      {
         return this._year;
      }
      
      public function set year(_arg_1:int) : void
      {
         this._year = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "Timestamp [";
         _local_1 += "day = " + this.day + " ";
         _local_1 += "hours = " + this.hours + " ";
         _local_1 += "minutes = " + this.minutes + " ";
         _local_1 += "month = " + this.month + " ";
         _local_1 += "seconds = " + this.seconds + " ";
         _local_1 += "year = " + this.year + " ";
         return _local_1 + "]";
      }
   }
}

