package obfuscation.jebucahu
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.objects.tank.tankskin.Lehumoryg;
   import alternativa.tanks.battle.scene3d.Object3DNames;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.flash.resources.tanks.Tank3D;
   
   public class Bike
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public static const cojo:Matrix4 = new Matrix4();
      
      private static const EXCLUDED:RegExp = /(box.*|fmnt|muzzle.*|laser)/i;
      
      protected var cycizoheb:Vector.<Mesh>;
      
      protected var rootObject:Object3D;
      
      public function Bike(_arg_1:Tanks3DSResource)
      {
         var _local_3:Dictionary = null;
         var _local_2:Object3D = null;
         var _local_4:int = 0;
         var _local_5:Mesh = null;
         var _local_6:Mesh = null;
         var _local_7:Object3DContainer = null;
         var _local_8:Object3D = null;
         var _local_9:Object3DContainer = null;
         this.cycizoheb = new Vector.<Mesh>();
         _local_3 = null;
         super();
         for each(_local_2 in _arg_1.objects)
         {
            if(_local_2 is Mesh && !EXCLUDED.test(_local_2.name))
            {
               this.cycizoheb.push(_local_2);
            }
         }
         _local_3 = new Dictionary();
         _local_4 = this.cycizoheb.length - 1;
         while(_local_4 >= 0)
         {
            _local_5 = this.cycizoheb[_local_4];
            _local_6 = Tank3D.cloneMesh(_local_5);
            _local_6.mouseEnabled = false;
            _local_7 = _local_3[_local_5];
            if(_local_7 != null)
            {
               vola(_local_7,_local_6);
               _local_7.addChild(_local_6);
               setPosition(_local_6,Vector3.ZERO);
            }
            _local_8 = _arg_1.parents[_arg_1.objects.indexOf(_local_5)];
            if(_local_8 != null)
            {
               if(_local_8 in _local_3)
               {
                  _local_9 = _local_3[_local_8];
               }
               else
               {
                  _local_9 = new Object3DContainer();
                  _local_3[_local_8] = _local_9;
               }
               _local_9.addChild(_local_3[_local_5] != null ? _local_3[_local_5] : _local_6);
               _local_9.mouseEnabled = false;
            }
            this.cycizoheb[this.cycizoheb.indexOf(_local_5)] = _local_6;
            _local_4--;
         }
         this.rootObject = this.cycizoheb[0].parent != null ? this.cycizoheb[0].parent : this.cycizoheb[0];
         this.rootObject.name = Object3DNames.TANK_PART;
         this.rootObject.mouseEnabled = true;
      }
      
      protected static function vola(_arg_1:Object3D, _arg_2:Object3D) : void
      {
         _arg_1.x = _arg_2.x;
         _arg_1.y = _arg_2.y;
         _arg_1.z = _arg_2.z;
      }
      
      protected static function setPosition(_arg_1:Object3D, _arg_2:Vector3) : void
      {
         _arg_1.x = _arg_2.x;
         _arg_1.y = _arg_2.y;
         _arg_1.z = _arg_2.z;
      }
      
      public function fepekizeh(_arg_1:Shadow) : void
      {
         var _local_2:Mesh = null;
         for each(_local_2 in this.cycizoheb)
         {
            _arg_1.addCaster(_local_2);
         }
      }
      
      public function set alpha(_arg_1:Number) : void
      {
         var _local_2:Mesh = null;
         for each(_local_2 in this.cycizoheb)
         {
            _local_2.alpha = _arg_1;
         }
      }
      
      public function destroy() : void
      {
         var _local_1:Mesh = null;
         for each(_local_1 in this.cycizoheb)
         {
            _local_1.setMaterialToAllFaces(null);
         }
         this.cycizoheb = null;
      }
      
      public function gig(_arg_1:TextureMaterial) : void
      {
         var _local_2:Mesh = null;
         for each(_local_2 in this.cycizoheb)
         {
            _local_2.setMaterialToAllFaces(_arg_1);
         }
      }
      
      public function addToScene() : void
      {
         battleService.getBattleScene3D().addObject(this.rootObject);
      }
      
      public function removeFromScene() : void
      {
         battleService.getBattleScene3D().removeObject(this.rootObject);
      }
      
      public function pypof(_arg_1:Matrix4, _arg_2:Lehumoryg, _arg_3:Number) : void
      {
         cojo.setMatrix(_arg_2.how(),_arg_2.fydypopic(),_arg_2.latah() + 1,0,0,_arg_3);
         cojo.append(_arg_1);
         this.rootObject.x = cojo.m03;
         this.rootObject.y = cojo.m13;
         this.rootObject.z = cojo.m23;
         var _local_4:Vector3 = BattleUtils.vemoleg;
         cojo.getEulerAngles(_local_4);
         this.rootObject.rotationX = _local_4.x;
         this.rootObject.rotationY = _local_4.y;
         this.rootObject.rotationZ = _local_4.z;
      }
      
      public function qenokeru() : Object3D
      {
         return this.rootObject;
      }
      
      public function worydadep() : Object3D
      {
         return this.rootObject;
      }
      
      public function getMeshes() : Vector.<Mesh>
      {
         return this.cycizoheb;
      }
      
      public function setColorTransform(_arg_1:ColorTransform) : void
      {
         var _local_2:Mesh = null;
         for each(_local_2 in this.getMeshes())
         {
            _local_2.colorTransform = _arg_1;
         }
      }
   }
}

