package obfuscation.myrudatof
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Gehu implements Nebizo
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Nebizo>;
      
      public function Gehu(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Nebizo>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function removePresent(param1:IGameObject) : void
      {
         var i:int = 0;
         var m:Nebizo = null;
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.removePresent(presentItem);
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

