package alternativa.tanks.camera
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   
   public class Zyzy implements Zynomy
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Zyzy()
      {
         super();
      }
      
      public function activate() : void
      {
         this.juvyba().sefu(this);
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      protected function cewubu() : GameCamera
      {
         return this.juvyba().cewubu();
      }
      
      protected function juvyba() : BattleScene3D
      {
         return battleService.getBattleScene3D();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
      }
   }
}

