package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.camera.GameCamera;
   
   public class Bulo extends BattleRunnerProvider implements LogicUnit
   {
      
      private static const pudyw:Number = 5 * 0.001;
      
      private static const ALPHA_SPEED:Number = 5 * 0.001;
      
      private static const cajavu:Number = Math.PI / 2;
      
      private var camera:GameCamera;
      
      private var skin:TankSkin;
      
      private var leryfadum:Number;
      
      public function Bulo(_arg_1:GameCamera)
      {
         super();
         this.camera = _arg_1;
         this.leryfadum = cajavu;
      }
      
      public function setSkin(_arg_1:TankSkin) : void
      {
         this.skin = _arg_1;
      }
      
      public function tobosagyv(_arg_1:Number) : void
      {
         this.leryfadum = _arg_1;
      }
      
      public function start() : void
      {
         fahysemas().wop(this);
      }
      
      public function stop() : void
      {
         fahysemas().bapucic(this);
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         this.camera.fov += pudyw * _arg_2;
         if(this.camera.fov > this.leryfadum)
         {
            this.camera.fov = this.leryfadum;
         }
         var _local_3:Number = this.skin.puqym();
         _local_3 += ALPHA_SPEED * _arg_2;
         if(_local_3 > 1)
         {
            _local_3 = 1;
         }
         this.skin.setAlpha(_local_3);
         if(this.camera.fov == this.leryfadum && _local_3 == 1)
         {
            this.stop();
         }
      }
   }
}

