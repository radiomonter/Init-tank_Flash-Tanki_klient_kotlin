package alternativa.tanks.models.effects.ultimate
{
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.primitives.GeoSphere;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   
   public class SparkleSphereEffect extends PooledObject implements GraphicEffect
   {
      
      private static const directionsMany:Vector.<Vector3D> = calculateDirections(2);
      
      private static const directionsFew:Vector.<Vector3D> = calculateDirections(1);
      
      private static const increaseTime:Number = 0.333;
      
      private var directions:Vector.<Vector3D>;
      
      private var sparklesCount:int;
      
      private var targetMesh:Mesh;
      
      private var isConsumer:Boolean;
      
      private var radius:Number;
      
      private var delay:Number;
      
      private var addScale:Number;
      
      private var sparkles:Vector.<SparkleEffect>;
      
      private var time:Number;
      
      private var container:Scene3DContainer;
      
      private var decreaseTime:Number = 1;
      
      public function SparkleSphereEffect(_arg_1:Pool)
      {
         var _local_2:int = 0;
         super(_arg_1);
         this.sparkles = new Vector.<SparkleEffect>();
         while(_local_2 < directionsMany.length)
         {
            this.sparkles.push(new SparkleEffect());
            _local_2++;
         }
      }
      
      private static function calculateDirections(_arg_1:int) : Vector.<Vector3D>
      {
         var _local_2:int = 0;
         var _local_6:Vertex = null;
         var _local_7:Vector3D = null;
         var _local_8:int = 0;
         var _local_9:Vector3D = null;
         var _local_3:Vector.<Vector3D> = new Vector.<Vector3D>();
         var _local_4:GeoSphere = new GeoSphere(100,_arg_1);
         var _local_5:Vector.<Vertex> = _local_4.vertices;
         for each(_local_6 in _local_5)
         {
            _local_8 = int(_local_3.length);
            _local_2 = 0;
            while(_local_2 < _local_8)
            {
               _local_9 = _local_3[_local_2];
               if(Math.abs(_local_9.x - _local_6.x) < 0.1 && Math.abs(_local_9.y - _local_6.y) < 0.1 && Math.abs(_local_9.z - _local_6.z) < 0.1)
               {
                  break;
               }
               _local_2++;
            }
            if(_local_2 == _local_8)
            {
               _local_3.push(new Vector3D(_local_6.x,_local_6.y,_local_6.z));
            }
         }
         for each(_local_7 in _local_3)
         {
            _local_7.normalize();
         }
         return _local_3;
      }
      
      public function init(_arg_1:TextureMaterial, _arg_2:Mesh, _arg_3:Boolean, _arg_4:ColorTransform) : void
      {
         var _local_5:int = 0;
         var _local_6:SparkleEffect = null;
         this.time = 0;
         this.targetMesh = _arg_2;
         this.isConsumer = _arg_3;
         this.radius = _arg_3 ? 300 : 700;
         this.delay = _arg_3 ? 0.1 : 0;
         this.decreaseTime = _arg_3 ? 1 / 2 : 1;
         this.addScale = _arg_3 ? 0 : 0.5;
         this.directions = _arg_3 ? directionsFew : directionsMany;
         this.sparklesCount = _arg_3 ? int(directionsFew.length) : int(directionsMany.length);
         _local_5 = 0;
         while(_local_5 < directionsMany.length)
         {
            this.sparkles[_local_5].colorTransform = _arg_4;
            this.sparkles[_local_5].visible = _local_5 < this.sparklesCount;
            _local_5++;
         }
         for each(_local_6 in this.sparkles)
         {
            _local_6.init(_arg_1);
         }
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.sparkles.length)
         {
            _arg_1.addChild(this.sparkles[_local_2]);
            _local_2++;
         }
         this.container = _arg_1;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_3:int = 0;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:SparkleEffect = null;
         var _local_7:Vector3D = null;
         var _local_8:Number = 100;
         this.time += _arg_1 / 1000;
         if(this.time <= this.delay)
         {
            _local_3 = 0;
            while(_local_3 < this.sparklesCount)
            {
               _local_6 = this.sparkles[_local_3];
               _local_6.visible = false;
               _local_3++;
            }
            return true;
         }
         if(this.time <= this.delay + increaseTime)
         {
            _local_4 = (this.time - this.delay) / increaseTime;
            _local_4 = Math.pow(_local_4,0.25);
            _local_5 = 1 + _local_4 * this.addScale;
            _local_3 = 0;
            while(_local_3 < this.sparklesCount)
            {
               _local_6 = this.sparkles[_local_3];
               _local_7 = this.directions[_local_3];
               _local_6.visible = true;
               _local_6.x = this.targetMesh.x + _local_7.x * this.radius * _local_4;
               _local_6.y = this.targetMesh.y + _local_7.y * this.radius * _local_4;
               _local_6.z = this.targetMesh.z + _local_7.z * this.radius * _local_4 + _local_8;
               _local_6.scaleX = _local_5;
               _local_6.scaleY = _local_5;
               _local_6.scaleZ = _local_5;
               _local_6.alpha = _local_4;
               _local_3++;
            }
            return true;
         }
         if(this.time <= this.delay + increaseTime + this.decreaseTime)
         {
            _local_4 = 1 - (this.time - this.delay - increaseTime) / this.decreaseTime;
            _local_4 = Math.pow(_local_4,0.3);
            _local_5 = 1 + _local_4 * this.addScale;
            _local_3 = 0;
            while(_local_3 < this.sparklesCount)
            {
               _local_6 = this.sparkles[_local_3];
               _local_7 = this.directions[_local_3];
               _local_6.visible = true;
               _local_6.x = this.targetMesh.x + _local_7.x * this.radius * _local_4;
               _local_6.y = this.targetMesh.y + _local_7.y * this.radius * _local_4;
               _local_6.z = this.targetMesh.z + _local_7.z * this.radius * _local_4 + _local_8;
               _local_6.scaleX = _local_5;
               _local_6.scaleY = _local_5;
               _local_6.scaleZ = _local_5;
               _local_6.alpha = _local_4;
               _local_3++;
            }
            return true;
         }
         return false;
      }
      
      public function destroy() : void
      {
         var _local_1:int = 0;
         while(_local_1 < this.sparkles.length)
         {
            this.container.removeChild(this.sparkles[_local_1]);
            _local_1++;
         }
         this.container = null;
         this.targetMesh = null;
         this.sparkles = null;
      }
      
      public function kill() : void
      {
         this.destroy();
      }
   }
}

