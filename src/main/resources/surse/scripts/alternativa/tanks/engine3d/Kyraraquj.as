package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   
   public class Kyraraquj extends Symub
   {
      
      private var hucymut:Cisi;
      
      public function Kyraraquj(_arg_1:Byp, _arg_2:Cisi)
      {
         super(_arg_1);
         this.hucymut = _arg_2;
         _arg_2.zynucis(this.jywo);
      }
      
      private function jywo() : void
      {
         galyhoj(this.nefaf);
      }
      
      private function nefaf(_arg_1:TextureMaterial) : void
      {
         var _local_2:Galyne = kudewif(_arg_1);
         _arg_1.texture = this.hucymut.getTexture(_local_2.texture);
      }
      
      override protected function getTexture(_arg_1:BitmapData, _arg_2:Boolean) : BitmapData
      {
         return this.hucymut.getTexture(_arg_1,_arg_2);
      }
   }
}

