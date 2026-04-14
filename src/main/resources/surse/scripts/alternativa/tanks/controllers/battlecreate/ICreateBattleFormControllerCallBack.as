package alternativa.tanks.controllers.battlecreate
{
   import obfuscation.fabuqy.Suvozimi;
   
   public interface ICreateBattleFormControllerCallBack
   {
      
      function onCreateBattle() : void;
      
      function onBattleNameChange() : void;
      
      function onMapChange() : void;
      
      function onThemeChange() : void;
      
      function onPlayersNumberChange() : void;
      
      function onTimeLimitChange() : void;
      
      function onScoreLimitChange() : void;
      
      function onBattleNameInFocus() : void;
      
      function onBattleNameOutFocus() : void;
      
      function onSelected(param1:Suvozimi) : void;
      
      function befume() : void;
      
      function niryt() : void;
   }
}

