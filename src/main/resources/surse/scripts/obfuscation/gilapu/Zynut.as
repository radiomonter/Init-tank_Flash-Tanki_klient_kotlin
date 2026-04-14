package obfuscation.gilapu
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Zynut implements Vosu
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Vosu>;
      
      public function Zynut(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Vosu>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function getEnterPrice() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:Vosu = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getEnterPrice();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeLeftInSec() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:Vosu = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTimeLeftInSec();
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

