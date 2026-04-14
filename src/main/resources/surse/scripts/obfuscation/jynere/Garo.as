package obfuscation.jynere
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.display.BlendMode;
   import obfuscation.rofa.Toli;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Garo extends PooledObject implements GraphicEffect
   {
      
      private static const SIZE:Number = 256;
      
      private static const qutoto:Number = 2;
      
      private static const bejirofa:Class = Desa;
      
      private static const jujamuma:TextureMaterial = new TextureMaterial(new bejirofa().bitmapData,false,true,MipMapping.PER_PIXEL,qutoto);
      
      private static const peb:Class = Pusyca;
      
      private static const najadapo:TextureMaterial = new TextureMaterial(new peb().bitmapData,false,true,MipMapping.PER_PIXEL,qutoto);
      
      private static const tyquvemi:Class = Nebyvozu;
      
      private static const tebuhu:TextureMaterial = new TextureMaterial(new tyquvemi().bitmapData,false,true,MipMapping.PER_PIXEL,qutoto);
      
      private static const pus:Class = Juci;
      
      private static const lepufefi:TextureMaterial = new TextureMaterial(new pus().bitmapData,false,true,MipMapping.PER_PIXEL,qutoto);
      
      private static const mizahimu:Number = 100;
      
      private static const nafi:Number = 300;
      
      private static const cycyvazah:Number = 500;
      
      private static const vuqum:Number = 1000;
      
      private static const nyrifumu:Number = 0.3;
      
      private static const rok:Number = 1.3;
      
      private static const fona:Number = Math.PI / 2;
      
      private static const cyhu:Number = 3;
      
      private var sprite:Sprite3D;
      
      private var lipyf:OmniLight = new OmniLight(0,0,0);
      
      private var container:Scene3DContainer;
      
      private var dugoceq:Toli;
      
      private var alive:Boolean;
      
      private var time:Number;
      
      public function Garo(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.sprite);
         if(GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained)
         {
            _arg_1.addChild(this.lipyf);
         }
      }
      
      public function init(_arg_1:Sprite3D, _arg_2:Toli, _arg_3:Vector3) : void
      {
         this.sprite = _arg_1;
         this.dugoceq = _arg_2;
         _arg_1.width = SIZE;
         _arg_1.height = SIZE;
         _arg_1.originX = 0.5;
         _arg_1.originY = 0.5;
         _arg_1.softAttenuation = 50;
         _arg_1.useLight = false;
         _arg_1.useShadowMap = false;
         _arg_1.shadowMapAlphaThreshold = 2;
         _arg_1.depthMapAlphaThreshold = 2;
         _arg_1.blendMode = BlendMode.ADD;
         if(_arg_1.name.indexOf("1") >= 0)
         {
            _arg_1.material = jujamuma;
            this.lipyf.color = 16727074;
         }
         else if(_arg_1.name.indexOf("2") >= 0)
         {
            _arg_1.material = najadapo;
            this.lipyf.color = 6356736;
         }
         else if(_arg_1.name.indexOf("3") >= 0)
         {
            _arg_1.material = tebuhu;
            this.lipyf.color = 34047;
         }
         else if(_arg_1.name.indexOf("4") >= 0)
         {
            _arg_1.material = lepufefi;
            this.lipyf.color = 16771584;
         }
         this.lipyf.intensity = 0.7;
         this.lipyf.attenuationBegin = nafi;
         this.lipyf.attenuationEnd = vuqum;
         this.lipyf.calculateBounds();
         var _local_4:Number = 200;
         var _local_5:Number = _arg_1.x - _arg_3.x;
         var _local_6:Number = _arg_1.y - _arg_3.y;
         var _local_7:Number = Math.sqrt(_local_5 * _local_5 + _local_6 * _local_6);
         this.lipyf.x = _arg_1.x + _local_5 * _local_4 / _local_7;
         this.lipyf.y = _arg_1.y + _local_6 * _local_4 / _local_7;
         this.lipyf.z = _arg_1.z + _local_4 / 2;
         this.time = Math.random() * cyhu;
         this.alive = true;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         this.dugoceq.lulik(this.sprite,_arg_2,_arg_1);
         var _local_3:Number = _arg_1 / 1000;
         this.time += _local_3;
         this.time %= cyhu;
         var _local_4:Number = Math.sin(Math.PI * 2 * this.time / cyhu) * 0.5 + 0.5;
         var _local_5:Number = nyrifumu + (rok - nyrifumu) * _local_4;
         this.sprite.scaleX = _local_5;
         this.sprite.scaleY = _local_5;
         this.sprite.scaleZ = _local_5;
         this.sprite.rotation += fona * _local_3 * _local_4;
         this.lipyf.attenuationBegin = mizahimu + (nafi - mizahimu) * _local_4;
         this.lipyf.attenuationEnd = cycyvazah + (vuqum - cycyvazah) * _local_4;
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         if(GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained)
         {
            this.container.removeChild(this.lipyf);
         }
         this.sprite = null;
         this.container = null;
         this.dugoceq.destroy();
         this.dugoceq = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}

