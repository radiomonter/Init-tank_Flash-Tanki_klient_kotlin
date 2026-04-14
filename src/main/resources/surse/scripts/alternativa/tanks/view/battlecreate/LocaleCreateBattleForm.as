package alternativa.tanks.view.battlecreate
{
   import alternativa.osgi.service.locale.ILocaleService;
   import obfuscation.ciqinamob.Bycyjoze;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class LocaleCreateBattleForm implements ILocaleCreateBattleForm
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function LocaleCreateBattleForm()
      {
         super();
      }
      
      public function get headerLang() : String
      {
         return localeService.getText(TanksLocale.TEXT_GUI_LANG);
      }
      
      public function get battleNameLabel() : String
      {
         return localeService.getText(TanksLocale.levecu);
      }
      
      public function get mapNameLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_MAP_TYPE_LABEL);
      }
      
      public function get themeMapNameLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_MAP_THEME_LABEL);
      }
      
      public function get stepperMaxPlayersLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_MAX_PLAYERS);
      }
      
      public function get stepperMaxTeamPlayersLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_MAX_TEAM_SIZE);
      }
      
      public function get stepperTimeLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_TIME_LIMIT);
      }
      
      public function get stepperKillsLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_KILLS_LIMIT);
      }
      
      public function get stepperFlagsLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_FLAG_LIMIT);
      }
      
      public function get checkBoxAutoBalanceLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_CHECKBOX_AUTOBALANCE);
      }
      
      public function get checkBoxFriendlyFireLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_CHECKBOX_FRIENDLY_FIRE);
      }
      
      public function get checkBoxNoSuppliesLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_SUPPLIES_TEXT);
      }
      
      public function get checkBoxBonusesLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_BONUS_BOX_TEXT);
      }
      
      public function get checkBoxCrystalsLabel() : String
      {
         return localeService.getText(TanksLocale.mykito);
      }
      
      public function get checkBoxSportModeLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_PRO_BATTLE);
      }
      
      public function get checkBoxUpgradesLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_UPGRADES_TEXT);
      }
      
      public function get checkBoxPrivateBattleLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_CHECKBOX_PRIVATE_BATTLE);
      }
      
      public function get startButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_START);
      }
      
      public function get deathMatchButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_DEATHMATCH);
      }
      
      public function get teamDeathMatchButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_TEAM_DEATHMATCH);
      }
      
      public function get captureTheFlagButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_CAPTURE_THE_FLAG);
      }
      
      public function get dominationButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_CONTROL_THE_POINT);
      }
      
      public function get deathMatchButtonShortLabel() : String
      {
         return "DM";
      }
      
      public function get teamDeathMatchButtonShortLabel() : String
      {
         return "TDM";
      }
      
      public function get captureTheFlagButtonShortLabel() : String
      {
         return "CTF";
      }
      
      public function get dominationButtonShortLabel() : String
      {
         return "CP";
      }
      
      public function get stepperDominationLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_TEAM_SCORE_LIMIT);
      }
      
      public function get checkBoxReArmorLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_REARM_OPTION_TEXT);
      }
      
      public function getThemeName(_arg_1:Bycyjoze) : String
      {
         var _local_2:String = null;
         switch(_arg_1.value)
         {
            case Bycyjoze.SUMMER.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SUMMER);
               break;
            case Bycyjoze.WINTER.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_WINTER);
               break;
            case Bycyjoze.SPACE.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SPACE);
               break;
            case Bycyjoze.SUMMER_DAY.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SUMMER_DAY);
               break;
            case Bycyjoze.EVENING.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_EVENING);
               break;
            case Bycyjoze.HALLOWEEN.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_HALLOWEEN);
               break;
            case Bycyjoze.NEWYEAR.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_NEWYEAR);
               break;
            case Bycyjoze.SUMMER_NIGHT.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SUMMER_NIGHT);
               break;
            case Bycyjoze.WINTER_DAY.value:
               _local_2 = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_WINTER_DAY);
         }
         return _local_2;
      }
   }
}

