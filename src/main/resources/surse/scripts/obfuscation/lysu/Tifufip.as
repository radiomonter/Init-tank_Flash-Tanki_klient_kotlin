package obfuscation.lysu
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.utils.Dictionary;
   import obfuscation.rofa.Jyj;
   
   public class Tifufip extends PooledObject implements GraphicEffect
   {
      
      private static const kejut:ConsoleVarFloat = new ConsoleVarFloat("beam_zoffset",100,0,1000);
      
      private static const ryquwu:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private var tin:Qofivyby;
      
      private var alive:Boolean;
      
      private var object:Object3D;
      
      private var dib:Vector3 = new Vector3();
      
      private var gywag:Dictionary;
      
      private var container:Scene3DContainer;
      
      public function Tifufip(_arg_1:Pool)
      {
         super(_arg_1);
         this.tin = new Qofivyby(1,1,1,0);
      }
      
      public function init(_arg_1:Object3D, _arg_2:Vector3, _arg_3:Sivebu, _arg_4:Dictionary) : void
      {
         this.object = _arg_1;
         this.dib.copy(_arg_2);
         this.tin.gig(_arg_3.cemar,_arg_3.henipaz);
         this.tin.nelokoreh(_arg_3.mypezi);
         this.tin.mugylyvef = _arg_3.mugylyvef;
         this.luwena(_arg_3.quzegoqi);
         this.tin.wusojofu(_arg_3.hoci);
         this.tin.alpha = _arg_3.alpha;
         this.alive = true;
         this.gywag = _arg_4;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         ryquwu.x = this.object.x;
         ryquwu.y = this.object.y;
         ryquwu.z = this.object.z + kejut.value;
         direction.diff(this.dib,ryquwu);
         this.tin.setLength(direction.length());
         direction.normalize();
         Jyj.moruqogi(this.tin,ryquwu,direction,_arg_2.position);
         this.tin.update(_arg_1 * 0.001);
         return this.alive;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.tin);
         this.gywag[this.tin] = true;
      }
      
      public function destroy() : void
      {
         this.object = null;
         this.container.removeChild(this.tin);
         this.tin.setMaterialToAllFaces(null);
         delete this.gywag[this.tin];
         this.gywag = null;
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function luwena(_arg_1:Number) : void
      {
         this.tin.setWidth(_arg_1);
         this.tin.fubabetor(_arg_1);
      }
   }
}

