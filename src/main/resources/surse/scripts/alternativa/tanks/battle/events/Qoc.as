package alternativa.tanks.battle.events
{
   import flash.utils.Dictionary;
   
   public class Qoc implements BattleEventDispatcher
   {
      
      private var muvujiky:int;
      
      private var wygocyw:Dictionary = new Dictionary();
      
      private var qurofumim:Dictionary = new Dictionary();
      
      private var kutegiguh:Dictionary = new Dictionary();
      
      private var lygutute:Dictionary = new Dictionary();
      
      public function Qoc()
      {
         super();
      }
      
      private static function addListener(_arg_1:Dictionary, _arg_2:Class, _arg_3:BattleEventListener) : void
      {
         var _local_4:Vector.<BattleEventListener> = _arg_1[_arg_2];
         if(_local_4 == null)
         {
            _local_4 = new Vector.<BattleEventListener>();
            _arg_1[_arg_2] = _local_4;
         }
         if(_local_4.indexOf(_arg_3) < 0)
         {
            _local_4.push(_arg_3);
         }
      }
      
      private static function removeListener(_arg_1:Dictionary, _arg_2:Class, _arg_3:BattleEventListener) : void
      {
         var _local_4:int = 0;
         var _local_5:Vector.<BattleEventListener> = _arg_1[_arg_2];
         if(_local_5 != null)
         {
            _local_4 = _local_5.indexOf(_arg_3);
            if(_local_4 >= 0)
            {
               if(_local_5.length == 1)
               {
                  delete _arg_1[_arg_2];
               }
               else
               {
                  _local_5.splice(_local_4,1);
               }
            }
         }
      }
      
      public function pugu(_arg_1:Class, _arg_2:BattleEventListener) : void
      {
         if(this.muvujiky > 0)
         {
            removeListener(this.kutegiguh,_arg_1,_arg_2);
            addListener(this.qurofumim,_arg_1,_arg_2);
         }
         else
         {
            addListener(this.wygocyw,_arg_1,_arg_2);
         }
      }
      
      public function kujo(_arg_1:Class, _arg_2:BattleEventListener) : void
      {
         if(this.muvujiky > 0)
         {
            removeListener(this.qurofumim,_arg_1,_arg_2);
            addListener(this.kutegiguh,_arg_1,_arg_2);
         }
         else
         {
            removeListener(this.wygocyw,_arg_1,_arg_2);
         }
      }
      
      public function dispatchEvent(_arg_1:Object) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         ++this.muvujiky;
         var _local_4:Vector.<BattleEventListener> = this.wygocyw[_arg_1.constructor];
         if(_local_4 != null)
         {
            _local_2 = int(_local_4.length);
            _local_3 = 0;
            while(_local_3 < _local_2)
            {
               BattleEventListener(_local_4[_local_3]).handleBattleEvent(_arg_1);
               _local_3++;
            }
         }
         --this.muvujiky;
         this.hepyn();
      }
      
      public function nigohif(_arg_1:Object) : void
      {
         if(!this.lygutute[_arg_1.constructor])
         {
            this.lygutute[_arg_1.constructor] = true;
            this.dispatchEvent(_arg_1);
         }
      }
      
      public function fosyvylyk() : void
      {
         this.lygutute = new Dictionary();
      }
      
      private function hepyn() : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_5:Vector.<BattleEventListener> = null;
         var _local_1:* = undefined;
         var _local_4:* = null;
         if(this.muvujiky > 0)
         {
            return;
         }
         for(_local_4 in this.kutegiguh)
         {
            _local_5 = this.kutegiguh[_local_4];
            delete this.kutegiguh[_local_4];
            _local_3 = int(_local_5.length);
            _local_2 = 0;
            while(_local_2 < _local_3)
            {
               removeListener(this.wygocyw,_local_4,_local_5[_local_2]);
               _local_2++;
            }
         }
         for(_local_4 in this.qurofumim)
         {
            _local_5 = this.qurofumim[_local_4];
            delete this.qurofumim[_local_4];
            _local_3 = int(_local_5.length);
            _local_2 = 0;
            while(_local_2 < _local_3)
            {
               addListener(this.wygocyw,_local_4,_local_5[_local_2]);
               _local_2++;
            }
         }
      }
   }
}

