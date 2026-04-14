package controls
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.panel.PlayerRatingInfo;
   import controls.panel.Indicators;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import utils.FontParamsUtil;
   
   public class PlayerInfo extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const normalGlowColor:uint = 1244928;
      
      private const minusGlowColor:uint = 16728064;
      
      private var _playerName:String;
      
      private var _clantag:String;
      
      private var _rang:int;
      
      private var _score:int = 0;
      
      private var _scoreRemain:int = 0;
      
      private var _progress:int = 0;
      
      private var _newProgress:int;
      
      private var _deltaProgress:Number;
      
      private var _rating:Number = 0;
      
      private var _ratingChange:int = 0;
      
      private var _position:int;
      
      private var _shield:int = 5000;
      
      private var _weapon:int = 7500;
      
      private var _engine:int = 6000;
      
      private var _money:int = 0;
      
      private var _crystals:int = 0;
      
      public var indicators:Indicators = new Indicators();
      
      private var ratingInfo:PlayerRatingInfo = new PlayerRatingInfo();
      
      private var glowAlpha:Object = new Object();
      
      private var glowColor:Object = new Object();
      
      private var glowDelta:Number = 0.02;
      
      private var _width:int;
      
      public function PlayerInfo()
      {
         super();
         addChild(this.indicators);
         this.hideRatingAndChangeButton();
         this.ratingInfo.y = this.indicators.y + 4;
         addChild(this.ratingInfo);
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
      }
      
      private function hideRatingAndChangeButton() : void
      {
         this.indicators._changeButton.visible = false;
         this.indicators.kdRatio.visible = false;
         this.indicators.kd_icon.visible = false;
      }
      
      public function get playerName() : String
      {
         return this._playerName;
      }
      
      public function set playerName(_arg_1:String) : void
      {
         this._playerName = _arg_1;
         this.updateInfo();
      }
      
      public function clantag(_arg_1:String) : void
      {
         this._clantag = _arg_1;
         this.updateInfo();
      }
      
      public function get rang() : int
      {
         return this._rang;
      }
      
      public function set rang(_arg_1:int) : void
      {
         this._rang = _arg_1;
         this.updateInfo();
      }
      
      public function updateScore(_arg_1:int, _arg_2:int) : void
      {
         if(_arg_1 != this._score && this._score != 0)
         {
            this.flashLabel(this.indicators.playerInfo,_arg_1 > this._score ? uint(this.normalGlowColor) : uint(this.minusGlowColor));
         }
         this._score = _arg_1;
         this._scoreRemain = _arg_2;
         this.updateInfo();
      }
      
      public function get progress() : int
      {
         return this._progress;
      }
      
      public function set progress(_arg_1:int) : void
      {
         if(this._progress == 0)
         {
            this._progress = _arg_1;
         }
         else
         {
            this._newProgress = _arg_1;
            this._progress = _arg_1;
            this.indicators.newprogress = _arg_1;
         }
         this.updateInfo();
      }
      
      public function get rating() : Number
      {
         return this._rating;
      }
      
      public function set rating(_arg_1:Number) : void
      {
         if(int(_arg_1) != this._rating && this._rating != 0)
         {
            this.flashLabel(this.indicators.kdRatio,int(_arg_1) > this._rating ? uint(this.normalGlowColor) : uint(this.minusGlowColor));
         }
         this._rating = int(_arg_1);
         this.updateInfo();
      }
      
      public function get ratingChange() : int
      {
         return this._rating;
      }
      
      public function set ratingChange(_arg_1:int) : void
      {
         this._ratingChange = _arg_1;
         this.updateInfo();
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function set position(_arg_1:int) : void
      {
         if(_arg_1 != this._position && this._position != 0)
         {
            this.flashLabel(this.indicators.scoreLabel,_arg_1 > this._position ? uint(this.minusGlowColor) : uint(this.normalGlowColor));
         }
         this._position = _arg_1;
         this.updateInfo();
      }
      
      public function get shield() : int
      {
         return this._shield;
      }
      
      public function set shield(_arg_1:int) : void
      {
         this._shield = _arg_1;
         this.updateInfo();
      }
      
      public function get weapon() : int
      {
         return this._weapon;
      }
      
      public function set weapon(_arg_1:int) : void
      {
         this._weapon = _arg_1;
         this.updateInfo();
      }
      
      public function get engine() : int
      {
         return this._engine;
      }
      
      public function set engine(_arg_1:int) : void
      {
         this._engine = _arg_1;
         this.updateInfo();
      }
      
      public function get money() : int
      {
         return this._money;
      }
      
      public function set money(_arg_1:int) : void
      {
      }
      
      public function get crystals() : int
      {
         return this._engine;
      }
      
      public function set crystals(_arg_1:int) : void
      {
         if(_arg_1 != this._crystals && this._crystals != 0)
         {
            this.flashLabel(this.indicators.crystalInfo,_arg_1 > this._crystals ? uint(this.normalGlowColor) : uint(this.minusGlowColor));
         }
         this._crystals = _arg_1;
         this.updateInfo();
      }
      
      private function configUI(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
         this.indicators.x = 59;
         this.setDefaultSharpnessAndThickness(this.indicators.crystalInfo);
         this.setDefaultSharpnessAndThickness(this.indicators.kdRatio);
         this.setDefaultSharpnessAndThickness(this.indicators.playerInfo);
         this.setDefaultSharpnessAndThickness(this.indicators.scoreLabel);
      }
      
      private function setDefaultSharpnessAndThickness(_arg_1:Label) : void
      {
         _arg_1.sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         _arg_1.thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
      }
      
      private function updateInfo() : void
      {
         this.indicators.playerInfo.text = String(this._score) + " / " + String(this._scoreRemain) + "   " + Rank.name(this._rang) + " " + this._clantag + this._playerName;
         this.indicators.progress = this._progress;
         this.indicators.kdRatio.text = String(int(this._rating));
         this.indicators.kd_icon.gotoAndStop(this._ratingChange + 2);
         switch(this._ratingChange)
         {
            case -1:
               this.indicators.kdRatio.color = 16717056;
               break;
            case 0:
               this.indicators.kdRatio.color = 11711154;
               break;
            case 1:
               this.indicators.kdRatio.color = 1244928;
         }
         this.indicators.crystalInfo.text = Money.numToString(this._crystals,false);
         this.width = this._width;
      }
      
      private function flashLabel(_arg_1:Label, _arg_2:uint = 16711680) : void
      {
         this.glowAlpha[_arg_1.name] = 1;
         this.glowColor[_arg_1.name] = _arg_2;
         _arg_1.addEventListener(Event.ENTER_FRAME,this.glowFrame);
      }
      
      private function glowFrame(_arg_1:Event) : void
      {
         var _local_2:Label = _arg_1.target as Label;
         var _local_3:GlowFilter = new GlowFilter(this.glowColor[_local_2.name],this.glowAlpha[_local_2.name],4,4,3,1,false);
         _local_2.filters = [_local_3];
         this.glowAlpha[_local_2.name] -= this.glowDelta;
         if(this.glowAlpha[_local_2.name] < 0)
         {
            _local_2.filters = [];
            _local_2.removeEventListener(Event.ENTER_FRAME,this.glowFrame);
         }
      }
      
      public function updateScoreRating(_arg_1:int) : void
      {
         this.ratingInfo.updateScoreRating(_arg_1);
         this.updateWidth();
      }
      
      public function updateGoldsTakenRating(_arg_1:int) : void
      {
         this.ratingInfo.updateGoldsTakenRating(_arg_1);
         this.updateWidth();
      }
      
      public function updateCrystalsRating(_arg_1:int) : void
      {
         this.ratingInfo.updateCrystalsRating(_arg_1);
         this.updateWidth();
      }
      
      private function updateWidth() : void
      {
         this.width = this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = int(_arg_1);
         this.indicators.width = _arg_1;
         this.ratingInfo.x = this.indicators.x + this.indicators.C1.x - this.ratingInfo.width - 3;
         this.ratingInfo.visible = this.ratingInfo.x > this.indicators.x + this.indicators.playerInfo.textWidth + 10;
      }
      
      public function setFirstBattleModeEnabled(_arg_1:Boolean) : void
      {
         this.indicators.kd_icon.visible = !_arg_1;
         this.indicators.kdicon.visible = !_arg_1;
         this.indicators.kdRatio.visible = !_arg_1;
         this.indicators.scoreLabel.visible = !_arg_1;
      }
   }
}

