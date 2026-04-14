package alternativa.tanks.bonuses
{
   import alternativa.tanks.animations.AnimationTrack;
   import alternativa.tanks.animations.KeyFrameAnimation;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class SpawnFlashRenderer extends PooledObject implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const times:Vector.<Number> = Vector.<Number>([0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5]);
      
      private static const values:Vector.<Number> = Vector.<Number>([0,130.05,255,201.45,140.25,104.55,66.3,40.8,25.5,10.2,0]);
      
      private static const animationTrack:AnimationTrack = new AnimationTrack(times,values);
      
      private var colorTransform:AnimatedColorTransform = new AnimatedColorTransform();
      
      private var animation:KeyFrameAnimation = new KeyFrameAnimation(animationTrack,this.colorTransform);
      
      private var bonus:BattleBonus;
      
      public function SpawnFlashRenderer(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function start(_arg_1:BattleBonus) : void
      {
         this.bonus = _arg_1;
         _arg_1.onRemove.add(this.destroy);
         _arg_1.onPickup.add(this.destroy);
         _arg_1.onDestroy.add(this.destroy);
         _arg_1.getBonusMesh().setColorTransform(this.colorTransform.colorTransform);
         battleService.getBattleScene3D().toqok(this,0);
         this.animation.start();
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         if(this.animation.isComplete())
         {
            this.bonus.enableTrigger();
            this.destroy();
         }
         else
         {
            this.animation.update(_arg_2 / 1000);
         }
      }
      
      private function destroy() : void
      {
         battleService.getBattleScene3D().qahakuve(this,0);
         this.bonus.onRemove.remove(this.destroy);
         this.bonus.onPickup.remove(this.destroy);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus.getBonusMesh().setColorTransform(null);
         this.bonus = null;
         recycle();
      }
   }
}

