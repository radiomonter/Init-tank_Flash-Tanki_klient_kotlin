package obfuscation.kek
{
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.utils.TextureMaterialRegistry;
   
   public class Nanuj implements MipMappingService
   {
      
      private var byrivisoc:Boolean;
      
      private var fupojikiw:Vector.<TextureMaterialRegistry> = new Vector.<TextureMaterialRegistry>();
      
      public function Nanuj()
      {
         super();
      }
      
      public function kewyfu() : Boolean
      {
         return this.byrivisoc;
      }
      
      public function setMipMapping(_arg_1:Boolean) : void
      {
         var _local_2:TextureMaterialRegistry = null;
         if(this.byrivisoc != _arg_1)
         {
            this.byrivisoc = _arg_1;
            for each(_local_2 in this.fupojikiw)
            {
               _local_2.setMipMapping(_arg_1);
            }
         }
      }
      
      public function vurure() : void
      {
         this.setMipMapping(!this.byrivisoc);
      }
      
      public function taronyvyn(_arg_1:TextureMaterialRegistry) : void
      {
         this.fupojikiw.push(_arg_1);
         _arg_1.setMipMapping(this.byrivisoc);
      }
   }
}

