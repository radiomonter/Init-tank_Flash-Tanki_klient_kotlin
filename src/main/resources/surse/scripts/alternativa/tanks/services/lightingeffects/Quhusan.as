package alternativa.tanks.services.lightingeffects
{
   import flash.geom.ColorTransform;
   import obfuscation.badu.Jytamutid;
   import obfuscation.badu.Wydu;
   import obfuscation.fabuqy.Suvozimi;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Quhusan implements ILightingEffectsService
   {
      
      private var noqyc:Vector.<Jytamutid>;
      
      private var cohagygi:Number;
      
      private var jis:ColorTransform;
      
      public function Quhusan()
      {
         var _local_1:int = 0;
         this.noqyc = new Vector.<Jytamutid>(Suvozimi.values.length,true);
         super();
         while(_local_1 < this.noqyc.length)
         {
            this.noqyc[_local_1] = new Jytamutid(new Wydu(0,0),new Wydu(0,0),new Wydu(0,0),0,0);
            _local_1++;
         }
      }
      
      public function setLightForMode(_arg_1:Suvozimi, _arg_2:Jytamutid) : void
      {
         this.noqyc[_arg_1.value] = _arg_2;
      }
      
      public function nediqelun(_arg_1:Suvozimi) : Jytamutid
      {
         return this.noqyc[_arg_1.value];
      }
      
      public function wal(_arg_1:Number, _arg_2:ColorTransform, _arg_3:ColorTransform) : void
      {
         this.cohagygi = _arg_1;
         if(GPUCapabilities.gpuEnabled)
         {
            this.jis = _arg_2;
         }
         else
         {
            this.jis = _arg_3;
         }
      }
      
      public function pucajuneg() : Number
      {
         return this.cohagygi;
      }
      
      public function vyweren() : ColorTransform
      {
         return this.jis;
      }
   }
}

