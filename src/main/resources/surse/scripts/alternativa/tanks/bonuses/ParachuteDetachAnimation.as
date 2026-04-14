package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class ParachuteDetachAnimation extends PooledObject implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const ALPHA_SPEED:Number = 0.001;
      
      private static const XY_SCALE_SPEED:Number = 1 / 4000;
      
      private static const Z_SCALE_SPEED:Number = 1 / 3000;
      
      private var parachute:Parachute;
      
      private var cords:Cords;
      
      private var fallSpeed:Number;
      
      public function ParachuteDetachAnimation(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function start(_arg_1:Parachute, _arg_2:Cords, _arg_3:Number) : void
      {
         this.parachute = _arg_1;
         this.cords = _arg_2;
         this.fallSpeed = _arg_3 / 1000;
         battleService.getBattleScene3D().toqok(this,0);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         this.parachute.setAlpha(this.parachute.getAlpha() - ALPHA_SPEED * _arg_2);
         if(this.parachute.getAlpha() <= 0)
         {
            this.destroy();
         }
         else
         {
            this.cords.setAlpha(this.parachute.getAlpha());
            this.parachute.addZ(-this.fallSpeed * _arg_2);
            _local_3 = _arg_2 * XY_SCALE_SPEED;
            this.parachute.addScaleXY(_local_3);
            this.parachute.addScaleZ(-_arg_2 * Z_SCALE_SPEED);
            this.cords.updateVertices();
         }
      }
      
      private function destroy() : void
      {
         battleService.getBattleScene3D().qahakuve(this,0);
         this.parachute.removeFromScene();
         this.cords.removeFromScene();
         this.parachute.recycle();
         this.parachute = null;
         this.cords.recycle();
         this.cords = null;
         recycle();
      }
   }
}

