package projects.tanks.client.battleselect.model.battleselect.create
{
   import obfuscation.qedajyt.Juva;
   
   public class BattleCreateCC
   {
      
      private var _battleCreationDisabled:Boolean;
      
      private var _battlesLimits:Vector.<Juva>;
      
      private var _maxRangeLength:int;
      
      public function BattleCreateCC(_arg_1:Boolean = false, _arg_2:Vector.<Juva> = null, _arg_3:int = 0)
      {
         super();
         this._battleCreationDisabled = _arg_1;
         this._battlesLimits = _arg_2;
         this._maxRangeLength = _arg_3;
      }
      
      public function get battleCreationDisabled() : Boolean
      {
         return this._battleCreationDisabled;
      }
      
      public function set battleCreationDisabled(_arg_1:Boolean) : void
      {
         this._battleCreationDisabled = _arg_1;
      }
      
      public function get battlesLimits() : Vector.<Juva>
      {
         return this._battlesLimits;
      }
      
      public function set battlesLimits(_arg_1:Vector.<Juva>) : void
      {
         this._battlesLimits = _arg_1;
      }
      
      public function get maxRangeLength() : int
      {
         return this._maxRangeLength;
      }
      
      public function set maxRangeLength(_arg_1:int) : void
      {
         this._maxRangeLength = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleCreateCC [";
         _local_1 += "battleCreationDisabled = " + this.battleCreationDisabled + " ";
         _local_1 += "battlesLimits = " + this.battlesLimits + " ";
         _local_1 += "maxRangeLength = " + this.maxRangeLength + " ";
         return _local_1 + "]";
      }
   }
}

