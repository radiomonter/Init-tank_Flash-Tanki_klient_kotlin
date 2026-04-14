package obfuscation.mujusaqim
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Fitef implements Hylyv
   {
      
      private var object:IGameObject;
      
      private var impl:Hylyv;
      
      public function Fitef(_arg_1:IGameObject, _arg_2:Hylyv)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function jydupyv() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.jydupyv();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function nera() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.nera();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function gykiha(sydi:Byjeso) : void
      {
         var ruhemudac:Byjeso = sydi;
         try
         {
            Model.object = this.object;
            this.impl.gykiha(ruhemudac);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function jebycu() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.jebycu();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

