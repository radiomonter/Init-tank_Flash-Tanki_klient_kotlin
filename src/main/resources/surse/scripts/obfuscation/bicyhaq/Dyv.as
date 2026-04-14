package obfuscation.bicyhaq
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.DeferredAction;
   import alternativa.tanks.battle.Trigger;
   
   public class Dyv
   {
      
      private const ninop:Vector.<Trigger> = new Vector.<Trigger>();
      
      private const pijigiqa:Vector.<DeferredAction> = new Vector.<DeferredAction>();
      
      private var running:Boolean;
      
      public function Dyv()
      {
         super();
      }
      
      public function add(_arg_1:Trigger) : void
      {
         if(this.running)
         {
            this.pijigiqa.push(new Webedifyc(this,_arg_1));
         }
         else if(this.ninop.indexOf(_arg_1) < 0)
         {
            this.ninop.push(_arg_1);
         }
      }
      
      public function remove(_arg_1:Trigger) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         if(this.running)
         {
            this.pijigiqa.push(new Daduzesi(this,_arg_1));
         }
         else
         {
            _local_2 = int(this.ninop.length);
            if(_local_2 > 0)
            {
               _local_3 = this.ninop.indexOf(_arg_1);
               if(_local_3 >= 0)
               {
                  this.ninop[_local_3] = this.ninop[--_local_2];
                  this.ninop.length = _local_2;
               }
            }
         }
      }
      
      public function zaleby(_arg_1:Body) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:Trigger = null;
         if(_arg_1 != null)
         {
            this.running = true;
            _local_2 = int(this.ninop.length);
            _local_3 = 0;
            while(_local_3 < _local_2)
            {
               _local_4 = this.ninop[_local_3];
               _local_4.checkTrigger(_arg_1);
               _local_3++;
            }
            this.running = false;
            this.fypem();
         }
      }
      
      private function fypem() : void
      {
         var _local_1:DeferredAction = null;
         while(true)
         {
            _local_1 = this.pijigiqa.pop();
            if(_local_1 == null)
            {
               break;
            }
            _local_1.execute();
         }
      }
   }
}

