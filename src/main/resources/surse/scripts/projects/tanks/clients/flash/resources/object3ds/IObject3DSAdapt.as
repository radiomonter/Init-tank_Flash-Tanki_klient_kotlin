package projects.tanks.clients.flash.resources.object3ds
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class IObject3DSAdapt implements IObject3DS
   {
      
      private var object:IGameObject;
      
      private var impl:IObject3DS;
      
      public function IObject3DSAdapt(_arg_1:IGameObject, _arg_2:IObject3DS)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getResource3DS() : Tanks3DSResource
      {
         var result:Tanks3DSResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getResource3DS();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

