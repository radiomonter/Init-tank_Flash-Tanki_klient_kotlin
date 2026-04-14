package alternativa.tanks.gui.panel
{
   import alternativa.tanks.gui.panel.helpers.PlayerInfoHelper;
   import controls.Label;
   import flash.display.Sprite;
   
   public class PlayerRatingInfo extends Sprite
   {
      
      private static const OFFSET_IN_RATINGS:int = 3;
      
      private static const TEXT_COLOR:uint = 1244928;
      
      private static const TEXT_SIZE:uint = 11;
      
      private static const Y_OFFSET:uint = 1;
      
      private var ratingScoreCode:Label = new Label();
      
      private var ratingScoreValue:Label = new Label();
      
      private var ratingGoldsTakenCode:Label = new Label();
      
      private var ratingGoldsTakenValue:Label = new Label();
      
      private var ratingCrystalsCode:Label = new Label();
      
      private var ratingCrystalsValue:Label = new Label();
      
      private var previousLabel:Label;
      
      private var score:int;
      
      private var goldsTaken:int;
      
      private var crystals:int;
      
      public function PlayerRatingInfo()
      {
         super();
      }
      
      public function updateScoreRating(_arg_1:int) : void
      {
         this.score = _arg_1;
         this.update();
      }
      
      public function updateGoldsTakenRating(_arg_1:int) : void
      {
         this.goldsTaken = _arg_1;
         this.update();
      }
      
      public function updateCrystalsRating(_arg_1:int) : void
      {
         this.crystals = _arg_1;
         this.update();
      }
      
      public function update() : void
      {
         this.clearAll();
         this.addLabelsIfValueGreaterThanZero(this.ratingScoreCode,this.ratingScoreValue,"EXP:",this.score);
         this.addLabelsIfValueGreaterThanZero(this.ratingGoldsTakenCode,this.ratingGoldsTakenValue,"GLD:",this.goldsTaken);
         this.addLabelsIfValueGreaterThanZero(this.ratingCrystalsCode,this.ratingCrystalsValue,"CRY:",this.crystals);
      }
      
      private function clearAll() : void
      {
         this.previousLabel = null;
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      private function addLabelsIfValueGreaterThanZero(_arg_1:Label, _arg_2:Label, _arg_3:String, _arg_4:int) : void
      {
         if(_arg_4 > 0)
         {
            this.addRatingCodeLabel(_arg_1,_arg_3);
            this.addRatingValueLabel(_arg_2,_arg_4);
         }
      }
      
      private function addRatingCodeLabel(_arg_1:Label, _arg_2:String) : void
      {
         _arg_1.color = TEXT_COLOR;
         _arg_1.text = _arg_2;
         PlayerInfoHelper.setDefaultSharpnessAndThickness(_arg_1);
         if(this.previousLabel != null)
         {
            this.updateLabelPosition(_arg_1,this.previousLabel);
         }
         addChild(_arg_1);
         this.previousLabel = _arg_1;
      }
      
      private function addRatingValueLabel(_arg_1:Label, _arg_2:int) : void
      {
         _arg_1.size = TEXT_SIZE;
         _arg_1.y = Y_OFFSET;
         this.addRatingCodeLabel(_arg_1,_arg_2.toString());
      }
      
      private function updateLabelPosition(_arg_1:Label, _arg_2:Label) : void
      {
         _arg_1.x = _arg_2.x + _arg_2.textWidth + OFFSET_IN_RATINGS;
      }
   }
}

