package platform.client.fp10.core.registry.impl
{
   import alternativa.types.Long;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.type.ISpace;
   
   public class SpaceRegistryImpl implements SpaceRegistry
   {
      
      private var _spaces:Vector.<ISpace> = new Vector.<ISpace>();
      
      private var _currentSpace:ISpace;
      
      public function SpaceRegistryImpl()
      {
         super();
      }
      
      public function addSpace(_arg_1:ISpace) : void
      {
         this._spaces.push(_arg_1);
      }
      
      public function removeSpace(_arg_1:ISpace) : void
      {
         var _local_2:int = this._spaces.indexOf(_arg_1);
         if(_local_2 < 0)
         {
            throw new Error("Space not found: " + _arg_1.id);
         }
         this._spaces.splice(_local_2,1);
         if(this._currentSpace == _arg_1)
         {
            this._currentSpace = null;
         }
      }
      
      public function get spaces() : Vector.<ISpace>
      {
         return this._spaces;
      }
      
      public function getSpace(_arg_1:Long) : ISpace
      {
         var _local_2:ISpace = null;
         for each(_local_2 in this._spaces)
         {
            if(_local_2.id == _arg_1)
            {
               return _local_2;
            }
         }
         return null;
      }
      
      public function get currentSpace() : ISpace
      {
         return this._currentSpace;
      }
      
      public function set currentSpace(_arg_1:ISpace) : void
      {
         this._currentSpace = _arg_1;
      }
   }
}

