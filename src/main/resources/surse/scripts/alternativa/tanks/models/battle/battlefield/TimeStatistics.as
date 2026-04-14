package alternativa.tanks.models.battle.battlefield
{
   import flash.utils.getTimer;
   
   internal class TimeStatistics
   {
      
      private static const qanafymyc:int = 10;
      
      private var dikifo:Number;
      
      private var _fps:Number;
      
      private var nojarapec:Number;
      
      private var vokide:Number;
      
      private var rihudicyc:int;
      
      private var keron:int;
      
      private var fizelyra:int;
      
      private var vefyn:int;
      
      public function TimeStatistics()
      {
         super();
         this.reset();
      }
      
      public function get lyfygume() : Number
      {
         return this.dikifo;
      }
      
      public function get fps() : Number
      {
         return this._fps;
      }
      
      public function get sykemoriq() : Number
      {
         return this.nojarapec;
      }
      
      public function get fidyri() : Number
      {
         return this.vokide;
      }
      
      public function typysetu() : Number
      {
         return 1000 / (this.vefyn - this.fizelyra) * this.rihudicyc;
      }
      
      public function get jov() : int
      {
         return this.rihudicyc;
      }
      
      public function get totalTime() : int
      {
         return this.vefyn - this.fizelyra;
      }
      
      public function reset() : void
      {
         this.keron = 0;
         this.dikifo = 0;
         this._fps = 100;
         this.nojarapec = 100;
         this.vokide = 0;
         this.rihudicyc = 0;
         this.fizelyra = getTimer();
         this.vefyn = this.fizelyra;
      }
      
      public function update() : void
      {
         var _local_1:int = getTimer();
         this.huweqybun();
         if(this.tiwigy(_local_1))
         {
            this.wogohaj(_local_1);
            this.wusyci();
            this.vefyn = _local_1;
         }
      }
      
      private function huweqybun() : void
      {
         ++this.rihudicyc;
         ++this.keron;
      }
      
      private function tiwigy(_arg_1:int) : Boolean
      {
         return this.keron >= qanafymyc && _arg_1 > this.vefyn;
      }
      
      private function wogohaj(_arg_1:int) : void
      {
         this.dikifo = (_arg_1 - this.vefyn) / this.keron;
         this._fps = 1000 / this.dikifo;
         this.keron = 0;
      }
      
      private function wusyci() : void
      {
         this.nojarapec = Math.min(this.nojarapec,this._fps);
         this.vokide = Math.max(this.vokide,this._fps);
      }
   }
}

