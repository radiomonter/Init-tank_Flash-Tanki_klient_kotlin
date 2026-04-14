package obfuscation.sosa
{
   import obfuscation.vafy.Lomyger;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Buje implements Zaq
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Zaq>;
      
      public function Buje(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Zaq>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function cazasu() : Lomyger
      {
         var pify:Lomyger = null;
         var hutace:int = 0;
         var nyfusi:Zaq = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.cazasu();
               hutace += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
   }
}

