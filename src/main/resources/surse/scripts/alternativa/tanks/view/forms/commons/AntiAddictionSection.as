package alternativa.tanks.view.forms.commons
{
   import alternativa.tanks.view.events.AntiAddictionInfoUpdatedEvent;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import forms.events.LoginFormEvent;
   
   public class AntiAddictionSection extends TankWindowInner
   {
      
      public var realName:TankInputBase;
      
      public var idNumber:TankInputBase;
      
      private var _idValid:Boolean;
      
      private var _realNameValid:Boolean;
      
      public function AntiAddictionSection()
      {
         super();
         this.width = 350;
         var _local_1:LabelBase = new LabelBase();
         _local_1.text = "按照版署《网络游戏未成年人防沉迷系统》要求 \n" + "\t未满18岁的用户和身份信息不完整的用户将受到防沉迷系统的限制，游戏沉迷时间超过3小时收益减半，超过5小时收益为0 。" + "\n\t已满18岁的用户将等待公安机关的身份验证，验证通过的用户将不受限制，不通过的用户需要重新修改身份信息，否则将纳入防沉迷系统管理。";
         _local_1.x = 15;
         _local_1.y = 15;
         _local_1.wordWrap = true;
         _local_1.width = width - 30;
         this.realName = new TankInputBase();
         this.realName.label = "您的真实姓名:";
         this.realName.x = 112;
         this.realName.y = _local_1.y + _local_1.height + 15;
         this.realName.width = width - this.realName.x - 15;
         this._realNameValid = false;
         this.idNumber = new TankInputBase();
         this.idNumber.label = "身份证号码:";
         this.idNumber.x = 112;
         this.idNumber.y = this.realName.y + this.realName.height + 10;
         this.idNumber.width = width - this.idNumber.x - 15;
         this._idValid = false;
         this.height = this.idNumber.y + this.idNumber.height + 15;
         addChild(_local_1);
         addChild(this.realName);
         addChild(this.idNumber);
         this.idNumber.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateAddictionID);
         this.realName.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateRealName);
      }
      
      private function validateRealName(_arg_1:LoginFormEvent) : void
      {
         var _local_2:String = null;
         var _local_3:Boolean = false;
         var _local_4:Boolean = false;
         if(this.realName != null)
         {
         }
         dispatchEvent(new AntiAddictionInfoUpdatedEvent());
      }
      
      private function validateAddictionID(_arg_1:LoginFormEvent) : void
      {
         var _local_2:String = null;
         var _local_3:Boolean = false;
         var _local_4:Boolean = false;
         if(this.idNumber != null)
         {
         }
         dispatchEvent(new AntiAddictionInfoUpdatedEvent());
      }
      
      private function trimString(_arg_1:String) : String
      {
         if(_arg_1.charAt(0) == " ")
         {
            _arg_1 = this.trimString(_arg_1.substring(1));
         }
         if(_arg_1.charAt(_arg_1.length - 1) == " ")
         {
            _arg_1 = this.trimString(_arg_1.substring(0,_arg_1.length - 1));
         }
         return _arg_1;
      }
      
      public function isIdValid() : Boolean
      {
         return this._idValid;
      }
      
      public function isRealNameValid() : Boolean
      {
         return this._realNameValid;
      }
   }
}

