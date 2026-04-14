package obfuscation.pikobu
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import controls.base.LabelBase;
   import filters.Filters;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import forms.userlabel.ChatUserLabel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Munano extends ChatUserLabel
   {
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var derys:TankUsersRegistry;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      private var kifetyvoj:LabelBase;
      
      public function Munano(_arg_1:String, _arg_2:Boolean = true)
      {
         var _local_3:ClientObject = null;
         var _local_4:Tank = null;
         var _local_5:Boolean = false;
         _uid = userInfoService.kiq(_arg_1);
         _rank = userInfoService.fotoqasy(_arg_1);
         _chatModeratorLevel = userInfoService.dijolycy(_arg_1);
         _writeInChat = false;
         _blockUserEnable = _arg_2;
         if(battleInfoService.isSpectatorMode())
         {
            _local_3 = BattleController.activeTanks[_arg_1];
            if(_local_3 != null)
            {
               _local_4 = ITankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_local_3).tank;
               if(_local_4 != null)
               {
                  _local_5 = _local_4.state == ClientTankState.neqahi;
               }
            }
         }
         this._focusOnUserEnabled = _local_5;
         super(_arg_1);
         if(!self)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      [Obfuscation(rename="false")]
      override protected function getShadowFilters() : Array
      {
         return Filters.SHADOW_FILTERS;
      }
      
      [Obfuscation(rename="false")]
      protected function hutefa() : Array
      {
         return Filters.SHADOW_ON_OVER_FILTERS;
      }
      
      private function onMouseOut(_arg_1:MouseEvent) : void
      {
         shadowContainer.filters = this.getShadowFilters();
      }
      
      private function onMouseOver(_arg_1:MouseEvent) : void
      {
         shadowContainer.filters = this.hutefa();
      }
      
      [Obfuscation(rename="false")]
      override protected function onMouseClick(_arg_1:MouseEvent) : void
      {
         super.onMouseClick(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      override protected function updateProperties() : void
      {
         setUid(_uid);
         setRank(_rank);
         setFriendState(_friendInfoUpdater.state);
      }
      
      [Obfuscation(rename="false")]
      override protected function createUidLabel() : void
      {
         super.createUidLabel();
         _uidLabel.antiAliasType = AntiAliasType.ADVANCED;
         _uidLabel.thickness = 150;
         _uidLabel.sharpness = 200;
      }
   }
}

