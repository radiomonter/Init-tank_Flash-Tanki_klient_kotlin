package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ObjectLoadListenerEvents implements ObjectLoadListener
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<ObjectLoadListener>;
      
      public function ObjectLoadListenerEvents(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<ObjectLoadListener>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function objectLoaded() : void
      {
         var i:int = 0;
         var m:ObjectLoadListener = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.objectLoaded();
               i += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

