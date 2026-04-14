package alternativa.tanks.model.userproperties
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.panel.IPanelView;
   import controls.PlayerInfo;
   import controls.panel.UpdateRankNotice;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import forms.MainPanel;
   import projects.tanks.client.panel.model.profile.userproperty.IUserPropertyModelBase;
   import projects.tanks.client.panel.model.profile.userproperty.UserPropertyModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class UserPropertiesModel extends UserPropertyModelBase implements IUserPropertyModelBase, IUserProperties
   {
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      private var CHANNEL:String = "UserPropertiesModel";
      
      private var _id:String;
      
      private var _name:String;
      
      private var _score:int;
      
      private var _rank:int;
      
      private var _nextScore:int;
      
      private var _startRating:Number;
      
      private var _place:int;
      
      private var _hasDoubleCrystal:Boolean;
      
      private var _currentRankScore:int;
      
      public function UserPropertiesModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         this._startRating = getInitParam().rating;
         userPropertiesService.init(getInitParam().id,getInitParam().uid,getInitParam().score,getInitParam().rank,getInitParam().serverNumber,getInitParam().templateBattlePage,getInitParam().gameHost,getInitParam().userProfileUrl);
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:Timer = null;
         this._id = getInitParam().id;
         this._name = getInitParam().uid;
         this._nextScore = getInitParam().nextRankScore;
         this._score = getInitParam().score;
         this._currentRankScore = getInitParam().currentRankScore;
         this._rank = getInitParam().rank;
         this._startRating = getInitParam().rating;
         this._place = getInitParam().place;
         this._hasDoubleCrystal = getInitParam().hasDoubleCrystal;
         this.setHasDoubleCrystal(this._hasDoubleCrystal);
         this.updateRatingAndPlace(this._startRating,this._place);
         var _local_2:MainPanel = panelView.getPanel();
         _local_2.rang = this._rank;
         this.updateScore(this._score);
         _local_2.playerInfo.playerName = this._name;
         moneyService.init(getInitParam().crystals);
         if(this._hasDoubleCrystal)
         {
            _local_1 = new Timer(getInitParam().durationCrystalAbonement);
            _local_1.addEventListener(TimerEvent.TIMER,this.onTimer);
            _local_1.start();
         }
      }
      
      private function onTimer(_arg_1:TimerEvent) : void
      {
         OSGi.clientLog.log(this.CHANNEL,"UserPropertiesModel onTimer");
         this.setHasDoubleCrystal(false);
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function updateScore(_arg_1:int) : void
      {
         var _local_2:int = this._score;
         this._score = _arg_1;
         panelView.getPanel().playerInfo.updateScore(_arg_1,this._nextScore);
         this.updateProgress();
         if(_arg_1 != _local_2)
         {
            userPropertiesService.updateScore(_arg_1);
         }
      }
      
      public function updateRank(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int) : void
      {
         var _local_6:int = this._rank;
         this._rank = _arg_1;
         this._score = _arg_2;
         this._nextScore = _arg_4;
         this._currentRankScore = _arg_3;
         var _local_7:MainPanel = panelView.getPanel();
         _local_7.rang = _arg_1;
         _local_7.playerInfo.updateScore(this._score,_arg_4);
         display.systemUILayer.addChild(new UpdateRankNotice(_arg_1,_arg_5));
         helpService.hideAllHelpers();
         this.updateProgress();
         if(_arg_1 != _local_6)
         {
            userPropertiesService.updateRank(_arg_1);
         }
      }
      
      private function updateProgress() : void
      {
         var _local_1:int = 0;
         if(this._nextScore != 0)
         {
            _local_1 = int((this._score - this._currentRankScore) / (this._nextScore - this._currentRankScore) * 10000);
         }
         else
         {
            _local_1 = 10000;
         }
         panelView.getPanel().playerInfo.progress = _local_1;
      }
      
      public function updateRatingAndPlace(_arg_1:Number, _arg_2:int) : void
      {
         this._place = _arg_2;
         var _local_3:PlayerInfo = panelView.getPanel().playerInfo;
         if(this._startRating < _arg_1)
         {
            _local_3.ratingChange = 1;
         }
         else if(this._startRating > _arg_1)
         {
            _local_3.ratingChange = -1;
         }
         else
         {
            _local_3.ratingChange = 0;
         }
         _local_3.rating = _arg_1;
         _local_3.position = this._place + 1;
      }
      
      public function getId() : String
      {
         return this._id;
      }
      
      public function getName() : String
      {
         return this._name;
      }
      
      public function getScore() : int
      {
         return this._score;
      }
      
      public function getRank() : int
      {
         return this._rank;
      }
      
      public function getNextScore() : int
      {
         return this._nextScore;
      }
      
      public function getPlace() : int
      {
         return this._place;
      }
      
      public function getHasDoubleCrystal() : Boolean
      {
         return this._hasDoubleCrystal;
      }
      
      public function setHasDoubleCrystal(_arg_1:Boolean) : void
      {
         this._hasDoubleCrystal = _arg_1;
         panelView.getPanel().hasDoubleCrystal = _arg_1;
      }
      
      public function changeCrystal(_arg_1:int) : void
      {
         moneyService.sym(_arg_1);
      }
      
      public function updateUid(_arg_1:String) : void
      {
         var _local_3:PlayerInfo = panelView.getPanel().playerInfo;
         _local_3.playerName = _arg_1;
      }
   }
}

