package com.reygazu.anticheat.variables
{
   import com.reygazu.anticheat.managers.CheatManager;
   
   public class SecureNumber
   {
      
      private var secureData:SecureObject;
      
      private var fake:Number;
      
      public function SecureNumber(_arg_1:String = "Unnamed SecureNumber", _arg_2:Number = 0)
      {
         super();
         this.fake = _arg_2;
         this.secureData = new SecureObject(_arg_1,_arg_2);
      }
      
      public function set value(_arg_1:Number) : void
      {
         if(this.fake != this.secureData.objectValue)
         {
            CheatManager.getInstance().detectCheat(this.secureData.name,this.fake,this.secureData.objectValue);
         }
         this.secureData.objectValue = _arg_1;
         this.fake = _arg_1;
      }
      
      public function get value() : Number
      {
         return this.secureData.objectValue as Number;
      }
   }
}

