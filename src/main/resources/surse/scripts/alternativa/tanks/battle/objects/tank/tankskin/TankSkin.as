package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.battle.scene3d.Object3DNames;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.tank.Kumy;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import obfuscation.jebucahu.Bike;
   import obfuscation.jebucahu.Dego;
   import obfuscation.jebucahu.Jybupow;
   import obfuscation.zosehicat.Husunyb;
   import obfuscation.zosehicat.Now;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DS;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class TankSkin
   {
      
      private static var dyb:TextureMaterialRegistry;
      
      private static const vaponi:int = 1;
      
      private static const kybo:int = 2;
      
      private static const mukam:ColorTransform = new ColorTransform();
      
      private static const qorevokek:Kumy = new Kumy();
      
      private static var mam:Dictionary = new Dictionary();
      
      private static var zufyq:Number = 0.4;
      
      private static var fyposin:Matrix4 = new Matrix4();
      
      private static var cojo:Matrix4 = new Matrix4();
      
      private static var vector:Vector3 = new Vector3();
      
      private var leftTrackSkin:TrackSurfaceSkin;
      
      private var rightTrackSkin:TrackSurfaceSkin;
      
      public var zehosud:Number = 0;
      
      private var dip:SkinMaterials;
      
      private var wala:SkinMaterials;
      
      private var lydih:Lehumoryg;
      
      private var mapuca:Mesh;
      
      private var bobimo:Dego;
      
      private var jyhenohup:Mesh;
      
      private var morumyn:Bike;
      
      private var filu:ColorTransform;
      
      private var kacot:ColorTransform;
      
      private var tyg:ColorTransform = new ColorTransform();
      
      private var tupic:ColorTransform = new ColorTransform();
      
      private var ziry:ColorTransform = new ColorTransform();
      
      public var shadow:Shadow;
      
      private var wupara:BattlefieldModel;
      
      private var registry:TextureMaterialRegistry;
      
      private var wymi:Husunyb = new Now();
      
      private var soj:Shadow;
      
      public function TankSkin(_arg_1:IGameObject, _arg_2:IGameObject, _arg_3:IGameObject, _arg_4:ImageResource)
      {
         super();
         if(dyb == null)
         {
            dyb = TextureMaterialRegistry(OSGi.getInstance().getService(TextureMaterialRegistry));
         }
         this.wupara = BattlefieldModel(OSGi.getInstance().getService(BattleService));
         var _local_5:Tanks3DSResource = IObject3DS(_arg_1.adapt(IObject3DS)).getResource3DS();
         this.lydih = qorevokek.cyhajycip(_local_5);
         var _local_6:Tanks3DSResource = IObject3DS(_arg_2.adapt(IObject3DS)).getResource3DS();
         this.bobimo = qorevokek.tytew(_local_6);
         this.mapuca = this.cloneMesh(this.lydih.mesh);
         this.morumyn = new Bike(_local_6);
         this.morumyn.setColorTransform(this.tupic);
         this.createTrackSkins(this.mapuca);
         var _local_7:IColoring = IColoring(_arg_3.adapt(IColoring));
         this.dip = this.wymi.hidysyv(this,_local_7);
         this.wala = this.wymi.vifucuqir(this,_arg_4);
         this.filu = new ColorTransform(1,0.75,0.6,1,-16,-66,-66);
         this.kacot = new ColorTransform(0.8,1,1.2,1,40,60,70);
         this.nidi();
      }
      
      private static function nuret(_arg_1:ColorTransform, _arg_2:String, _arg_3:ColorTransform, _arg_4:ColorTransform, _arg_5:Number) : void
      {
         var _local_6:Number = _arg_4[_arg_2] - _arg_3[_arg_2];
         _arg_1[_arg_2] = _arg_3[_arg_2] + Math.abs(_arg_5) * _local_6;
      }
      
      private static function copyColorTransform(_arg_1:ColorTransform, _arg_2:ColorTransform) : void
      {
         _arg_2.redMultiplier = _arg_1.redMultiplier;
         _arg_2.greenMultiplier = _arg_1.greenMultiplier;
         _arg_2.blueMultiplier = _arg_1.blueMultiplier;
         _arg_2.alphaMultiplier = _arg_1.alphaMultiplier;
         _arg_2.redOffset = _arg_1.redOffset;
         _arg_2.greenOffset = _arg_1.greenOffset;
         _arg_2.blueOffset = _arg_1.blueOffset;
         _arg_2.alphaOffset = _arg_1.alphaOffset;
      }
      
      private function nidi() : void
      {
         this.soj = new Shadow(128,8,100,1,1,1118498,0.6);
         this.soj.direction = new Vector3D(0,0,-1);
         this.soj.offset = 90;
         this.soj.backFadeRange = 90;
         this.soj.addCaster(this.mapuca);
         this.morumyn.fepekizeh(this.soj);
      }
      
      public function addToScene() : void
      {
         var _local_1:BattleScene3D = this.wupara.getBattleScene3D();
         _local_1.addObject(this.mapuca);
         _local_1.kugyq(this.morumyn);
         _local_1.kaporirum(this.soj);
      }
      
      public function removeFromScene() : void
      {
         var _local_1:BattleScene3D = this.wupara.getBattleScene3D();
         _local_1.removeObject(this.mapuca);
         _local_1.nohibi(this.morumyn);
         _local_1.nam(this.soj);
      }
      
      public function pypof(_arg_1:Number) : void
      {
         if(this.lydih != null && this.bobimo != null)
         {
            fyposin.setMatrix(this.mapuca.x,this.mapuca.y,this.mapuca.z,this.mapuca.rotationX,this.mapuca.rotationY,this.mapuca.rotationZ);
            this.morumyn.pypof(fyposin,this.lydih,_arg_1);
         }
      }
      
      public function muruqad(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         if(this.lydih != null)
         {
            this.mapuca.x = _arg_1.x;
            this.mapuca.y = _arg_1.y;
            this.mapuca.z = _arg_1.z;
            this.mapuca.rotationX = _arg_2.x;
            this.mapuca.rotationY = _arg_2.y;
            this.mapuca.rotationZ = _arg_2.z;
         }
      }
      
      public function dispose() : void
      {
         this.mapuca.setMaterialToAllFaces(null);
         this.morumyn.destroy();
         this.besu(null,null);
         this.liburipa(this.dip);
         this.liburipa(this.wala);
         this.dip = null;
         this.wala = null;
         this.mapuca = null;
         this.morumyn = null;
         this.leftTrackSkin = null;
         this.rightTrackSkin = null;
      }
      
      private function liburipa(_arg_1:SkinMaterials) : void
      {
         dyb.releaseMaterial(_arg_1.cipic);
         dyb.releaseMaterial(_arg_1.feh);
         dyb.releaseMaterial(_arg_1.coru);
         dyb.releaseMaterial(_arg_1.pavew);
      }
      
      public function nyb() : void
      {
         this.mapuca.setMaterialToAllFaces(this.dip.cipic);
         this.morumyn.gig(this.dip.feh);
         this.besu(this.dip.coru,this.dip.pavew);
      }
      
      public function qafubohy() : void
      {
         this.mapuca.setMaterialToAllFaces(this.wala.cipic);
         this.morumyn.gig(this.wala.feh);
         this.besu(this.wala.cipic,this.wala.cipic);
         this.womevuni();
      }
      
      private function besu(_arg_1:Material, _arg_2:Material) : void
      {
         this.leftTrackSkin.nobozin(_arg_1);
         this.rightTrackSkin.nobozin(_arg_2);
      }
      
      public function womevuni() : void
      {
         this.zehosud = 0;
         this.tyg.redMultiplier = 1;
         this.tyg.greenMultiplier = 1;
         this.tyg.blueMultiplier = 1;
         this.tyg.redOffset = 0;
         this.tyg.greenOffset = 0;
         this.tyg.blueOffset = 0;
         copyColorTransform(this.tyg,this.tupic);
      }
      
      public function tuzidy(_arg_1:Number) : void
      {
         var _local_2:ColorTransform = null;
         if(_arg_1 == 0)
         {
            _local_2 = mukam;
         }
         else if(_arg_1 < 0)
         {
            _local_2 = this.kacot;
         }
         else
         {
            _local_2 = this.filu;
         }
         nuret(this.ziry,"redMultiplier",mukam,_local_2,_arg_1);
         nuret(this.ziry,"blueMultiplier",mukam,_local_2,_arg_1);
         nuret(this.ziry,"greenMultiplier",mukam,_local_2,_arg_1);
         nuret(this.ziry,"redOffset",mukam,_local_2,_arg_1);
         nuret(this.ziry,"blueOffset",mukam,_local_2,_arg_1);
         nuret(this.ziry,"greenOffset",mukam,_local_2,_arg_1);
         nuret(this.tupic,"redMultiplier",this.tupic,this.ziry,0.03);
         nuret(this.tupic,"blueMultiplier",this.tupic,this.ziry,0.03);
         nuret(this.tupic,"greenMultiplier",this.tupic,this.ziry,0.03);
         nuret(this.tupic,"redOffset",this.tupic,this.ziry,0.03);
         nuret(this.tupic,"blueOffset",this.tupic,this.ziry,0.03);
         nuret(this.tupic,"greenOffset",this.tupic,this.ziry,0.03);
      }
      
      public function setAlpha(_arg_1:Number) : void
      {
         this.morumyn.alpha = _arg_1;
         this.mapuca.alpha = _arg_1;
         this.soj.alpha = _arg_1 * 0.6;
      }
      
      public function puqym() : Number
      {
         return this.mapuca.alpha;
      }
      
      public function repijumu() : Mesh
      {
         return this.mapuca;
      }
      
      public function rocipaga() : Object3D
      {
         return this.morumyn.qenokeru();
      }
      
      public function qenokeru() : Object3D
      {
         return this.morumyn.qenokeru();
      }
      
      public function worydadep() : Object3D
      {
         return this.morumyn.worydadep();
      }
      
      public function cyhajycip() : Lehumoryg
      {
         return this.lydih;
      }
      
      public function tytew() : Dego
      {
         return this.bobimo;
      }
      
      private function cloneMesh(_arg_1:Mesh) : Mesh
      {
         var _local_2:Mesh = Mesh(_arg_1.clone());
         _local_2.name = Object3DNames.TANK_PART;
         _local_2.colorTransform = this.tupic;
         _local_2.shadowMapAlphaThreshold = 0.1;
         _local_2.calculateVerticesNormalsBySmoothingGroups(0.01);
         return _local_2;
      }
      
      public function wecycymo() : Vector.<Jybupow>
      {
         return this.bobimo.bimehewoc();
      }
      
      public function kogur(_arg_1:Number, _arg_2:Number) : void
      {
         this.leftTrackSkin.move(_arg_1);
         this.rightTrackSkin.move(_arg_2);
      }
      
      private function createTrackSkins(_arg_1:Mesh) : void
      {
         var _local_2:Face = null;
         this.leftTrackSkin = new TrackSurfaceSkin();
         this.rightTrackSkin = new TrackSurfaceSkin();
         for each(_local_2 in _arg_1.faces)
         {
            if(_local_2.material.name == "tracks")
            {
               this.addFaceToTrackSkin(_local_2);
            }
         }
         this.leftTrackSkin.init();
         this.rightTrackSkin.init();
      }
      
      private function addFaceToTrackSkin(_arg_1:Face) : void
      {
         var _local_2:Vertex = _arg_1.vertices[0];
         if(_local_2.x < 0)
         {
            this.leftTrackSkin.addFace(_arg_1);
         }
         else
         {
            this.rightTrackSkin.addFace(_arg_1);
         }
      }
      
      public function hopepyqyj(_arg_1:Vector3) : void
      {
         var _local_2:Matrix4 = Bike.cojo;
         var _local_3:Object3D = this.morumyn.qenokeru();
         _local_2.setMatrix(_local_3.x,_local_3.y,_local_3.z,_local_3.rotationX,_local_3.rotationY,_local_3.rotationZ);
         _local_2.transformVector(this.bobimo.jyba,_arg_1);
      }
   }
}

