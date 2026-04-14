package obfuscation.jahuj
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.sfx.BonusCrystalsEffectUtils;
   import obfuscation.gasovufe.Ribawekot;
   import obfuscation.gasovufe.Wuv;
   import obfuscation.kofen.Vector3d;
   import obfuscation.mujusaqim.MessageColor;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class BattleGoldBonusesModel extends Ribawekot implements Wuv, ObjectLoadListener
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      public static const cenagy:int = 800;
      
      public function BattleGoldBonusesModel()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function wyhasu(_arg_1:ClientObject, _arg_2:Boolean) : void
      {
         if(_arg_1 != null)
         {
            this.pyfos(_arg_1,TanksLocale.TEXT_BATTLE_GOLD_TAKEN,_arg_2);
         }
      }
      
      private function pyfos(_arg_1:ClientObject, _arg_2:String, _arg_3:Boolean) : void
      {
         var _local_3:ISpace = null;
         var _local_4:IGameObject = null;
         var _local_5:Tupebeput = null;
         var _local_6:Vector3d = BonusCrystalsEffectUtils.getTargetPosition(_arg_1);
         if(_arg_3)
         {
            BonusCrystalsEffectUtils.drawEffectForCatcherPosition(_local_6,cenagy);
         }
         var _local_7:Vector3 = new Vector3(_local_6.x,_local_6.y,_local_6.z + 300);
         var _local_8:String = userInfoService.kiq(_arg_1.id);
         if(_local_8 != null)
         {
            _local_5 = Tupebeput(OSGi.getInstance().getService(Tupebeput));
            _local_5.tagew(MessageColor.bivyzafo,_local_8 + " " + localeService.getText(_arg_2));
            _local_5.logUserAction(_arg_1.id,localeService.getText(_arg_2),null);
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
      }
   }
}

