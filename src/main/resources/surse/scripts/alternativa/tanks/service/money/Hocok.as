package alternativa.tanks.service.money
{
   import alternativa.tanks.gui.buycrystals.BuyCrystalsAlert;
   import alternativa.tanks.service.panel.IPanelView;
   
   public class Hocok implements IMoneyService
   {
      
      [Inject]
      public static var panelView:IPanelView;
      
      private var mask:int = 0;
      
      private var listeners:Vector.<Kyfa>;
      
      private var _crystals:int = 0;
      
      private var qusihu:int = 0;
      
      public function Hocok()
      {
         super();
         this.listeners = new Vector.<Kyfa>();
      }
      
      private static function cerahidop(_arg_1:int) : void
      {
         new BuyCrystalsAlert(_arg_1);
      }
      
      public function addListener(_arg_1:Kyfa) : void
      {
         if(this.listeners.indexOf(_arg_1) == -1)
         {
            this.listeners.push(_arg_1);
         }
      }
      
      public function removeListener(_arg_1:Kyfa) : void
      {
         var _local_2:Number = this.listeners.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            this.listeners.splice(_local_2,1);
         }
      }
      
      public function get crystal() : int
      {
         var _local_1:* = this._crystals ^ this.mask;
         this.bode(_local_1);
         return _local_1;
      }
      
      public function init(_arg_1:int) : void
      {
         this.duro(_arg_1);
      }
      
      public function dic(_arg_1:int) : Boolean
      {
         if(this.crystal < _arg_1)
         {
            cerahidop(_arg_1 - this._crystals);
            return false;
         }
         return true;
      }
      
      public function wuc(_arg_1:int) : void
      {
         this.duro(this.crystal - _arg_1);
         this.qusihu += _arg_1;
      }
      
      public function sym(_arg_1:int) : void
      {
         if(_arg_1 < 0)
         {
            this.qusihu += _arg_1;
            if(this.qusihu < 0)
            {
               _arg_1 = this.qusihu;
               this.qusihu = 0;
            }
            else
            {
               _arg_1 = 0;
            }
         }
         this.duro(_arg_1);
      }
      
      private function duro(_arg_1:int) : void
      {
         var _local_2:Kyfa = null;
         var _local_3:int = 0;
         panelView.getPanel().playerInfo.crystals = _arg_1;
         this.bode(_arg_1);
         while(_local_3 < this.listeners.length)
         {
            _local_2 = this.listeners[_local_3];
            _local_2.crystalsChanged(_arg_1);
            _local_3++;
         }
      }
      
      private function bode(_arg_1:int) : void
      {
         this.mask = Math.random() * 4294967295;
         this._crystals = _arg_1 ^ this.mask;
      }
   }
}

