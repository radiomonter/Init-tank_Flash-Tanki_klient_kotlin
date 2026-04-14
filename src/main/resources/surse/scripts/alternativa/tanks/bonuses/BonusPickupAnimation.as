package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class BonusPickupAnimation extends PooledObject implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const PICKUP_ANIMATION_TIME:int = 2000;
      
      private static const ALPHA_DURATION:int = PICKUP_ANIMATION_TIME - int(UP_SPEED);
      
      private static const UP_SPEED:Number = 300;
      
      private static const ANGLE_SPEED:Number = 2;
      
      private var bonusMesh:BonusMesh;
      
      private var animationTime:int;
      
      public function BonusPickupAnimation(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function start(_arg_1:BonusMesh) : void
      {
         this.bonusMesh = _arg_1;
         this.animationTime = PICKUP_ANIMATION_TIME;
         battleService.getBattleScene3D().toqok(this,0);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         if(this.animationTime > 0)
         {
            this.playAnimation(_arg_2);
         }
         else
         {
            this.destroy();
         }
      }
      
      private function playAnimation(_arg_1:int) : void
      {
         var _local_2:Number = _arg_1 / 1000;
         this.bonusMesh.addZ((UP_SPEED * this.animationTime / PICKUP_ANIMATION_TIME + UP_SPEED * 0.1) * _local_2);
         this.bonusMesh.addRotationZ((ANGLE_SPEED * this.animationTime / PICKUP_ANIMATION_TIME + ANGLE_SPEED * 0.1) * _local_2);
         if(this.animationTime < ALPHA_DURATION)
         {
            this.bonusMesh.setAlpha(this.animationTime / ALPHA_DURATION);
         }
         this.animationTime -= _arg_1;
      }
      
      private function destroy() : void
      {
         this.bonusMesh.removeFromScene();
         this.bonusMesh.recycle();
         this.bonusMesh = null;
         battleService.getBattleScene3D().qahakuve(this,0);
         recycle();
      }
   }
}

