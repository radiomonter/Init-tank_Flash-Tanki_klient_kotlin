package obfuscation.pygame
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Leku implements Meca
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Meca>;
      
      public function Leku(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Meca>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function damik(sydi:String) : void
      {
         var hutace:int = 0;
         var nyfusi:Meca = null;
         var vody:String = sydi;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               nyfusi.damik(vody);
               hutace += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

