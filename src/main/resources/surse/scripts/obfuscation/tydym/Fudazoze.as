package obfuscation.tydym
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.Rymefuqiw;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class Fudazoze extends Sprite
   {
      
      public static const jiqekejin:int = 1;
      
      public static const munykumoh:int = 2;
      
      public static const copymumy:int = 3;
      
      public static const qewovesez:int = 4;
      
      public var mot:Bitmap;
      
      public var kad:Bitmap;
      
      public var hedohygyl:Bitmap;
      
      private var states:Dictionary = new Dictionary();
      
      private var currentState:Kolovi;
      
      public function Fudazoze(_arg_1:Bitmap, _arg_2:Bitmap, _arg_3:Bitmap, _arg_4:Rymefuqiw)
      {
         super();
         this.mot = _arg_1;
         this.kad = _arg_2;
         this.hedohygyl = _arg_3;
         addChild(_arg_1);
         addChild(_arg_2);
         addChild(_arg_3);
         this.states[jiqekejin] = new Rotanes(jiqekejin,this);
         this.states[qewovesez] = new Fuketycu(qewovesez,this,10 / 1000,1 / 1000,300);
         this.states[munykumoh] = new Gesu(munykumoh,this,_arg_4,0);
         this.states[copymumy] = new Gesu(copymumy,this,_arg_4,1);
         this.currentState = this.states[jiqekejin];
         this.currentState.start();
      }
      
      public function setState(_arg_1:int) : void
      {
         if(this.currentState.getType() == _arg_1)
         {
            return;
         }
         this.currentState.stop();
         this.currentState = this.states[_arg_1];
         this.currentState.start();
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         this.currentState.update(_arg_1,_arg_2);
      }
   }
}

