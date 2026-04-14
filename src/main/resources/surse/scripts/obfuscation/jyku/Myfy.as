package obfuscation.jyku
{
   public class Myfy
   {
      
      private var jotirihad:Number;
      
      private var relowid:Novawilaj;
      
      private var _target:String;
      
      public function Myfy(_arg_1:Number = 0, _arg_2:Novawilaj = null, _arg_3:String = null)
      {
         super();
         this.jotirihad = _arg_1;
         this.relowid = _arg_2;
         this._target = _arg_3;
      }
      
      public function get qyfuq() : Number
      {
         return this.jotirihad;
      }
      
      public function set qyfuq(_arg_1:Number) : void
      {
         this.jotirihad = _arg_1;
      }
      
      public function get qaluju() : Novawilaj
      {
         return this.relowid;
      }
      
      public function set qaluju(_arg_1:Novawilaj) : void
      {
         this.relowid = _arg_1;
      }
      
      public function get target() : String
      {
         return this._target;
      }
      
      public function set target(_arg_1:String) : void
      {
         this._target = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TargetTankDamage [";
         _local_1 += "damageAmount = " + this.qyfuq + " ";
         _local_1 += "damageIndicatorType = " + this.qaluju + " ";
         _local_1 += "target = " + this.target + " ";
         return _local_1 + "]";
      }
   }
}

