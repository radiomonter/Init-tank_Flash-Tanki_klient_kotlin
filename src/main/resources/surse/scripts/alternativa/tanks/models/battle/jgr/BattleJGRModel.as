package alternativa.tanks.models.battle.jgr
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.battlefield.BattleModel;
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import obfuscation.fatik.Modipykor;
   import obfuscation.fatik.Zer;
   import obfuscation.johek.Cata;
   import obfuscation.johek.Kavem;
   import obfuscation.johek.Mifycutez;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import projects.tanks.client.battleservice.model.battle.jgr.BattleJGRModelBase;
   import projects.tanks.client.battleservice.model.battle.jgr.IBattleJGRModelBase;
   
   public class BattleJGRModel extends BattleJGRModelBase implements IBattleJGRModelBase, BattleModel, ObjectLoadPostListener
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public function BattleJGRModel()
      {
         super();
      }
      
      public function hapyqyv() : BattleType
      {
         return BattleType.JGR;
      }
      
      public function objectLoadedPost() : void
      {
         battleService.lipa(new Kavem());
         battleService.nygeq(new Cata());
         battleService.cocuk(new Mifycutez());
         battleService.sipase(this.gemokir());
      }
      
      public function gemokir() : Zer
      {
         return new Modipykor();
      }
   }
}

