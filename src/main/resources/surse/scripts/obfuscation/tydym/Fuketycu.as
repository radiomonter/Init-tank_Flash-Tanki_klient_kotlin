package obfuscation.tydym
{
   public class Fuketycu implements Kolovi
   {
      
      private static const zeremi:int = 1;
      
      private static const mazilecu:int = 2;
      
      private static const lowo:int = 3;
      
      private var type:int;
      
      private var zajyten:Fudazoze;
      
      private var byv:int;
      
      private var time:int;
      
      private var qos:Number = 0.01;
      
      private var vuhus:Number = 0.001;
      
      private var state:int;
      
      public function Fuketycu(_arg_1:int, _arg_2:Fudazoze, _arg_3:Number, _arg_4:Number, _arg_5:int)
      {
         super();
         this.type = _arg_1;
         this.zajyten = _arg_2;
         this.qos = _arg_3;
         this.vuhus = _arg_4;
         this.byv = _arg_5;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.zajyten.mot.visible = true;
         this.zajyten.mot.alpha = 1;
         this.zajyten.kad.visible = false;
         this.zajyten.hedohygyl.visible = true;
         this.zajyten.hedohygyl.alpha = 0;
         this.state = zeremi;
      }
      
      public function stop() : void
      {
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = this.zajyten.mot.alpha;
         switch(this.state)
         {
            case zeremi:
               _local_3 -= this.qos * _arg_2;
               if(_local_3 <= 0)
               {
                  _local_3 = 0;
                  this.state = mazilecu;
                  this.time = this.byv;
               }
               break;
            case mazilecu:
               this.time -= _arg_2;
               if(this.time <= 0)
               {
                  this.state = lowo;
               }
               break;
            case lowo:
               _local_3 += this.vuhus * _arg_2;
               if(_local_3 >= 1)
               {
                  this.zajyten.setState(Fudazoze.jiqekejin);
               }
         }
         this.zajyten.mot.alpha = _local_3;
         this.zajyten.hedohygyl.alpha = 1 - _local_3;
      }
   }
}

