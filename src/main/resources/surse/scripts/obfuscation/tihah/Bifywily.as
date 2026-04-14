package obfuscation.tihah
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Zigi;
   import flash.events.Event;
   
   public class Bifywily extends Zigi
   {
      
      protected var _value:int;
      
      protected var kehobemup:int;
      
      private var ratykyqa:Hyn;
      
      public function Bifywily(_arg_1:int, _arg_2:int, _arg_3:Hyn)
      {
         super(_arg_2);
         this.kehobemup = _arg_1;
         this.ratykyqa = _arg_3;
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function set value(_arg_1:int) : void
      {
         this._value = _arg_1;
         this.updateLabel();
         if(this._value <= this.kehobemup)
         {
            this.pozorij();
         }
         else
         {
            this.gif();
         }
      }
      
      public function pozorij() : void
      {
         if(this.ratykyqa != null)
         {
            this.ratykyqa.maneva(this);
         }
      }
      
      public function gif() : void
      {
         if(this.ratykyqa != null)
         {
            this.ratykyqa.qemisyge(this);
         }
         label.visible = true;
      }
      
      public function get jec() : Boolean
      {
         return label.visible;
      }
      
      public function set jec(_arg_1:Boolean) : void
      {
         label.visible = _arg_1;
      }
      
      protected function updateLabel() : void
      {
         text = this._value.toString();
      }
      
      protected function onRemovedFromStage(_arg_1:Event) : void
      {
         this.gif();
      }
   }
}

