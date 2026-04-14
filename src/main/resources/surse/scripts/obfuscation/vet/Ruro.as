package obfuscation.vet
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import controls.Label;
   import filters.Filters;
   import flash.display.BitmapData;
   import flash.text.TextFormat;
   
   public class Ruro extends PooledObject implements GraphicEffect
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const hahylefiw:Number = 100;
      
      private static const fawy:Number = 250;
      
      private static const reqacu:Number = 300;
      
      private static const rug:Number = 1000;
      
      private static const napaladeg:Number = 100;
      
      private static var label:Label = new Label();
      
      private var sprite:Sprite3D;
      
      private var time:int;
      
      private var z:Number;
      
      private var origin:Vector3 = new Vector3();
      
      private var container:Scene3DContainer;
      
      private var biq:Number;
      
      private var kafoqofot:Number;
      
      public function Ruro(_arg_1:Pool)
      {
         super(_arg_1);
         this.sprite = new Sprite3D(0,0);
         this.sprite.perspectiveScale = false;
         this.sprite.material = new TextureMaterial(null,false,false);
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
         this.sprite.depthTest = false;
         label.size = 16;
         label.setFormat(new TextFormat("MyriadPro"));
         label.filters = Filters.SHADOW_FILTERS;
      }
      
      public static function start(_arg_1:Vector3, _arg_2:uint, _arg_3:int) : void
      {
         var _local_4:Ruro = Ruro(battleService.getObjectPool().getObject(Ruro));
         _local_4.init(_arg_1,_arg_2,_arg_3);
         battleService.getBattleScene3D().addGraphicEffect(_local_4);
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = battleService.getBattleScene3D().vujez();
         this.container.addChild(this.sprite);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         this.sprite.x = this.origin.x + this.z * this.biq;
         this.sprite.y = this.origin.y + this.z * this.kafoqofot;
         this.sprite.z = this.origin.z + this.z;
         this.time += _arg_1;
         var _local_3:Number = this.z < hahylefiw ? Number(rug) : Number(napaladeg);
         this.z += _local_3 * _arg_1 * 0.001;
         if(this.z < fawy)
         {
            this.sprite.alpha = 1;
         }
         else
         {
            this.sprite.alpha = (reqacu - this.z) / (reqacu - fawy);
            if(this.sprite.alpha < 0)
            {
               this.sprite.alpha = 0;
               return false;
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.sprite.alpha = 0;
      }
      
      private function init(_arg_1:Vector3, _arg_2:uint, _arg_3:int) : void
      {
         this.origin.copy(_arg_1);
         this.time = 0;
         this.z = 0;
         this.biq = Math.random() - 0.5;
         this.kafoqofot = Math.random() - 0.5;
         label.text = _arg_3.toString();
         label.color = _arg_2;
         var _local_4:BitmapData = new BitmapData(60,20,true,0);
         _local_4.draw(label);
         TextureMaterial(this.sprite.material).texture = _local_4;
         this.sprite.width = _local_4.width;
         this.sprite.height = _local_4.height;
         this.sprite.calculateBounds();
      }
   }
}

