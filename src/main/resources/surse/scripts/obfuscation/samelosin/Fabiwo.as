package obfuscation.samelosin
{
   import com.reygazu.anticheat.variables.SecureInt;
   import com.reygazu.anticheat.variables.SecureNumber;
   
   public class Fabiwo
   {
      
      public var dyrewuneb:SecureNumber = new SecureNumber("autoAimingAngleDown ",0);
      
      public var vom:SecureNumber = new SecureNumber("autoAimingAngleUp ",0);
      
      public var votyfyzo:SecureInt = new SecureInt("numRaysUp ",0);
      
      public var dyheh:SecureInt = new SecureInt("numRaysDown ",0);
      
      public var reloadMsec:SecureInt = new SecureInt("reloadMsec");
      
      public function Fabiwo(_arg_1:int)
      {
         super();
         this.reloadMsec.value = _arg_1;
      }
   }
}

