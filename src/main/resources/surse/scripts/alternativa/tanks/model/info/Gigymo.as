package alternativa.tanks.model.info
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleselect.model.info.Qaru;
   
   public interface Gigymo
   {
      
      function getConstructor() : Qaru;
      
      function getPreviewResource() : ImageResource;
   }
}

