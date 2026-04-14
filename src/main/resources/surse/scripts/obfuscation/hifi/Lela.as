package obfuscation.hifi
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.types.Long;
   import flash.media.Sound;
   import obfuscation.mujusaqim.MessageColor;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Lela
   {
      
      private static const UID_PATTERN:String = "%USERNAME%";
      
      [Inject]
      public static var battleService:BattlefieldModel = OSGi.getInstance().getService(BattleService) as BattlefieldModel;
      
      public function Lela()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function nojomugik(_arg_1:String, _arg_2:String) : void
      {
         this.notification(_arg_1,_arg_2,SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,int(_arg_1)))).sound);
      }
      
      [Obfuscation(rename="false")]
      public function notificationBonusContainsUid(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:String = _arg_1.replace(UID_PATTERN,_arg_2);
         this.notification(_arg_1,_local_3,null);
      }
      
      private function notification(_arg_1:String, _arg_2:String, _arg_3:Sound) : void
      {
         if(_arg_3 != null)
         {
            battleService.getBattleRunner().lokezi().nekile(_arg_3);
         }
         var _local_4:Tupebeput = Tupebeput(OSGi.getInstance().getService(Tupebeput));
         _local_4.tagew(MessageColor.bivyzafo,_arg_2);
      }
   }
}

