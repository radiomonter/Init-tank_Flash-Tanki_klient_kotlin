package obfuscation.gicuke
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.Label;
   import controls.resultassets.ResultWindowBase;
   import controls.resultassets.ResultWindowBlue;
   import controls.resultassets.ResultWindowBlueHeader;
   import controls.resultassets.ResultWindowGreen;
   import controls.resultassets.ResultWindowGreenHeader;
   import controls.resultassets.ResultWindowRed;
   import controls.resultassets.ResultWindowRedHeader;
   import controls.scroller.blue.ScrollSkinBlue;
   import controls.scroller.blue.ScrollThumbSkinBlue;
   import controls.scroller.green.ScrollSkinGreen;
   import controls.scroller.green.ScrollThumbSkinGreen;
   import controls.scroller.red.ScrollSkinRed;
   import controls.scroller.red.ScrollThumbSkinRed;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   import obfuscation.bude.BattleTeam;
   import obfuscation.joni.Tozutuv;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Benonizo extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var tawy:Object;
      
      public static const BLUE:int = 0;
      
      public static const RED:int = 1;
      
      public static const GREEN:int = 2;
      
      private static const laba:int = 52;
      
      private static const mir:int = 7;
      
      private static const sakej:int = 12;
      
      private static const vanopoj:int = 20;
      
      private var list:List;
      
      private var dp:DataProvider = new DataProvider();
      
      private var inner:ResultWindowBase;
      
      private var type:int;
      
      private var bomigiz:String;
      
      private var fogegugi:Boolean;
      
      private var jafome:BattleTeam;
      
      private var header:Sprite;
      
      private var sehu:String;
      
      private var giguqu:String;
      
      private var cocivamys:String;
      
      private var qyp:String;
      
      private var _SafeStr_1:String;
      
      private var byfilomu:String;
      
      private var gir:String;
      
      private var kicutugoj:Boolean;
      
      public function Benonizo(_arg_1:int, _arg_2:String, _arg_3:Boolean, _arg_4:BattleTeam, _arg_5:Boolean)
      {
         super();
         if(tawy == null)
         {
            siruqalu();
         }
         this.type = _arg_1;
         this.bomigiz = _arg_2;
         this.fogegugi = _arg_3;
         this.jafome = _arg_4;
         this.tabEnabled = false;
         this.tabChildren = false;
         this.kicutugoj = _arg_5;
         this.sehu = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_CALLSIGN);
         this.giguqu = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_SCORE);
         this.cocivamys = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_KILLS);
         this.qyp = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_DEATHS);
         this._SafeStr_1 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_KDRATIO);
         this.byfilomu = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_REWARD);
         this.gir = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_BONUS_REWARD);
         this.init();
      }
      
      private static function siruqalu() : void
      {
         tawy = {};
         temiromeg("downArrowUpSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         temiromeg("downArrowDownSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         temiromeg("downArrowOverSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         temiromeg("downArrowDisabledSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         temiromeg("upArrowUpSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         temiromeg("upArrowDownSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         temiromeg("upArrowOverSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         temiromeg("upArrowDisabledSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         temiromeg("trackUpSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         temiromeg("trackDownSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         temiromeg("trackOverSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         temiromeg("trackDisabledSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         temiromeg("thumbUpSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         temiromeg("thumbDownSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         temiromeg("thumbOverSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         temiromeg("thumbDisabledSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
      }
      
      private static function temiromeg(_arg_1:String, _arg_2:Class, _arg_3:Class, _arg_4:Class) : void
      {
         var _local_5:Dictionary = new Dictionary();
         _local_5[Benonizo.GREEN] = _arg_2;
         _local_5[Benonizo.RED] = _arg_3;
         _local_5[Benonizo.BLUE] = _arg_4;
         tawy[_arg_1] = _local_5;
      }
      
      private static function createHeaderLabel(_arg_1:Sprite, _arg_2:String, _arg_3:uint, _arg_4:String, _arg_5:int, _arg_6:int) : Label
      {
         var _local_7:Label = null;
         _local_7 = new Label();
         _local_7.autoSize = TextFieldAutoSize.NONE;
         _local_7.text = _arg_2;
         _local_7.color = _arg_3;
         _local_7.align = _arg_4;
         _local_7.x = _arg_6;
         _local_7.width = _arg_5;
         _local_7.height = Vadi.ROW_HEIGHT;
         _arg_1.addChild(_local_7);
         return _local_7;
      }
      
      public function fuhafajyg(_arg_1:Tozutuv) : void
      {
         var _local_2:int = _arg_1.userId == null ? int(-1) : int(this.indexById(_arg_1.userId));
         if(_local_2 != -1)
         {
            this.dp.replaceItemAt(this.rasyd(_arg_1),_local_2);
            this.sort();
         }
      }
      
      public function zado(_arg_1:Vector.<Tozutuv>) : void
      {
         var _local_3:int = 0;
         this.dp.removeAll();
         var _local_2:int = int(_arg_1.length);
         while(_local_3 < _local_2)
         {
            this.dp.addItem(this.rasyd(_arg_1[_local_3]));
            _local_3++;
         }
         this.sort();
      }
      
      private function sort() : void
      {
         if(this.type == GREEN)
         {
            this.dp.sortOn(["kills","deaths"],[Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         }
         else
         {
            this.dp.sortOn(["score","kills","deaths"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         }
      }
      
      private function rasyd(_arg_1:Tozutuv) : Object
      {
         var _local_2:Velun = new Velun();
         _local_2.id = _arg_1.userId;
         _local_2.rank = _arg_1.rank;
         _local_2.uid = _arg_1.uid;
         _local_2.kills = _arg_1.kills;
         _local_2.deaths = _arg_1.deaths;
         _local_2.score = _arg_1.score;
         _local_2.bejo = _arg_1.bejo;
         _local_2.runecufyh = _arg_1.runecufyh;
         _local_2.sejukulyq = _arg_1.sejukulyq;
         _local_2.type = this.type;
         _local_2.self = _arg_1.userId == this.bomigiz;
         _local_2.loaded = _arg_1.loaded;
         _local_2.suspicious = _arg_1.suspicious;
         return _local_2;
      }
      
      public function vevonij(_arg_1:String) : void
      {
         var _local_2:int = this.indexById(_arg_1);
         this.dp.removeItemAt(_local_2);
      }
      
      public function resize(_arg_1:Number) : void
      {
         var _local_2:Number = (this.dp.length + 1) * Vadi.ROW_HEIGHT + sakej;
         if(_local_2 > _arg_1)
         {
            _local_2 = int(_arg_1 / this.header.height) * this.header.height + sakej;
         }
         this.inner.height = _local_2 < laba ? Number(laba) : Number(_local_2);
         this.list.setSize(this.inner.width - 2 * Vadi.mir,this.inner.height - this.header.y - this.header.height - 5);
      }
      
      [Obfuscation(rename="false")]
      override public function get height() : Number
      {
         return this.inner.height;
      }
      
      private function indexById(_arg_1:String) : int
      {
         var _local_2:Velun = null;
         var _local_4:int = 0;
         var _local_3:int = int(this.dp.length);
         while(_local_4 < _local_3)
         {
            _local_2 = this.dp.getItemAt(_local_4) as Velun;
            if(_local_2 != null && _local_2.id == _arg_1)
            {
               return _local_4;
            }
            _local_4++;
         }
         return -1;
      }
      
      private function besileka() : void
      {
         this.vunefebe("downArrowUpSkin");
         this.vunefebe("downArrowDownSkin");
         this.vunefebe("downArrowOverSkin");
         this.vunefebe("downArrowDisabledSkin");
         this.vunefebe("upArrowUpSkin");
         this.vunefebe("upArrowDownSkin");
         this.vunefebe("upArrowOverSkin");
         this.vunefebe("upArrowDisabledSkin");
         this.vunefebe("trackUpSkin");
         this.vunefebe("trackDownSkin");
         this.vunefebe("trackOverSkin");
         this.vunefebe("trackDisabledSkin");
         this.vunefebe("thumbUpSkin");
         this.vunefebe("thumbDownSkin");
         this.vunefebe("thumbOverSkin");
         this.vunefebe("thumbDisabledSkin");
      }
      
      private function vunefebe(_arg_1:String) : void
      {
         this.list.setStyle(_arg_1,tawy[_arg_1][this.type]);
      }
      
      private function init() : void
      {
         switch(this.type)
         {
            case RED:
               this.inner = new ResultWindowRed();
               break;
            case GREEN:
               this.inner = new ResultWindowGreen();
               break;
            case BLUE:
               this.inner = new ResultWindowBlue();
         }
         this.inner.width = Vadi.rokidopezi + 2 * Vadi.mir + Vadi.cicado + Vadi.heg + Vadi.lic + Vadi.bopumeqer + Vadi.biqahil + (this.type != GREEN ? Vadi.kab : 0) + (!this.fogegugi ? 0 : Vadi.nelanu + Vadi.dufum) + vanopoj;
         this.inner.height = laba;
         addChild(this.inner);
         this.header = this.let();
         this.inner.addChild(this.header);
         this.header.x = mir;
         this.header.y = mir;
         this.dp = new DataProvider();
         this.list = new List();
         this.besileka();
         this.inner.addChild(this.list);
         this.list.rowHeight = Vadi.ROW_HEIGHT;
         this.list.x = mir;
         Gywipez.kicutugoj = this.kicutugoj;
         this.list.setStyle("cellRenderer",Gywipez);
         this.list.y = this.header.y + this.header.height;
         this.list.focusEnabled = false;
         this.list.dataProvider = this.dp;
      }
      
      private function let() : Sprite
      {
         var _local_1:DisplayObject = null;
         var _local_2:uint = 0;
         var _local_3:Label = null;
         switch(this.type)
         {
            case BLUE:
               _local_1 = new ResultWindowBlueHeader();
               _local_2 = 11590;
               break;
            case GREEN:
               _local_1 = new ResultWindowGreenHeader();
               _local_2 = 83457;
               break;
            case RED:
               _local_1 = new ResultWindowRedHeader();
               _local_2 = 4655104;
         }
         var _local_4:Sprite = new Sprite();
         _local_4.addChild(_local_1);
         var _local_5:int = Vadi.cicado;
         _local_3 = createHeaderLabel(_local_4,this.sehu,_local_2,TextFormatAlign.LEFT,Vadi.heg,_local_5);
         _local_5 += _local_3.width;
         if(this.type != GREEN)
         {
            _local_3 = createHeaderLabel(_local_4,this.giguqu,_local_2,TextFormatAlign.RIGHT,Vadi.kab,_local_5);
            _local_5 += _local_3.width;
         }
         _local_3 = createHeaderLabel(_local_4,this.cocivamys,_local_2,TextFormatAlign.RIGHT,Vadi.lic,_local_5);
         _local_5 += _local_3.width;
         _local_3 = createHeaderLabel(_local_4,this.qyp,_local_2,TextFormatAlign.RIGHT,Vadi.bopumeqer,_local_5);
         _local_5 += _local_3.width;
         _local_3 = createHeaderLabel(_local_4,this._SafeStr_1,_local_2,TextFormatAlign.RIGHT,Vadi.biqahil,_local_5);
         _local_5 += _local_3.width;
         if(this.fogegugi)
         {
            _local_3 = createHeaderLabel(_local_4,this.byfilomu,_local_2,TextFormatAlign.RIGHT,Vadi.nelanu,_local_5);
            _local_5 += _local_3.width;
            if(this.kicutugoj)
            {
               createHeaderLabel(_local_4,this.gir,_local_2,TextFormatAlign.RIGHT,Vadi.dufum,_local_5);
            }
         }
         _local_1.width = width - 2 * mir;
         _local_1.height = Vadi.ROW_HEIGHT - 2;
         return _local_4;
      }
   }
}

