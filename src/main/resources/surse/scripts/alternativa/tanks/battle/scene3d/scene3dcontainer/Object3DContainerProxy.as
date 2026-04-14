package alternativa.tanks.battle.scene3d.scene3dcontainer
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import flash.utils.Dictionary;
   
   public class Object3DContainerProxy implements Scene3DContainer
   {
      
      private const objects:Dictionary = new Dictionary();
      
      private var container:Object3DContainer = new Object3DContainer();
      
      public function Object3DContainerProxy(_arg_1:Object3DContainer = null)
      {
         super();
         this.zad(_arg_1);
      }
      
      public function addChild(_arg_1:Object3D) : void
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         this.objects[_arg_1] = true;
         this.container.addChild(_arg_1);
      }
      
      public function addChildAt(_arg_1:Object3D, _arg_2:int) : void
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         this.objects[_arg_1] = true;
         this.container.addChildAt(_arg_1,_arg_2);
      }
      
      public function mej(_arg_1:Vector.<Object3D>) : void
      {
         var _local_2:Object3D = null;
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         for each(_local_2 in _arg_1)
         {
            this.addChild(_local_2);
         }
      }
      
      public function removeChild(_arg_1:Object3D) : void
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         if(Boolean(this.objects[_arg_1]))
         {
            delete this.objects[_arg_1];
            this.container.removeChild(_arg_1);
         }
      }
      
      public function zad(_arg_1:Object3DContainer) : void
      {
         var _local_2:Vector.<Object3D> = this.mawifyke();
         this.container = _arg_1 || new Object3DContainer();
         this.mej(_local_2);
      }
      
      private function mawifyke() : Vector.<Object3D>
      {
         var _local_1:* = undefined;
         var _local_2:Vector.<Object3D> = new Vector.<Object3D>();
         for(_local_1 in this.objects)
         {
            delete this.objects[_local_1];
            this.container.removeChild(_local_1);
            _local_2.push(_local_1);
         }
         return _local_2;
      }
   }
}

