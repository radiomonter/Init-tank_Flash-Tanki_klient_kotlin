package alternativa.tanks.engine3d
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkinPartCacheItem;
   import alternativa.tanks.materials.AnimatedPaintMaterial;
   import alternativa.tanks.materials.PaintMaterial;
   import alternativa.utils.TextureMaterialRegistry;
   import alternativa.utils.clearDictionary;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Symub implements TextureMaterialRegistry
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private const materials:Vector.<TextureMaterial> = new Vector.<TextureMaterial>();
      
      private const noteh:Dictionary = new Dictionary();
      
      private const mosyd:Dictionary = new Dictionary();
      
      private var sinib:Hika = new Hika();
      
      private var vokef:Byp;
      
      private var byrivisoc:Boolean;
      
      public function Symub(_arg_1:Byp)
      {
         super();
         this.vokef = _arg_1;
      }
      
      public function desipyvym() : Hika
      {
         return this.sinib;
      }
      
      public function getAnimatedPaint(_arg_1:MultiframeImageResource, _arg_2:TankSkinPartCacheItem) : AnimatedPaintMaterial
      {
         var _local_3:Galyne = null;
         ++this.sinib.tyl;
         var _local_4:String = _arg_1.id.toString() + " " + _arg_2.pis;
         if(_local_4 in this.noteh)
         {
            _local_3 = this.noteh[_local_4];
            ++_local_3.funu;
            return _local_3.material as AnimatedPaintMaterial;
         }
         var _local_5:int = int(_arg_1.data.width / _arg_1.frameWidth);
         var _local_6:int = int(_arg_1.data.height / _arg_1.frameHeight);
         var _local_7:AnimatedPaintMaterial = new AnimatedPaintMaterial(_arg_1.data,_arg_2.lightmap,_arg_2.details,_local_5,_local_6,_arg_1.fps,_arg_1.numFrames,!this.byrivisoc ? int(0) : int(MipMapping.PER_PIXEL));
         _local_3 = this.jufilyh(_local_4,_local_7);
         ++_local_3.funu;
         this.materials.push(_local_7);
         ++this.sinib.redewomyb;
         return _local_7;
      }
      
      public function getPaint(_arg_1:ImageResource, _arg_2:TankSkinPartCacheItem) : PaintMaterial
      {
         var _local_3:Galyne = null;
         ++this.sinib.tyl;
         var _local_4:String = _arg_1.id.toString() + " " + _arg_2.pis;
         if(_local_4 in this.noteh)
         {
            _local_3 = this.noteh[_local_4];
            ++_local_3.funu;
            return _local_3.material as PaintMaterial;
         }
         var _local_5:PaintMaterial = new PaintMaterial(_arg_1.data,_arg_2.lightmap,_arg_2.details,!this.byrivisoc ? int(0) : int(MipMapping.PER_PIXEL));
         _local_3 = this.jufilyh(_local_4,_local_5);
         ++_local_3.funu;
         this.materials.push(_local_5);
         ++this.sinib.redewomyb;
         return _local_5;
      }
      
      public function getMaterial(_arg_1:BitmapData, _arg_2:Boolean = true) : TextureMaterial
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError("Texture is null");
         }
         ++this.sinib.tyl;
         var _local_3:Galyne = this.qazel(_arg_1,_arg_2);
         ++_local_3.funu;
         return _local_3.material;
      }
      
      private function qazel(_arg_1:BitmapData, _arg_2:Boolean) : Galyne
      {
         var _local_3:TextureMaterial = null;
         var _local_4:Galyne = this.noteh[_arg_1];
         if(_local_4 == null)
         {
            _local_3 = this.wylo(_arg_1,_arg_2);
            _local_4 = this.bobavonen(_arg_1,_local_3);
         }
         return _local_4;
      }
      
      private function wylo(_arg_1:BitmapData, _arg_2:Boolean) : TextureMaterial
      {
         var _local_3:BitmapData = this.getTexture(_arg_1,_arg_2);
         var _local_4:TextureMaterial = this.vokef.midicifa(_local_3,this.byrivisoc);
         this.materials.push(_local_4);
         ++this.sinib.redewomyb;
         return _local_4;
      }
      
      protected function getTexture(_arg_1:BitmapData, _arg_2:Boolean) : BitmapData
      {
         throw new Error("Not implemented");
      }
      
      private function jufilyh(_arg_1:String, _arg_2:TextureMaterial) : Galyne
      {
         var _local_3:Galyne = new Galyne(_arg_1,_arg_2);
         this.noteh[_arg_1] = _local_3;
         this.mosyd[_arg_2] = _local_3;
         return _local_3;
      }
      
      private function bobavonen(_arg_1:BitmapData, _arg_2:TextureMaterial) : Galyne
      {
         var _local_3:Galyne = new Galyne(_arg_1,_arg_2);
         this.noteh[_arg_1] = _local_3;
         this.mosyd[_arg_2] = _local_3;
         return _local_3;
      }
      
      public function addMaterial(_arg_1:TextureMaterial) : void
      {
         var _local_2:Galyne = this.bobavonen(null,_arg_1);
         ++_local_2.funu;
         this.mosyd[_arg_1] = _local_2;
         this.materials.push(_arg_1);
      }
      
      public function releaseMaterial(_arg_1:TextureMaterial) : void
      {
         if(_arg_1 == null)
         {
            return;
         }
         var _local_2:Galyne = this.mosyd[_arg_1];
         if(_local_2 != null)
         {
            ++this.sinib.rezanyc;
            --_local_2.funu;
            if(_local_2.funu == 0)
            {
               this.quce(_local_2);
            }
         }
      }
      
      private function quce(_arg_1:Galyne) : void
      {
         ++this.sinib.bokyvi;
         var _local_2:TextureMaterial = _arg_1.material;
         if(_arg_1.tylyv in this.noteh)
         {
            delete this.noteh[_arg_1.tylyv];
         }
         delete this.mosyd[_local_2];
         _arg_1.material = null;
         var _local_3:int = this.materials.indexOf(_local_2);
         this.materials.splice(_local_3,1);
         _local_2.dispose();
      }
      
      protected function galyhoj(_arg_1:Function) : void
      {
         var _local_2:TextureMaterial = null;
         for each(_local_2 in this.materials)
         {
            _arg_1(_local_2);
         }
      }
      
      public function setMipMapping(_arg_1:Boolean) : void
      {
         if(this.byrivisoc != _arg_1)
         {
            if(_arg_1)
            {
               this.enableMipMapping();
            }
            else
            {
               this.gitiz();
            }
         }
      }
      
      private function enableMipMapping() : void
      {
         if(!this.byrivisoc)
         {
            this.byrivisoc = true;
            this.galyhoj(this.disposeResource);
            this.galyhoj(this.qylyf);
         }
      }
      
      private function qylyf(_arg_1:TextureMaterial) : void
      {
         _arg_1.mipMapping = MipMapping.PER_PIXEL;
      }
      
      private function gitiz() : void
      {
         if(this.byrivisoc)
         {
            this.byrivisoc = false;
            this.galyhoj(this.disposeResource);
            this.galyhoj(this.rom);
         }
      }
      
      private function disposeResource(_arg_1:TextureMaterial) : void
      {
         _arg_1.disposeResource();
      }
      
      private function rom(_arg_1:TextureMaterial) : void
      {
         _arg_1.mipMapping = MipMapping.NONE;
      }
      
      public function clear() : void
      {
         this.galyhoj(this.rukanenuq);
         this.materials.length = 0;
         clearDictionary(this.noteh);
         clearDictionary(this.mosyd);
         this.sinib.clear();
      }
      
      private function rukanenuq(_arg_1:TextureMaterial) : void
      {
         _arg_1.texture = null;
      }
      
      protected function kudewif(_arg_1:TextureMaterial) : Galyne
      {
         return this.mosyd[_arg_1];
      }
   }
}

