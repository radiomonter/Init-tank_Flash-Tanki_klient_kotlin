package obfuscation.juha
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import obfuscation.badu.Jytamutid;
   import obfuscation.badu.Wydu;
   import obfuscation.bude.BattleTeam;
   import obfuscation.fabuqy.Suvozimi;
   import obfuscation.syhis.Hegug;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Fafit
   {
      
      [Inject]
      public static var wefu:ColorTransformService;
      
      [Inject]
      public static var suner:TextureMaterialRegistry;
      
      [Inject]
      public static var qapy:ILightingEffectsService;
      
      public static const dyhivoqa:Number = 1000;
      
      public static const junyqanyc:Number = 350;
      
      private static const MAX_PROGRESS:Number = 100;
      
      private static const vibyjela:Number = 1.5;
      
      private var pedestal:BSP;
      
      private var qidufokeb:TextureMaterial;
      
      private var wibigif:TextureMaterial;
      
      private var fozuges:TextureMaterial;
      
      private var sizeqape:TextureMaterial;
      
      private var caru:Rurabyt;
      
      private var lightSource:OmniLight;
      
      private var taqefizo:Wydu;
      
      private var lakyka:Wydu;
      
      private var byzetusa:Wydu;
      
      public function Fafit(_arg_1:String, _arg_2:BattleScene3D, _arg_3:Hegug)
      {
         super();
         this.pedestal = fipisoqiz(_arg_3.pedestal);
         this.fozuges = suner.getMaterial(_arg_3.bluePedestalTexture.data);
         this.wibigif = suner.getMaterial(_arg_3.redPedestalTexture.data);
         this.sizeqape = suner.getMaterial(_arg_3.neutralPedestalTexture.data);
         var _local_4:Jytamutid = qapy.nediqelun(Suvozimi.CP);
         this.taqefizo = _local_4.kycigove(BattleTeam.RED);
         this.lakyka = _local_4.kycigove(BattleTeam.BLUE);
         this.byzetusa = _local_4.kycigove(BattleTeam.NONE);
         this.hupuzylin(_arg_1,_arg_3);
         this.cypaweme(_local_4);
         _arg_2.kyj(this.caru);
         _arg_2.kyj(this.pedestal);
      }
      
      private static function fipisoqiz(_arg_1:Tanks3DSResource) : BSP
      {
         var _local_2:Mesh = Mesh(_arg_1.objects[0]);
         var _local_3:BSP = new BSP();
         _local_3.createTree(_local_2);
         return _local_3;
      }
      
      private static function fuv(_arg_1:BitmapData) : TextureMaterial
      {
         var _local_2:TextureMaterial = suner.getMaterial(_arg_1,false);
         _local_2.resolution = dyhivoqa / _arg_1.width;
         return _local_2;
      }
      
      private static function sysifet(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:int) : Matrix
      {
         var _local_4:int = _arg_2.height;
         var _local_5:Matrix = new Matrix();
         _local_5.tx = (_arg_1.height - _local_4) / 2 - _local_4 * _arg_3;
         _local_5.ty = (_arg_1.height - _local_4) / 2;
         return _local_5;
      }
      
      private static function kaqudila(_arg_1:BitmapData, _arg_2:BitmapData) : Rectangle
      {
         var _local_3:int = _arg_2.height;
         var _local_4:Number = (_arg_1.height - _local_3) / 2;
         return new Rectangle(_local_4,_local_4,_local_3,_local_3);
      }
      
      private static function kunijutuz(_arg_1:BitmapData, _arg_2:BitmapData) : BitmapData
      {
         var _local_3:BitmapData = _arg_1.clone();
         _local_3.copyChannel(_arg_2,_arg_2.rect,new Point(),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
         return _local_3;
      }
      
      private static function sugaz(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Number
      {
         return _arg_1 + (_arg_2 - _arg_1) * _arg_3;
      }
      
      private static function pygalab(_arg_1:uint, _arg_2:uint, _arg_3:Number) : uint
      {
         var _local_4:Number = (_arg_1 >> 16 & 0xFF) / 255;
         var _local_5:Number = (_arg_1 >> 8 & 0xFF) / 255;
         var _local_6:Number = (_arg_1 & 0xFF) / 255;
         var _local_7:Number = (_arg_2 >> 16 & 0xFF) / 255;
         var _local_8:Number = (_arg_2 >> 8 & 0xFF) / 255;
         var _local_9:Number = (_arg_2 & 0xFF) / 255;
         var _local_10:int = sugaz(_local_4,_local_7,_arg_3) * 255;
         var _local_11:int = sugaz(_local_5,_local_8,_arg_3) * 255;
         var _local_12:int = sugaz(_local_6,_local_9,_arg_3) * 255;
         return _local_10 << 16 | _local_11 << 8 | _local_12;
      }
      
      private function cypaweme(_arg_1:Jytamutid) : void
      {
         this.lightSource = new OmniLight(0,_arg_1.vehyvoqi(),_arg_1.nuzomypu());
         this.sag(this.byzetusa);
      }
      
      private function hupuzylin(_arg_1:String, _arg_2:Hegug) : void
      {
         var _local_3:BitmapData = _arg_2.neutralCircle.data.clone();
         var _local_4:BitmapData = _arg_2.blueCircle.data.clone();
         var _local_5:BitmapData = _arg_2.redCircle.data.clone();
         var _local_6:BitmapData = _arg_2.bigLetters.data;
         var _local_7:int = _arg_1.charCodeAt(0) - "A".charCodeAt(0);
         var _local_8:Rectangle = kaqudila(_local_3,_local_6);
         var _local_9:Matrix = sysifet(_local_3,_local_6,_local_7);
         _local_3.draw(_local_6,_local_9,null,BlendMode.NORMAL,_local_8,true);
         _local_4.draw(_local_6,_local_9,null,BlendMode.NORMAL,_local_8,true);
         _local_5.draw(_local_6,_local_9,null,BlendMode.NORMAL,_local_8,true);
         var _local_10:BitmapData = kunijutuz(_local_4,_local_3);
         var _local_11:BitmapData = kunijutuz(_local_5,_local_3);
         var _local_12:TextureMaterial = fuv(_local_3);
         var _local_13:TextureMaterial = fuv(_local_4);
         var _local_14:TextureMaterial = fuv(_local_10);
         var _local_15:TextureMaterial = fuv(_local_5);
         var _local_16:TextureMaterial = fuv(_local_11);
         this.caru = new Rurabyt(dyhivoqa,dyhivoqa,_local_12,_local_14,_local_13,_local_16,_local_15);
      }
      
      public function update(_arg_1:Number, _arg_2:Camera3D) : void
      {
         this.caru.setProgress(_arg_1);
         this.caru.vaciji(_arg_2);
         this.jogo(_arg_1 / MAX_PROGRESS);
      }
      
      public function addToScene(_arg_1:BattleScene3D, _arg_2:Vector3) : void
      {
         this.pedestal.x = _arg_2.x;
         this.pedestal.y = _arg_2.y;
         this.pedestal.z = _arg_2.z;
         _arg_1.addObject(this.pedestal);
         this.caru.x = _arg_2.x;
         this.caru.y = _arg_2.y;
         this.caru.z = _arg_2.z + junyqanyc;
         _arg_1.addObject(this.caru);
         this.lightSource.x = _arg_2.x;
         this.lightSource.y = _arg_2.y;
         this.lightSource.z = _arg_2.z + junyqanyc;
         _arg_1.addObject(this.lightSource);
      }
      
      public function jahycov() : void
      {
         this.zobomu(this.wibigif);
         this.sag(this.taqefizo);
      }
      
      public function tyluna() : void
      {
         this.zobomu(this.fozuges);
         this.sag(this.lakyka);
      }
      
      public function gubiw() : void
      {
         this.zobomu(this.sizeqape);
         this.sag(this.byzetusa);
      }
      
      private function zobomu(_arg_1:TextureMaterial) : void
      {
         if(this.qidufokeb != _arg_1)
         {
            this.qidufokeb = _arg_1;
            this.pedestal.setMaterialToAllFaces(_arg_1);
         }
      }
      
      private function sag(_arg_1:Wydu) : void
      {
         this.lightSource.color = _arg_1.quruqa();
         this.lightSource.intensity = _arg_1.kys();
      }
      
      private function jogo(_arg_1:Number) : void
      {
         var _local_2:uint = _arg_1 < 0 ? uint(this.taqefizo.quruqa()) : uint(this.lakyka.quruqa());
         var _local_3:Number = _arg_1 < 0 ? Number(this.taqefizo.kys()) : Number(this.lakyka.kys());
         this.lightSource.color = pygalab(this.byzetusa.quruqa(),_local_2,Math.pow(Math.abs(_arg_1),vibyjela));
         this.lightSource.intensity = sugaz(this.byzetusa.kys(),_local_3,Math.pow(Math.abs(_arg_1),vibyjela));
      }
   }
}

