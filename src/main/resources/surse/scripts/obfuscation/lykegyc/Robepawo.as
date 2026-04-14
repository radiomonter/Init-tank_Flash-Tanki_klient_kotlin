package obfuscation.lykegyc
{
   import projects.tanks.client.battlefield.models.bonus.battle.Nasyvozuq;
   
   public class Robepawo
   {
      
      private var dapatelij:Number;
      
      private var _bonuses:Vector.<Nasyvozuq>;
      
      public function Robepawo(_arg_1:Number = 0, _arg_2:Vector.<Nasyvozuq> = null)
      {
         super();
         this.dapatelij = _arg_1;
         this._bonuses = _arg_2;
      }
      
      public function get lugij() : Number
      {
         return this.dapatelij;
      }
      
      public function set lugij(_arg_1:Number) : void
      {
         this.dapatelij = _arg_1;
      }
      
      public function get bonuses() : Vector.<Nasyvozuq>
      {
         return this._bonuses;
      }
      
      public function set bonuses(_arg_1:Vector.<Nasyvozuq>) : void
      {
         this._bonuses = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattlefieldBonusesCC [";
         _local_1 += "bonusFallSpeed = " + this.lugij + " ";
         _local_1 += "bonuses = " + this.bonuses + " ";
         return _local_1 + "]";
      }
   }
}

