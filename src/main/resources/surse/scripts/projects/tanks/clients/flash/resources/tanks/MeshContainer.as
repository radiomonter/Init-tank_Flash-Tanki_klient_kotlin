package projects.tanks.clients.flash.resources.tanks
{
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.objects.Mesh;
   
   public class MeshContainer extends Object3DContainer
   {
      
      private var meshes:Vector.<Mesh> = new Vector.<Mesh>();
      
      public function MeshContainer()
      {
         super();
      }
      
      public function getMeshes() : Vector.<Mesh>
      {
         return this.meshes;
      }
      
      public function setMeshes(_arg_1:Vector.<Mesh>) : void
      {
         var _local_2:Object3DContainer = null;
         this.meshes.push(_arg_1[0]);
         addChild(_arg_1[0]);
         _arg_1[0].x = 0;
         _arg_1[0].y = 0;
         _arg_1[0].z = 0;
         if(_arg_1.length == 1)
         {
            return;
         }
         _local_2 = new Object3DContainer();
         addChild(_local_2);
         _local_2.x = _arg_1[1].x;
         _local_2.y = _arg_1[1].y;
         _local_2.z = _arg_1[1].z;
         _arg_1[1].x = 0;
         _arg_1[1].y = 0;
         _arg_1[1].z = 0;
         var _local_3:int = 1;
         while(_local_3 < _arg_1.length)
         {
            _local_2.addChild(_arg_1[_local_3]);
            this.meshes.push(_arg_1[_local_3]);
            _local_3++;
         }
      }
   }
}

