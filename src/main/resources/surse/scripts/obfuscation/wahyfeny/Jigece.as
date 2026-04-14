package obfuscation.wahyfeny
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.types.Long;
   import forms.events.MainButtonBarEvents;
   import obfuscation.coh.Raqohybe;
   import obfuscation.pejug.Fyv;
   import obfuscation.pejug.Magyp;
   import obfuscation.pejug.Ruperip;
   import obfuscation.qenomy.Gipafili;
   import obfuscation.rabygi.Jabehi;
   import obfuscation.rabygi.Nunaqypep;
   import obfuscation.rabygi.Wegy;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Jigece extends Fyv implements Ruperip, ObjectLoadPostListener, ObjectUnloadPostListener
   {
      
      [Inject]
      public static var panelView:IPanelView;
      
      private var wiq:Raqohybe;
      
      private var hapizoqe:Boolean;
      
      public function Jigece()
      {
         super();
      }
      
      public function showQuestWindowWithoutDailyQuests(_arg_1:Gipafili) : void
      {
         if(!this.hapizoqe)
         {
            this.wiq = new Raqohybe();
            this.wiq.addEventListener(Wegy.vih,this.bomovocuj);
            this.wiq.fugago(_arg_1);
            this.wiq.vuw();
            this.wiq.show();
            this.hapizoqe = true;
         }
      }
      
      public function showQuestWindow(_arg_1:Vector.<Magyp>, _arg_2:Gipafili) : void
      {
         if(!this.hapizoqe)
         {
            this.wiq = new Raqohybe();
            this.wiq.addEventListener(Jabehi.DAILY_QUEST_CHANGE,this.gamikut);
            this.wiq.addEventListener(Nunaqypep.DAILY_QUEST_GET_PRIZE,this.nelyzi);
            this.wiq.addEventListener(Wegy.vih,this.bomovocuj);
            this.hapizoqe = true;
            this.wiq.init(_arg_1);
            this.wiq.fugago(_arg_2);
            this.wiq.show();
         }
      }
      
      private function bomovocuj(_arg_1:Wegy) : void
      {
         this.wiq.removeEventListener(Jabehi.DAILY_QUEST_CHANGE,this.gamikut);
         this.wiq.removeEventListener(Nunaqypep.DAILY_QUEST_GET_PRIZE,this.nelyzi);
         this.wiq.removeEventListener(Wegy.vih,this.bomovocuj);
         this.hapizoqe = false;
      }
      
      private function nelyzi(_arg_1:Nunaqypep) : void
      {
         Timazysol(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(1302806391,660914812))).takePrize(_arg_1.puw);
      }
      
      private function gamikut(_arg_1:Jabehi) : void
      {
         Timazysol(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(1302806391,660914812))).skipDailyQuest(_arg_1.puw);
      }
      
      public function skipDailyQuest(_arg_1:Long, _arg_2:Magyp) : void
      {
         if(this.hapizoqe)
         {
            this.wiq.qyloset(_arg_1,_arg_2);
         }
      }
      
      public function takeDailyQuestPrize(_arg_1:Long) : void
      {
         if(this.hapizoqe)
         {
            this.wiq.takePrize(_arg_1);
         }
      }
      
      public function objectLoadedPost() : void
      {
         panelView.getPanel().buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      public function objectUnloadedPost() : void
      {
         panelView.getPanel().buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(_arg_1:MainButtonBarEvents) : void
      {
         if(_arg_1.typeButton == MainButtonBarEvents.pujoza)
         {
            server.pef();
         }
      }
   }
}

