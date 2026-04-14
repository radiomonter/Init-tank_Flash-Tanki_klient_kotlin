package alternativa.tanks.models.battle.gui.chat
{
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.userlabel.ChatUpdateEvent;
   import obfuscation.bude.BattleTeam;
   import obfuscation.kumopurut.Sohezit;
   import obfuscation.pawikoz.Fojuhe;
   import obfuscation.pawikoz.Tyryhu;
   
   public class Wohokoryk extends Tyryhu
   {
      
      private static const lylibylut:int = 300;
      
      private static const qewyhyseb:int = 100;
      
      private static const covi:int = 5;
      
      private var buffer:Array = [];
      
      private var pijigakaq:Boolean = true;
      
      private var qyja:uint = 0;
      
      public function Wohokoryk()
      {
         super();
      }
      
      public function addLine(_arg_1:String, _arg_2:BattleTeam, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean) : void
      {
         this.rydum();
         var _local_6:Robyq = new Robyq(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         _local_6.addEventListener(Sohezit.nasun,this.cywasu);
         this.kotamovob(_local_6);
         feramul(_local_6);
         container.addEventListener(ChatUpdateEvent.UPDATE,this.lifyw);
      }
      
      private function lifyw(_arg_1:ChatUpdateEvent) : void
      {
         if(this.qyja != 0)
         {
            clearTimeout(this.qyja);
         }
         this.qyja = setTimeout(this.hivy,100);
      }
      
      private function hivy() : void
      {
         var _local_1:Fojuhe = null;
         this.qyja = 0;
         for each(_local_1 in this.buffer)
         {
            if(_local_1 is Robyq)
            {
               Robyq(_local_1).alignChatUserLabel();
            }
         }
      }
      
      public function fikaqu(_arg_1:String) : void
      {
         this.rydum();
         var _local_2:Cymuryful = new Cymuryful(lylibylut,_arg_1);
         _local_2.addEventListener(Sohezit.nasun,this.cywasu);
         this.kotamovob(_local_2);
         feramul(_local_2);
      }
      
      override public function rac(_arg_1:Boolean = false) : Fojuhe
      {
         var _local_2:Fojuhe = super.rac();
         this.y += shift;
         if(_arg_1)
         {
            this.buffer.shift();
         }
         return _local_2;
      }
      
      public function luteteqy() : void
      {
         var _local_1:int = 0;
         var _local_2:Fojuhe = null;
         this.pijigakaq = false;
         var _local_3:int = this.buffer.length - container.numChildren;
         _local_1 = 0;
         while(_local_1 < container.numChildren)
         {
            _local_2 = Fojuhe(container.getChildAt(_local_1));
            _local_2.pisypup();
            _local_1++;
         }
         _local_1 = _local_3 - 1;
         while(_local_1 >= 0)
         {
            try
            {
               kugydiwu(Fojuhe(this.buffer[_local_1]));
            }
            catch(err:Error)
            {
            }
            _local_1--;
         }
      }
      
      public function puqifu() : void
      {
         var _local_1:int = 0;
         var _local_2:Fojuhe = null;
         this.pijigakaq = true;
         var _local_3:int = container.numChildren - covi;
         _local_1 = 0;
         while(_local_1 < _local_3)
         {
            this.rac();
            _local_1++;
         }
         _local_1 = 0;
         while(_local_1 < container.numChildren)
         {
            _local_2 = Fojuhe(container.getChildAt(_local_1));
            if(!_local_2.alive)
            {
               this.rac();
               _local_1--;
            }
            else
            {
               _local_2.jezupadi();
            }
            _local_1++;
         }
      }
      
      public function clear() : void
      {
         this.buffer.length = 0;
         var _local_1:int = container.numChildren - 1;
         while(_local_1 >= 0)
         {
            container.removeChildAt(_local_1);
            _local_1--;
         }
      }
      
      private function cywasu(_arg_1:Sohezit) : void
      {
         if(this.pijigakaq && container.contains(_arg_1.line))
         {
            this.rac();
         }
         _arg_1.line.removeEventListener(Sohezit.nasun,this.cywasu);
      }
      
      private function rydum() : void
      {
         if(this.pijigakaq && container.numChildren > covi || !this.pijigakaq && container.numChildren >= qewyhyseb)
         {
            this.rac();
         }
      }
      
      private function kotamovob(_arg_1:Fojuhe) : void
      {
         this.buffer.push(_arg_1);
         if(this.buffer.length > qewyhyseb)
         {
            this.buffer.shift();
         }
      }
   }
}

