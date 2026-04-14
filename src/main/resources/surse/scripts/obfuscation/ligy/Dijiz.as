package obfuscation.ligy
{
   import obfuscation.syhis.Hegug;
   import obfuscation.syhis.Linebaz;
   
   public class Dijiz
   {
      
      private var mujypib:Number;
      
      private var hypududyt:Number;
      
      private var qunub:Number;
      
      private var regyrarypa:Vector.<Wynid>;
      
      private var _resources:Hegug;
      
      private var kuwozikat:Linebaz;
      
      public function Dijiz(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:Vector.<Wynid> = null, _arg_5:Hegug = null, _arg_6:Linebaz = null)
      {
         super();
         this.mujypib = _arg_1;
         this.hypududyt = _arg_2;
         this.qunub = _arg_3;
         this.regyrarypa = _arg_4;
         this._resources = _arg_5;
         this.kuwozikat = _arg_6;
      }
      
      public function get cevyqy() : Number
      {
         return this.mujypib;
      }
      
      public function set cevyqy(_arg_1:Number) : void
      {
         this.mujypib = _arg_1;
      }
      
      public function get pih() : Number
      {
         return this.hypududyt;
      }
      
      public function set pih(_arg_1:Number) : void
      {
         this.hypududyt = _arg_1;
      }
      
      public function get sepo() : Number
      {
         return this.qunub;
      }
      
      public function set sepo(_arg_1:Number) : void
      {
         this.qunub = _arg_1;
      }
      
      public function get points() : Vector.<Wynid>
      {
         return this.regyrarypa;
      }
      
      public function set points(_arg_1:Vector.<Wynid>) : void
      {
         this.regyrarypa = _arg_1;
      }
      
      public function get resources() : Hegug
      {
         return this._resources;
      }
      
      public function set resources(_arg_1:Hegug) : void
      {
         this._resources = _arg_1;
      }
      
      public function get rero() : Linebaz
      {
         return this.kuwozikat;
      }
      
      public function set rero(_arg_1:Linebaz) : void
      {
         this.kuwozikat = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ControlPointsCC [";
         _local_1 += "keypointTriggerRadius = " + this.cevyqy + " ";
         _local_1 += "keypointVisorHeight = " + this.pih + " ";
         _local_1 += "minesRestrictionRadius = " + this.sepo + " ";
         _local_1 += "points = " + this.points + " ";
         _local_1 += "resources = " + this.resources + " ";
         _local_1 += "sounds = " + this.rero + " ";
         return _local_1 + "]";
      }
   }
}

