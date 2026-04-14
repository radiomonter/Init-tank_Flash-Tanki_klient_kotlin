package controls.statassets
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.events.StatListEvent;
   
   public class ReferralStatHeader extends Sprite
   {
      
      protected var tabs:Array;
      
      protected var headers:Array;
      
      protected var _currentSort:int = 1;
      
      protected var _oldSort:int = 1;
      
      protected var _width:int = 800;
      
      public function ReferralStatHeader()
      {
         var _local_2:StatHeaderButton = null;
         var _local_3:int = 0;
         this.tabs = new Array();
         super();
         var _local_1:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.headers = [_local_1.getText(TextConst.REFERAL_STATISTICS_HEADER_CALLSIGN),_local_1.getText(TextConst.REFERAL_STATISTICS_HEADER_INCOME)];
         _local_3 = 0;
         while(_local_3 < 2)
         {
            _local_2 = new StatHeaderButton(_local_3 == 1);
            _local_2.label = this.headers[_local_3];
            _local_2.height = 18;
            _local_2.numSort = _local_3;
            addChild(_local_2);
            _local_2.addEventListener(MouseEvent.CLICK,this.changeSort);
            _local_3++;
         }
         this.draw();
      }
      
      protected function draw() : void
      {
         var _local_1:StatHeaderButton = null;
         var _local_3:int = 0;
         var _local_2:int = int(this._width - 345);
         this.tabs = [0,this._width - 120,this._width - 1];
         _local_3 = 0;
         while(_local_3 < 2)
         {
            _local_1 = getChildAt(_local_3) as StatHeaderButton;
            _local_1.width = this.tabs[_local_3 + 1] - this.tabs[_local_3] - 2;
            _local_1.x = this.tabs[_local_3];
            _local_1.selected = _local_3 == this._currentSort;
            _local_3++;
         }
      }
      
      protected function changeSort(_arg_1:MouseEvent) : void
      {
         var _local_2:StatHeaderButton = _arg_1.currentTarget as StatHeaderButton;
         this._currentSort = _local_2.numSort;
         if(this._currentSort != this._oldSort)
         {
            this.draw();
            dispatchEvent(new StatListEvent(StatListEvent.UPDATE_SORT,0,0,this._currentSort));
            this._oldSort = this._currentSort;
         }
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.floor(_arg_1);
         this.draw();
      }
   }
}

