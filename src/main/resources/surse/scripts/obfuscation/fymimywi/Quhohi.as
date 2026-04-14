package obfuscation.fymimywi
{
   import controls.Label;
   import forms.userlabel.ChatUpdateEvent;
   import obfuscation.joni.ShortUserInfo;
   import obfuscation.kumopurut.Sohezit;
   import obfuscation.mujusaqim.MessageColor;
   import obfuscation.pawikoz.Fojuhe;
   import obfuscation.pikobu.Munano;
   import obfuscation.pikobu.Salivopot;
   
   public class Quhohi extends Fojuhe
   {
      
      private var kigo:Munano;
      
      private var label:Label;
      
      public function Quhohi(_arg_1:ShortUserInfo, _arg_2:String, _arg_3:ShortUserInfo = null)
      {
         super();
         if(_arg_1 != null)
         {
            this.mako(_arg_1);
         }
         this.zyzys(_arg_2);
         if(_arg_3 != null)
         {
            this.mako(_arg_3);
         }
      }
      
      private function mako(_arg_1:ShortUserInfo) : void
      {
         this.kigo = new Salivopot(_arg_1.userId);
         this.kigo.addEventListener(ChatUpdateEvent.UPDATE,this.lifyw);
         this.kigo.setUidColor(MessageColor.sorijez(_arg_1.teamType,false),true);
         this.kigo.x = width + 4;
         addChild(this.kigo);
      }
      
      private function lifyw(_arg_1:ChatUpdateEvent) : void
      {
         this.kigo.x = 4;
         this.label.x = this.kigo.width + 4;
         dispatchEvent(new Sohezit(Sohezit.nepih,this));
      }
      
      private function zyzys(_arg_1:String) : void
      {
         this.label = new Label();
         this.label.text = _arg_1;
         this.label.x = width + 4;
         shadowContainer.addChild(this.label);
      }
   }
}

