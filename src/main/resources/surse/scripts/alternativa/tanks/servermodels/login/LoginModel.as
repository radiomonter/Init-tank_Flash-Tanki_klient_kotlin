package alternativa.tanks.servermodels.login
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.service.IEntranceClientFacade;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   
   public class LoginModel implements ILogin
   {
      
      [Inject]
      public static var entranceClientFacade:IEntranceClientFacade;
      
      public function LoginModel()
      {
         super();
      }
      
      public function wrongPassword() : void
      {
         entranceClientFacade.wrongPassword();
      }
      
      public function login(_arg_1:String, _arg_2:String, _arg_3:Boolean, _arg_4:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("auth;login;" + _arg_4 + ";" + _arg_3 + ";" + _arg_1 + ";" + _arg_2);
      }
   }
}

