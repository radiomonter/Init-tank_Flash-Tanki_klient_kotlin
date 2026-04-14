package obfuscation.zupozikuh
{
   import controls.Label;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class Tah extends Sprite
   {
      
      private const qewyhyseb:int = 3;
      
      private const cesy:int = 18;
      
      private var numMessages:int;
      
      private var messages:Vector.<Jecyvedu> = new Vector.<Jecyvedu>();
      
      private var nacub:int;
      
      private var vebo:Vector.<Jecyvedu> = new Vector.<Jecyvedu>();
      
      public function Tah()
      {
         super();
         filters = [new GlowFilter(0,0.75,5,5)];
      }
      
      public function addMessage(_arg_1:uint, _arg_2:String) : void
      {
         this.tosovamum();
         var _local_3:Jecyvedu = this.messages[this.numMessages] = this.createMessage();
         _local_3.init();
         this.pajud(_local_3,_arg_1,_arg_2);
      }
      
      public function lapibamyf(_arg_1:uint, _arg_2:String, _arg_3:int) : void
      {
         this.tosovamum();
         var _local_4:Jecyvedu = this.messages[this.numMessages] = this.createMessage();
         _local_4.wabiveso(_arg_3);
         this.pajud(_local_4,_arg_1,_arg_2);
      }
      
      private function tosovamum() : void
      {
         if(this.numMessages == this.qewyhyseb)
         {
            this.saluhyjot(0);
         }
      }
      
      private function pajud(_arg_1:Jecyvedu, _arg_2:uint, _arg_3:String) : void
      {
         var _local_4:Label = _arg_1.getLabel();
         addChild(_local_4);
         _local_4.color = _arg_2;
         _local_4.text = _arg_3;
         _local_4.x = -0.5 * _local_4.width;
         _local_4.y = this.cesy * this.numMessages;
         ++this.numMessages;
      }
      
      public function update(_arg_1:uint) : void
      {
         var _local_2:Jecyvedu = null;
         var _local_3:int = 0;
         while(_local_3 < this.numMessages)
         {
            _local_2 = this.messages[_local_3];
            if(_local_2.tub)
            {
               this.saluhyjot(_local_3);
               _local_3--;
            }
            else
            {
               _local_2.update(_arg_1);
            }
            _local_3++;
         }
      }
      
      public function removeFromParent() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function saluhyjot(_arg_1:int) : void
      {
         var _local_2:Label = null;
         var _local_3:Jecyvedu = this.messages[_arg_1];
         this.qodi(_local_3);
         var _local_4:int = _arg_1 + 1;
         while(_local_4 < this.numMessages)
         {
            _local_3 = this.messages[int(_local_4 - 1)] = this.messages[_local_4];
            _local_2 = _local_3.getLabel();
            _local_2.y -= this.cesy;
            _local_4++;
         }
         --this.numMessages;
      }
      
      private function qodi(_arg_1:Jecyvedu) : void
      {
         removeChild(_arg_1.getLabel());
         var _local_2:* = this.nacub++;
         this.vebo[_local_2] = _arg_1;
      }
      
      private function createMessage() : Jecyvedu
      {
         var _local_1:Jecyvedu = null;
         if(this.nacub == 0)
         {
            _local_1 = new Jecyvedu();
         }
         else
         {
            _local_1 = this.vebo[--this.nacub];
            this.vebo[this.nacub] = null;
         }
         return _local_1;
      }
   }
}

