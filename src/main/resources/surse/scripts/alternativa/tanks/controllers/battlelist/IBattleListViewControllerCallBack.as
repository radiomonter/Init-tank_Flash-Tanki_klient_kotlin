package alternativa.tanks.controllers.battlelist
{
   import obfuscation.fabuqy.Suvozimi;
   
   public interface IBattleListViewControllerCallBack
   {
      
      function onShowCreateBattleFormButtonClick() : void;
      
      function onBattleListItemClick(param1:String) : void;
      
      function onBattleListItemChange(param1:String) : void;
      
      function onBattleModeChange(param1:Suvozimi, param2:Boolean) : void;
   }
}

