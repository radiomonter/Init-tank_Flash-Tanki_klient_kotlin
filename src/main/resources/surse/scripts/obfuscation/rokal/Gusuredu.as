package obfuscation.rokal
{
   import obfuscation.rofa.LightAnimation;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Gusuredu implements Riwizy
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Riwizy>;
      
      public function Gusuredu(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Riwizy>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function jaqirynu(sydi:String) : LightAnimation
      {
         var pify:LightAnimation = null;
         var hutace:int = 0;
         var nyfusi:Riwizy = null;
         var rycavu:String = sydi;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.jaqirynu(rycavu);
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

