package obfuscation.mujusaqim
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Zubisewi implements Hylyv
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Hylyv>;
      
      public function Zubisewi(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Hylyv>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function jydupyv() : void
      {
         var hutace:int = 0;
         var nyfusi:Hylyv = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               nyfusi.jydupyv();
               hutace += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function nera() : void
      {
         var hutace:int = 0;
         var nyfusi:Hylyv = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               nyfusi.nera();
               hutace += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function gykiha(sydi:Byjeso) : void
      {
         var hutace:int = 0;
         var nyfusi:Hylyv = null;
         var ruhemudac:Byjeso = sydi;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               nyfusi.gykiha(ruhemudac);
               hutace += 1;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function jebycu() : void
      {
         var hutace:int = 0;
         var nyfusi:Hylyv = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               nyfusi.jebycu();
               hutace += 1;
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

