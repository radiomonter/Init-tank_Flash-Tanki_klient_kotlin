package obfuscation.rofa
{
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.geom.ColorTransform;
   
   public class Bikuqy extends PooledObject implements GraphicEffect
   {
      
      private var sprite:AnimatedSprite3D;
      
      private var currentFrame:Number;
      
      private var cuvevac:Number;
      
      private var pof:int;
      
      private var dugoceq:Toli;
      
      private var container:Scene3DContainer;
      
      public function Bikuqy(_arg_1:Pool)
      {
         super(_arg_1);
         this.sprite = new AnimatedSprite3D(1,1);
      }
      
      public function init(_arg_1:Number, _arg_2:Number, _arg_3:TextureAnimation, _arg_4:Number, _arg_5:Toli, _arg_6:Number = 0.5, _arg_7:Number = 0.5, _arg_8:ColorTransform = null, _arg_9:Number = 130, _arg_10:String = "normal") : void
      {
         this.kyf(_arg_1,_arg_2,_arg_4,_arg_6,_arg_7,_arg_8,_arg_3,_arg_9,_arg_10);
         _arg_5.zosow(this.sprite);
         this.cuvevac = 0.001 * _arg_3.fps;
         this.dugoceq = _arg_5;
         this.currentFrame = 0;
         this.pof = 1;
      }
      
      public function kaf(_arg_1:Number, _arg_2:Number, _arg_3:TextureAnimation, _arg_4:Number, _arg_5:Toli, _arg_6:Number = 0.5, _arg_7:Number = 0.5, _arg_8:ColorTransform = null, _arg_9:Number = 130, _arg_10:String = "normal", _arg_11:int = -1) : void
      {
         this.init(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8,_arg_9,_arg_10);
         this.pof = _arg_11;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.sprite);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         this.sprite.kiba(this.currentFrame);
         this.currentFrame += _arg_1 * this.cuvevac;
         this.dugoceq.lulik(this.sprite,_arg_2,_arg_1);
         if(this.pof > 0 && this.currentFrame >= this.sprite.getNumFrames())
         {
            --this.pof;
            if(this.pof == 0)
            {
               return false;
            }
            this.currentFrame -= this.sprite.getNumFrames();
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         this.container = null;
         this.sprite.clear();
         this.dugoceq.destroy();
         this.dugoceq = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.pof = 1;
         this.currentFrame = this.sprite.getNumFrames();
      }
      
      private function kyf(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:ColorTransform, _arg_7:TextureAnimation, _arg_8:Number, _arg_9:String) : void
      {
         this.sprite.width = _arg_1;
         this.sprite.height = _arg_2;
         this.sprite.rotation = _arg_3;
         this.sprite.originX = _arg_4;
         this.sprite.originY = _arg_5;
         this.sprite.blendMode = _arg_9;
         this.sprite.colorTransform = _arg_6;
         this.sprite.softAttenuation = _arg_8;
         this.sprite.vuhi(_arg_7);
      }
   }
}

