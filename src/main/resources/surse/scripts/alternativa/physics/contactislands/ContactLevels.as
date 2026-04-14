package alternativa.physics.contactislands
{
   import alternativa.physics.Body;
   import alternativa.physics.BodyContact;
   
   public class ContactLevels
   {
      
      private const contacts:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      public function ContactLevels()
      {
         super();
      }
      
      public function init(_arg_1:Vector.<BodyContact>) : void
      {
         var _local_3:int = 0;
         var _local_2:int = int(_arg_1.length);
         this.contacts.length = _local_2;
         while(_local_3 < _local_2)
         {
            this.contacts[_local_3] = _arg_1[_local_3];
            _local_3++;
         }
      }
      
      public function clear() : void
      {
         this.contacts.length = 0;
      }
      
      public function getStaticLevel(_arg_1:Vector.<BodyContact>, _arg_2:Vector.<Body>) : void
      {
         var _local_3:int = 0;
         var _local_4:BodyContact = null;
         _local_3 = 0;
         while(_local_3 < this.contacts.length)
         {
            _local_4 = this.contacts[_local_3];
            if(this.isStaticContact(_local_4))
            {
               _arg_1[_arg_1.length] = _local_4;
               _arg_2[_arg_2.length] = this.getNonStaticBody(_local_4);
               this.removeContact(_local_3);
               _local_3--;
            }
            _local_3++;
         }
         _local_3 = 0;
         while(_local_3 < this.contacts.length)
         {
            _local_4 = this.contacts[_local_3];
            if(_arg_2.indexOf(_local_4.body1) >= 0 && _arg_2.indexOf(_local_4.body2) >= 0)
            {
               _arg_1[_arg_1.length] = _local_4;
               this.removeContact(_local_3);
               _local_3--;
            }
            _local_3++;
         }
      }
      
      private function isStaticContact(_arg_1:BodyContact) : Boolean
      {
         return !(_arg_1.body1.movable && _arg_1.body2.movable);
      }
      
      private function getNonStaticBody(_arg_1:BodyContact) : Body
      {
         if(_arg_1.body1.movable)
         {
            return _arg_1.body1;
         }
         return _arg_1.body2;
      }
      
      private function removeContact(_arg_1:int) : void
      {
         var _local_2:int = this.contacts.length - 1;
         this.contacts[_arg_1] = this.contacts[_local_2];
         this.contacts.length = _local_2;
      }
      
      public function getNextLevel(_arg_1:Vector.<Body>, _arg_2:Vector.<BodyContact>, _arg_3:Vector.<Body>) : void
      {
         var _local_4:int = 0;
         var _local_5:BodyContact = null;
         _local_4 = 0;
         while(_local_4 < this.contacts.length)
         {
            _local_5 = this.contacts[_local_4];
            if(this.isInContactWith(_arg_1,_local_5))
            {
               _arg_2[_arg_2.length] = _local_5;
               _arg_3[_arg_3.length] = this.getNextLevelBody(_local_5,_arg_1);
               this.removeContact(_local_4);
               _local_4--;
            }
            _local_4++;
         }
         _local_4 = 0;
         while(_local_4 < this.contacts.length)
         {
            _local_5 = this.contacts[_local_4];
            if(_arg_3.indexOf(_local_5.body1) >= 0 && _arg_3.indexOf(_local_5.body2) >= 0)
            {
               _arg_2[_arg_2.length] = _local_5;
               this.removeContact(_local_4);
               _local_4--;
            }
            _local_4++;
         }
      }
      
      private function isInContactWith(_arg_1:Vector.<Body>, _arg_2:BodyContact) : Boolean
      {
         return _arg_1.indexOf(_arg_2.body1) >= 0 || _arg_1.indexOf(_arg_2.body2) >= 0;
      }
      
      private function getNextLevelBody(_arg_1:BodyContact, _arg_2:Vector.<Body>) : Body
      {
         if(_arg_2.indexOf(_arg_1.body1) < 0)
         {
            return _arg_1.body1;
         }
         return _arg_1.body2;
      }
      
      public function hasContacts() : Boolean
      {
         return this.contacts.length > 0;
      }
   }
}

