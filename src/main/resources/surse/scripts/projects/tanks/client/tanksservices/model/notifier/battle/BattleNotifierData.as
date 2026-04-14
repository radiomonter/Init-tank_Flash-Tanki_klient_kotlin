package projects.tanks.client.tanksservices.model.notifier.battle
{
   import projects.tanks.client.tanksservices.model.notifier.AbstractNotifier;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   
   public class BattleNotifierData extends AbstractNotifier
   {
      
      private var _battleData:BattleInfoData;
      
      public function BattleNotifierData(_arg_1:BattleInfoData = null)
      {
         super();
         this._battleData = _arg_1;
      }
      
      public function get battleData() : BattleInfoData
      {
         return this._battleData;
      }
      
      public function set battleData(_arg_1:BattleInfoData) : void
      {
         this._battleData = _arg_1;
      }
      
      override public function toString() : String
      {
         var _local_1:* = "BattleNotifierData [";
         _local_1 += "battleData = " + this.battleData + " ";
         _local_1 += super.toString();
         return _local_1 + "]";
      }
   }
}

