package obfuscation.johek
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.battlefield.BattleModel;
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import obfuscation.fatik.Modipykor;
   import obfuscation.fatik.Zer;
   import obfuscation.kyvubyqu.Fovynakok;
   import obfuscation.kyvubyqu.Wofobyju;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   
   public class Tytuhe extends Wofobyju implements Fovynakok, ObjectLoadPostListener, ObjectUnloadListener, BattleModel
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Tytuhe()
      {
         super();
      }
      
      public function hapyqyv() : BattleType
      {
         return BattleType.DM;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         battleService.lipa(new Kavem());
         battleService.nygeq(new Cata());
         battleService.cocuk(new Mifycutez());
         battleService.sipase(this.gemokir());
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         battleService.lipa(null);
         battleService.nygeq(null);
         battleService.cocuk(null);
         battleService.sipase(null);
      }
      
      public function gemokir() : Zer
      {
         return new Modipykor();
      }
   }
}

