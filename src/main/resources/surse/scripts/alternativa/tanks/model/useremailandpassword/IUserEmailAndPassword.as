package alternativa.tanks.model.useremailandpassword
{
   public interface IUserEmailAndPassword
   {
      
      function changePassword(param1:String) : void;
      
      function changeEmail(param1:String, param2:String) : void;
      
      function getEmail() : String;
      
      function sendChangeInstruction(param1:String) : void;
   }
}

