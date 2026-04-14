package alternativa.tanks.model.info
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.info.Qaru;
   
   public class Sefigyke implements Gigymo
   {
      
      private var object:IGameObject;
      
      private var impl:Gigymo;
      
      public function Sefigyke(_arg_1:IGameObject, _arg_2:Gigymo)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getConstructor() : Qaru
      {
         var result:Qaru = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getConstructor();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPreviewResource() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getPreviewResource();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

