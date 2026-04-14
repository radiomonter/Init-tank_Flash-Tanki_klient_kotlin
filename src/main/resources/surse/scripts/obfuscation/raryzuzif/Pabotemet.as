package obfuscation.raryzuzif
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   
   public class Pabotemet
   {
      
      [Inject]
      public static var dyb:TextureMaterialRegistry;
      
      private static const muv:String = "display";
      
      private var zyfuqi:Vector.<Mesh> = new Vector.<Mesh>();
      
      private var faces:Vector.<Face> = new Vector.<Face>();
      
      private var material:TextureMaterial;
      
      private var gusipoki:BitmapData;
      
      public function Pabotemet()
      {
         super();
      }
      
      public function add(_arg_1:Mesh) : void
      {
         var _local_2:Face = null;
         this.zyfuqi.push(_arg_1);
         for each(_local_2 in _arg_1.faces)
         {
            this.faces.push(_local_2);
            if(this.material == null)
            {
               this.material = TextureMaterial(_local_2.material);
               this.cuvikyl();
            }
         }
      }
      
      public function setImage(_arg_1:BitmapData) : void
      {
         this.gusipoki = _arg_1;
         this.cuvikyl();
      }
      
      private function cuvikyl() : void
      {
         if(this.material != null && this.gusipoki != null)
         {
            this.material.texture = this.gusipoki;
            this.qyfowyla();
         }
      }
      
      private function qyfowyla() : void
      {
         if(this.zyfuqi.length > 0)
         {
            this.material.resolution = 1;
         }
      }
   }
}

