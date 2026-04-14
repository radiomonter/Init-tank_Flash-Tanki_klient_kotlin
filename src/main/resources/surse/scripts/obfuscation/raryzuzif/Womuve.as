package obfuscation.raryzuzif
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Occluder;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.physics.collision.types.AABB;
   import alternativa.proplib.PropLibRegistry;
   import alternativa.proplib.PropLibrary;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.proplib.types.PropData;
   import alternativa.proplib.types.PropGroup;
   import alternativa.tanks.battle.scene3d.Object3DNames;
   import alternativa.utils.clearDictionary;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class Womuve
   {
      
      private static const pydowivar:Matrix3D = new Matrix3D();
      
      private static const doq:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D(),new Vector3D(),new Vector3D(1,1,1)]);
      
      private var vopyboc:PropLibRegistry;
      
      private var liso:Deceg = new Deceg();
      
      private var objects:Vector.<Object3D> = new Vector.<Object3D>();
      
      private var bemu:Vector.<Object3D> = new Vector.<Object3D>();
      
      private var occluders:Vector.<Occluder> = new Vector.<Occluder>();
      
      private var zyfuqi:Vector.<Mesh> = new Vector.<Mesh>();
      
      private var mol:Vector.<Object3D> = new Vector.<Object3D>();
      
      private var jifa:Dictionary = new Dictionary();
      
      private var vuqocyno:Dictionary = new Dictionary();
      
      private var lajapa:AABB = new AABB();
      
      private var peladehu:Dydegifa = new Dydegifa();
      
      private var masizel:Object3D;
      
      private var gyw:Vector.<Object3D> = new Vector.<Object3D>();
      
      public function Womuve(_arg_1:PropLibRegistry)
      {
         super();
         this.vopyboc = _arg_1;
      }
      
      private static function difeb(_arg_1:XML) : String
      {
         var _local_2:String = null;
         var _local_3:XMLList = _arg_1.elements("texture-name");
         if(_local_3.length() > 0)
         {
            _local_2 = _local_3[0];
         }
         return _local_2 || PropMesh.DEFAULT_TEXTURE;
      }
      
      private static function nob(_arg_1:XMLList, _arg_2:Vector3D) : void
      {
         var _local_3:XML = null;
         if(_arg_1.length() > 0)
         {
            _local_3 = _arg_1[0];
            _arg_2.x = parseFloat(_local_3.x);
            _arg_2.y = parseFloat(_local_3.y);
            _arg_2.z = parseFloat(_local_3.z);
         }
         else
         {
            _arg_2.x = _arg_2.y = _arg_2.z = 0;
         }
      }
      
      public function parse(_arg_1:XML) : void
      {
         this.vuro(_arg_1);
         this.peladehu.tus(this.mol);
         if(this.masizel != null)
         {
            (this.masizel as Mesh).calculateVerticesNormalsByAngle(Math.PI / 3,1);
         }
         this.dug();
      }
      
      private function vuro(_arg_1:XML) : void
      {
         var _local_2:XML = null;
         for each(_local_2 in _arg_1.elements("static-geometry").prop)
         {
            this.parseProp(_local_2);
         }
      }
      
      private function parseProp(_arg_1:XML) : void
      {
         var _local_2:PropObject = this.vumykybi(_arg_1);
         if(_local_2 != null)
         {
            if(_local_2 is PropMesh)
            {
               this.cywybucoc(_arg_1,PropMesh(_local_2));
            }
            else if(_local_2 is PropSprite)
            {
               this.mahyquv(_arg_1,PropSprite(_local_2));
            }
         }
      }
      
      private function vumykybi(_arg_1:XML) : PropObject
      {
         var _local_2:String = _arg_1.attribute("library-name");
         var _local_3:String = _arg_1.attribute("group-name");
         var _local_4:String = _arg_1.@name;
         var _local_5:PropLibrary = this.vopyboc.getLibrary(_local_2);
         if(_local_5 == null)
         {
            return null;
         }
         var _local_6:PropGroup = _local_5.rootGroup.getGroupByName(_local_3);
         if(_local_6 == null)
         {
            return null;
         }
         var _local_7:PropData = _local_6.getPropByName(_local_4);
         if(_local_7 == null)
         {
            return null;
         }
         return _local_7.getDefaultState().getDefaultObject();
      }
      
      private function cywybucoc(_arg_1:XML, _arg_2:PropMesh) : void
      {
         if(_arg_1.@name == "Billboard")
         {
            this.nofajah(_arg_1,_arg_2);
         }
         else
         {
            this.tynoh(_arg_1,_arg_2);
         }
      }
      
      private function nofajah(_arg_1:XML, _arg_2:PropMesh) : void
      {
         var _local_3:Mesh = null;
         _local_3 = Mesh(_arg_2.object.clone());
         _local_3.calculateFacesNormals();
         _local_3.calculateVerticesNormalsByAngle(0);
         _local_3.sorting = Sorting.DYNAMIC_BSP;
         _local_3.name = Object3DNames.dyhan;
         this.zyfuqi.push(_local_3);
         var _local_4:String = difeb(_arg_1);
         this.liso.bykyziku(_arg_2,_local_4,_local_3,"display");
         var _local_5:Vector3D = doq[0];
         nob(_arg_1.position,_local_5);
         this.lajapa.addPoint(_local_5.x,_local_5.y,_local_5.z);
         var _local_6:Vector3D = doq[1];
         nob(_arg_1.rotation,_local_6);
         _local_3.x = _local_5.x;
         _local_3.y = _local_5.y;
         _local_3.z = _local_5.z;
         _local_3.rotationZ = _local_6.z;
         this.objects.push(_local_3);
      }
      
      private function tynoh(_arg_1:XML, _arg_2:PropMesh) : void
      {
         var _local_3:Mesh = Mesh(_arg_2.object.clone());
         var _local_4:Vector3D = doq[0];
         nob(_arg_1.position,_local_4);
         _local_3.x = _local_4.x;
         _local_3.y = _local_4.y;
         _local_3.z = _local_4.z;
         this.lajapa.addPoint(_local_4.x,_local_4.y,_local_4.z);
         var _local_5:Vector3D = doq[1];
         nob(_arg_1.rotation,_local_5);
         _local_3.rotationZ = _local_5.z;
         var _local_6:String = difeb(_arg_1);
         this.mol.push(_local_3);
         this.jifa[_local_3] = _arg_2;
         this.vuqocyno[_local_3] = _local_6;
         this.gim(_arg_2,doq);
         if(_arg_1.@name == "Elka")
         {
            this.masizel = _local_3;
         }
      }
      
      private function gim(_arg_1:PropMesh, _arg_2:Vector.<Vector3D>) : void
      {
         var _local_3:Occluder = null;
         var _local_4:Matrix3D = null;
         var _local_5:Occluder = null;
         if(_arg_1.occluders != null)
         {
            pydowivar.recompose(_arg_2);
            for each(_local_3 in _arg_1.occluders)
            {
               _local_4 = _local_3.matrix;
               _local_4.append(pydowivar);
               _local_5 = Occluder(_local_3.clone());
               _local_5.matrix = _local_4;
               this.occluders.push(_local_5);
            }
         }
      }
      
      private function mahyquv(_arg_1:XML, _arg_2:PropSprite) : void
      {
         var _local_3:Vector3D = null;
         var _local_4:Sprite3D = Sprite3D(_arg_2.object.clone());
         if(_arg_1.@name.indexOf("Shar") >= 0)
         {
            this.gyw.push(_local_4);
            _local_3 = doq[0];
            nob(_arg_1.position,_local_3);
            _local_4.x = _local_3.x;
            _local_4.y = _local_3.y;
            _local_4.z = _local_3.z;
            _local_4.name = _arg_1.@name;
            return;
         }
         _local_4.shadowMapAlphaThreshold = 0;
         _local_4.softAttenuation = 80;
         this.bemu.push(_local_4);
         var _local_5:Vector3D = doq[0];
         nob(_arg_1.position,_local_5);
         _local_4.x = _local_5.x;
         _local_4.y = _local_5.y;
         _local_4.z = _local_5.z;
         _local_4.width = _arg_2.scale;
         this.liso.mynu(_arg_2,_local_4);
      }
      
      private function dug() : void
      {
         var _local_1:Object3D = null;
         var _local_2:Mesh = null;
         var _local_3:BSP = null;
         for each(_local_1 in this.mol)
         {
            _local_2 = _local_1 as Mesh;
            _local_3 = new BSP();
            _local_3.name = Object3DNames.dyhan;
            _local_3.createTree(_local_2,true);
            _local_3.x = _local_2.x;
            _local_3.y = _local_2.y;
            _local_3.z = _local_2.z;
            _local_3.rotationZ = _local_2.rotationZ;
            this.liso.pigi(this.jifa[_local_2],this.vuqocyno[_local_2],_local_3);
            this.objects.push(_local_3);
            if(_local_2 == this.masizel)
            {
               this.masizel = _local_3;
            }
         }
         this.mol.length = 0;
         clearDictionary(this.jifa);
         clearDictionary(this.vuqocyno);
      }
      
      public function clear() : void
      {
         this.vopyboc = null;
         this.liso.clear();
         this.objects.length = 0;
         this.bemu.length = 0;
         this.occluders.length = 0;
         this.zyfuqi.length = 0;
         this.masizel = null;
         this.gyw.length = 0;
      }
      
      public function getObjects() : Vector.<Object3D>
      {
         return this.objects;
      }
      
      public function molaki() : Vector.<Object3D>
      {
         return this.bemu;
      }
      
      public function fuwydoqi() : Vector.<Occluder>
      {
         return this.occluders;
      }
      
      public function wecy() : Vector.<Mesh>
      {
         return this.zyfuqi;
      }
      
      public function meq() : Vector.<Kedetino>
      {
         return this.liso.hahizory();
      }
      
      public function lypeb() : AABB
      {
         return this.lajapa;
      }
      
      public function husy() : Object3D
      {
         return this.masizel;
      }
      
      public function wyfelem() : Vector.<Object3D>
      {
         return this.gyw;
      }
   }
}

