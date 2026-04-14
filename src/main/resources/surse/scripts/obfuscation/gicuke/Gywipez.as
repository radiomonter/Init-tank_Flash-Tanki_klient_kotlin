package obfuscation.gicuke
{
   import controls.Label;
   import controls.Money;
   import controls.resultassets.ResultWindowBlueNormal;
   import controls.resultassets.ResultWindowBlueSelected;
   import controls.resultassets.ResultWindowGreenNormal;
   import controls.resultassets.ResultWindowGreenSelected;
   import controls.resultassets.ResultWindowRedNormal;
   import controls.resultassets.ResultWindowRedSelected;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import obfuscation.pikobu.Vip;
   import obfuscation.sepalim.Bodogyri;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Gywipez extends CellRenderer
   {
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      public static var kicutugoj:Boolean;
      
      private static const COLOR_NORMAL:uint = 16777215;
      
      private static const nohyja:uint = 11184810;
      
      private static const mesazuhu:uint = 15976448;
      
      private static const fyfefybu:uint = 10921638;
      
      private static const vadu:String = "—";
      
      private var nicon:DisplayObject;
      
      public function Gywipez()
      {
         super();
         this.mouseChildren = true;
         this.buttonMode = this.useHandCursor = false;
      }
      
      private static function quhok(_arg_1:DisplayObjectContainer, _arg_2:String, _arg_3:uint, _arg_4:String, _arg_5:int, _arg_6:int) : Label
      {
         var _local_7:Label = null;
         _local_7 = new Label();
         _local_7.mouseEnabled = false;
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
      
      private static function nol(_arg_1:DisplayObjectContainer, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:int, _arg_6:UserLabel) : void
      {
         var _local_8:Bitmap = null;
         var _local_7:String = null;
         var _local_9:Shape = null;
         var _local_10:int = 0;
         _local_8 = null;
         var _local_11:uint = _arg_3;
         if(_arg_6.premium)
         {
            if(_arg_4 > 0 || _arg_5 > 0)
            {
               _local_11 = mesazuhu;
               _local_7 = Money.numToString(_arg_4 + _arg_5,false);
            }
            else
            {
               _local_11 = _arg_3;
               _local_7 = vadu;
            }
         }
         else if(_arg_5 > 0)
         {
            _local_11 = COLOR_NORMAL;
            _local_7 = Money.numToString(_arg_5,false);
         }
         else if(_arg_6.self)
         {
            _local_11 = fyfefybu;
            if(_arg_4 > 0)
            {
               _local_7 = Money.numToString(_arg_4,false);
            }
            else
            {
               _local_7 = vadu;
            }
         }
         else
         {
            _local_11 = _arg_3;
            _local_7 = vadu;
         }
         var _local_12:Label = quhok(_arg_1,_local_7,_local_11,TextFormatAlign.RIGHT,Vadi.dufum,_arg_2);
         if(_arg_6.self && !_arg_6.premium && _arg_5 <= 0)
         {
            if(_arg_4 > 0)
            {
               _local_9 = new Shape();
               _arg_1.addChild(_local_9);
               _local_10 = _local_12.textWidth;
               _local_9.x = _local_12.x + Vadi.dufum - _local_10 - 2;
               _local_9.y = _local_12.y + 9;
               _local_9.graphics.clear();
               _local_9.graphics.beginFill(fyfefybu);
               _local_9.graphics.drawRect(0,0,_local_10,1);
               _local_9.graphics.endFill();
            }
            _local_8 = new Bitmap(Bodogyri.dupabic);
            _arg_1.addChild(_local_8);
            _local_8.x = _arg_2 + Vadi.dufum + 4;
            _local_8.y = Vadi.ROW_HEIGHT - 2 - _local_8.height >> 1;
         }
      }
      
      [Obfuscation(rename="false")]
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         this.nicon = this.myIcon(_data);
      }
      
      [Obfuscation(rename="false")]
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = _listData.label;
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      [Obfuscation(rename="false")]
      override protected function drawBackground() : void
      {
      }
      
      [Obfuscation(rename="false")]
      override protected function drawLayout() : void
      {
      }
      
      [Obfuscation(rename="false")]
      override protected function drawIcon() : void
      {
         var _local_1:DisplayObject = icon;
         var _local_2:Object = getStyleValue("icon");
         if(_local_2 != null)
         {
            icon = getDisplayObjectInstance(_local_2);
         }
         if(icon != null)
         {
            addChildAt(icon,1);
         }
         if(_local_1 != null && _local_1 != icon && _local_1.parent == this)
         {
            removeChild(_local_1);
         }
      }
      
      private function myIcon(_arg_1:Object) : Sprite
      {
         var _local_2:DisplayObject = null;
         var _local_3:uint = 0;
         var _local_4:Label = null;
         var _local_5:Velun = Velun(_arg_1);
         switch(_local_5.type)
         {
            case Benonizo.BLUE:
               _local_2 = !_local_5.self ? new ResultWindowBlueNormal() : new ResultWindowBlueSelected();
               break;
            case Benonizo.GREEN:
               _local_2 = !_local_5.self ? new ResultWindowGreenNormal() : new ResultWindowGreenSelected();
               break;
            case Benonizo.RED:
               _local_2 = !_local_5.self ? new ResultWindowRedNormal() : new ResultWindowRedSelected();
         }
         var _local_6:Sprite = new Sprite();
         _local_6.addChild(_local_2);
         if(!_arg_1.loaded)
         {
            _local_3 = nohyja;
         }
         else
         {
            _local_3 = Boolean(_arg_1.suspicious) ? uint(ColorConstants.SUSPICIOUS) : uint(COLOR_NORMAL);
         }
         var _local_7:Vip = new Vip(_local_5.id);
         if(!_arg_1.loaded)
         {
            _local_7.setUidColor(nohyja,true);
         }
         else if(Boolean(_arg_1.suspicious))
         {
            _local_7.setUidColor(ColorConstants.SUSPICIOUS,true);
         }
         else
         {
            _local_7.setUidColor(COLOR_NORMAL,battleInfoService.isSpectatorMode());
         }
         var _local_8:int = Vadi.cicado;
         _local_7.x = _local_8 - 14;
         _local_6.addChild(_local_7);
         _local_8 += Vadi.heg;
         if(_local_5.type != Benonizo.GREEN)
         {
            _local_4 = quhok(_local_6,_local_5.score.toString(),_local_3,TextFormatAlign.RIGHT,Vadi.kab,_local_8);
            _local_8 += _local_4.width;
         }
         _local_4 = quhok(_local_6,_local_5.kills.toString(),_local_3,TextFormatAlign.RIGHT,Vadi.lic,_local_8);
         _local_8 += _local_4.width;
         _local_4 = quhok(_local_6,_local_5.deaths.toString(),_local_3,TextFormatAlign.RIGHT,Vadi.bopumeqer,_local_8);
         _local_8 += _local_4.width;
         var _local_9:Number = _local_5.kills / _local_5.deaths;
         var _local_10:String = _local_5.deaths == 0 || _local_5.kills == 0 ? vadu : _local_9.toFixed(2);
         _local_4 = quhok(_local_6,_local_10,_local_3,TextFormatAlign.RIGHT,Vadi.biqahil,_local_8);
         _local_8 += _local_4.width;
         if(_local_5.bejo > -1)
         {
            _local_4 = quhok(_local_6,Money.numToString(_local_5.bejo,false),_local_3,TextFormatAlign.RIGHT,Vadi.nelanu,_local_8);
            _local_8 += _local_4.width;
            if(kicutugoj)
            {
               nol(_local_6,_local_8,_local_3,_local_5.runecufyh,_local_5.sejukulyq,_local_7);
            }
         }
         _local_2.width = width;
         _local_2.height = Vadi.ROW_HEIGHT - 2;
         return _local_6;
      }
   }
}

