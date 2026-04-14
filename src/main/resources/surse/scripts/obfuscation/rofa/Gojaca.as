package obfuscation.rofa
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Gojaca extends PooledObject implements GraphicEffect
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var tol:Decal;
      
      private var position:Vector3 = new Vector3();
      
      private var muzicaju:Vector3 = new Vector3();
      
      private var material:TextureMaterial;
      
      private var radius:Number;
      
      private var wymot:int;
      
      private var fadeTime:int;
      
      private var woq:int;
      
      public function Gojaca(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function init(_arg_1:Vector3, _arg_2:TextureMaterial, _arg_3:Vector3, _arg_4:Number, _arg_5:int, _arg_6:int) : void
      {
         this.position.copy(_arg_1);
         this.muzicaju.copy(_arg_3);
         this.radius = _arg_4;
         this.material = _arg_2;
         this.wymot = _arg_5;
         this.fadeTime = _arg_6;
         this.woq = _arg_6;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.tol = battleService.getBattleScene3D().kequ(this.position,this.muzicaju,this.radius,this.material);
         if(this.tol == null)
         {
            this.kill();
         }
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.woq > 0)
         {
            if(this.wymot > 0)
            {
               this.wymot -= _arg_1;
            }
            else
            {
               this.woq -= _arg_1;
               if(this.tol != null)
               {
                  this.tol.alpha = this.woq / this.fadeTime;
               }
            }
            return true;
         }
         return false;
      }
      
      public function destroy() : void
      {
         if(this.tol != null)
         {
            battleService.getBattleScene3D().vomuh(this.tol);
            this.tol = null;
         }
         this.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.woq = 0;
      }
   }
}

