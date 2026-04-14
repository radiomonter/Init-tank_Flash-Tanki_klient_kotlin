package obfuscation.kutyqypy
{
   import alternativa.tanks.bonuses.Bonus;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Hupylaqul implements Zekuzejob
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Zekuzejob>;
      
      public function Hupylaqul(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Zekuzejob>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function tohubyfoj(sydi:String) : Bonus
      {
         var pify:Bonus = null;
         var hutace:int = 0;
         var nyfusi:Zekuzejob = null;
         var duq:String = sydi;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.tohubyfoj(duq);
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

