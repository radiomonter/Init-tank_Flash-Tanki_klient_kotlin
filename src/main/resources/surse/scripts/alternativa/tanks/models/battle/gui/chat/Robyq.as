package alternativa.tanks.models.battle.gui.chat
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.Label;
   import flash.text.AntiAliasType;
   import obfuscation.bude.BattleTeam;
   import obfuscation.mujusaqim.MessageColor;
   import obfuscation.pawikoz.Fojuhe;
   import obfuscation.pikobu.Munano;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Robyq extends Fojuhe
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var output:Label;
      
      private var _namesWidth:int = 0;
      
      private var _width:int = 300;
      
      private var gutyqu:Munano;
      
      public function Robyq(_arg_1:String, _arg_2:BattleTeam, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean)
      {
         var _local_6:Label = null;
         var _local_7:int = 0;
         this.output = new Label();
         _local_6 = null;
         super();
         if(_arg_5)
         {
            _local_7 = 14;
            _local_6 = new Label();
            _local_6.color = MessageColor.YELLOW;
            _local_6.text = localeService.getText(TanksLocale.TEXT_SPECTATOR_NAME) + ":";
            _local_6.thickness = 50;
            _local_6.sharpness = 0;
            _local_6.mouseEnabled = false;
            shadowContainer.addChild(_local_6);
            _local_6.x = _local_7;
            _local_7 += _local_6.textWidth + 1;
         }
         else
         {
            this.gutyqu = new Munano(_arg_1);
            this.gutyqu.setUidColor(MessageColor.sorijez(_arg_2,_arg_5),true);
            this.gutyqu.setAdditionalText(":");
            addChild(this.gutyqu);
            _local_7 += this.gutyqu.width;
         }
         this.output.color = MessageColor.kepumuwap(_arg_2,_arg_4,_arg_5);
         this.output.antiAliasType = AntiAliasType.ADVANCED;
         this.output.thickness = 150;
         this.output.sharpness = 200;
         this.output.multiline = true;
         this.output.wordWrap = true;
         this.output.mouseEnabled = false;
         shadowContainer.addChild(this.output);
         this._namesWidth = _local_7;
         if(this._namesWidth > this._width / 2)
         {
            this.output.y = 15;
            this.output.x = 0;
            this.output.width = this._width - 5;
         }
         else
         {
            this.output.x = this._namesWidth + 3;
            this.output.y = 0;
            this.output.width = this._width - this._namesWidth - 8;
         }
         this.output.text = _arg_3;
      }
      
      [Obfuscation(rename="false")]
      public function alignChatUserLabel() : void
      {
         this._namesWidth = this.gutyqu.width;
         if(this._namesWidth > this._width / 2)
         {
            this.output.y = 15;
            this.output.x = 0;
            this.output.width = this._width - 5;
         }
         else
         {
            this.output.x = this._namesWidth + 3;
            this.output.y = 0;
            this.output.width = this._width - this._namesWidth - 8;
         }
      }
      
      [Obfuscation(rename="false")]
      override public function set width(_arg_1:Number) : void
      {
         this._width = int(_arg_1);
         if(this._namesWidth > this._width / 2 && this.output.text.length * 8 > this._width - this._namesWidth)
         {
            this.output.y = 21;
            this.output.x = 0;
            this.output.width = this._width - 5;
            this.output.height = 20;
         }
         else
         {
            this.output.x = this._namesWidth;
            this.output.y = 0;
            this.output.width = this._width - this._namesWidth - 5;
            this.output.height = 20;
         }
      }
   }
}

