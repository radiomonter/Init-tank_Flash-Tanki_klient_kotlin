package alternativa.tanks.model.garage.rankupsupplybonus
{
   import alternativa.tanks.gui.RankUpSupplyBonusAlert;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.IRankUpSupplyBonusModelBase;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.RankUpSupplyBonusInfo;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.RankUpSupplyBonusModelBase;
   
   public class RankUpSupplyBonusModel extends RankUpSupplyBonusModelBase implements IRankUpSupplyBonusModelBase
   {
      
      public function RankUpSupplyBonusModel()
      {
         super();
      }
      
      public function showRankUpSupplyBonusAlerts(_arg_1:Vector.<RankUpSupplyBonusInfo>) : void
      {
         var _local_2:RankUpSupplyBonusInfo = null;
         for each(_local_2 in _arg_1)
         {
            new RankUpSupplyBonusAlert(_local_2);
         }
      }
   }
}

