package projects.tanks.clients.flash.resources.object3ds
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class IObject3DSEvents implements IObject3DS
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<IObject3DS>;
      
      public function IObject3DSEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<IObject3DS>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getResource3DS() : Tanks3DSResource
      {
         var result:Tanks3DSResource = null;
         var i:int = 0;
         var m:IObject3DS = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getResource3DS();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

