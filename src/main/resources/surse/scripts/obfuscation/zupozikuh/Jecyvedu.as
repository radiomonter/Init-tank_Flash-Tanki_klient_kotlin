package obfuscation.zupozikuh
{
   import controls.Label;
   import flash.text.TextFormat;
   
   internal class Jecyvedu
   {
      
      private static const gudenihyj:int = 500;
      
      private static const zyse:int = 700;
      
      private static const vumicuw:int = 2000;
      
      private static const rih:int = 10000;
      
      private static const ALPHA:Number = 0.6;
      
      private const dufusut:int = 18;
      
      private var wowozybo:Vector.<Covofuk>;
      
      private var gyh:Vector.<Covofuk>;
      
      public var tub:Boolean;
      
      private var label:Label = new Label();
      
      private var states:Vector.<Covofuk>;
      
      private var hehun:int;
      
      public function Jecyvedu()
      {
         super();
         this.wowozybo = Vector.<Covofuk>([new Ryziquw(this,gudenihyj,0,1),new Gepa(vumicuw),new Ryziquw(this,zyse,1,ALPHA),new Gepa(rih),new Ryziquw(this,zyse,ALPHA,0)]);
         this.gyh = Vector.<Covofuk>([new Ryziquw(this,zyse,1,ALPHA),new Gepa(rih),new Ryziquw(this,zyse,ALPHA,0)]);
         this.label.size = this.dufusut;
         this.label.setFormat(new TextFormat("MyriadProB"));
         this.label.bold = true;
      }
      
      public function init() : void
      {
         this.tub = false;
         this.hehun = 0;
         this.states = this.wowozybo;
         var _local_1:Covofuk = this.states[0];
         _local_1.init();
      }
      
      public function wabiveso(_arg_1:int) : void
      {
         this.tub = false;
         this.hehun = 0;
         this.states = this.gyh;
         var _local_2:Covofuk = this.states[1];
         _local_2.foriz(_arg_1);
         var _local_3:Covofuk = this.states[0];
         _local_3.init();
      }
      
      public function update(_arg_1:int) : void
      {
         var _local_2:Covofuk = null;
         var _local_3:Covofuk = null;
         if(!this.tub)
         {
            _local_2 = this.states[this.hehun];
            if(!_local_2.update(_arg_1))
            {
               if(++this.hehun == this.states.length)
               {
                  this.tub = true;
               }
               else
               {
                  _local_3 = this.states[this.hehun];
                  _local_3.init();
               }
            }
         }
      }
      
      public function setAlpha(_arg_1:Number) : void
      {
         this.label.alpha = _arg_1;
      }
      
      public function getLabel() : Label
      {
         return this.label;
      }
   }
}

