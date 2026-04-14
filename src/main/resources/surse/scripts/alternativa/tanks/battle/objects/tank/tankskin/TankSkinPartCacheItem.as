package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.types.Long;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class TankSkinPartCacheItem
   {
      
      private static const luro:String = "details.png";
      
      private static const ciwub:String = "lightmap.jpg";
      
      private static const rutyvez:Object = {};
      
      public var pis:Long;
      
      public var details:BitmapData;
      
      public var lightmap:BitmapData;
      
      public function TankSkinPartCacheItem(_arg_1:Tanks3DSResource)
      {
         super();
         this.pis = _arg_1.id;
         this.details = _arg_1.textures[luro] || this.pywojusi(luro,65280);
         this.lightmap = _arg_1.textures[ciwub] || this.pywojusi(ciwub,8355711);
      }
      
      private function pywojusi(_arg_1:String, _arg_2:uint) : BitmapData
      {
         var _local_3:BitmapData = rutyvez[_arg_1];
         if(_local_3 == null)
         {
            _local_3 = new StubBitmapData(_arg_2);
            rutyvez[_arg_1] = _local_3;
         }
         return _local_3;
      }
      
      public function createTexture(_arg_1:BitmapData) : BitmapData
      {
         var _local_2:BitmapData = new BitmapData(this.lightmap.width,this.lightmap.height,false,0);
         var _local_3:Shape = new Shape();
         _local_3.graphics.beginBitmapFill(_arg_1);
         _local_3.graphics.drawRect(0,0,this.lightmap.width,this.lightmap.height);
         _local_2.draw(_local_3);
         _local_2.draw(this.lightmap,null,null,BlendMode.HARDLIGHT);
         _local_2.draw(this.details);
         _local_3 = null;
         return _local_2;
      }
      
      protected function initMesh(_arg_1:Mesh) : Mesh
      {
         if(_arg_1.sorting != Sorting.DYNAMIC_BSP)
         {
            _arg_1.sorting = Sorting.DYNAMIC_BSP;
            _arg_1.calculateFacesNormals(true);
            _arg_1.optimizeForDynamicBSP();
            _arg_1.threshold = 0.01;
         }
         return _arg_1;
      }
   }
}

