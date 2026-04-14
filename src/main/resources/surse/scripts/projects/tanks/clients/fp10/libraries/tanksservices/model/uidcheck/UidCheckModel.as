package projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck
{
   import alternativa.osgi.OSGi;
   import obfuscation.pytimykap.Napamakan;
   import obfuscation.pytimykap.Qifizid;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class UidCheckModel extends Napamakan implements Qifizid, ObjectLoadListener, ObjectUnloadListener, UidCheckService
   {
      
      private var validateCallback:Function;
      
      public function UidCheckModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         OSGi.getInstance().registerService(UidCheckService,this);
      }
      
      public function objectUnloaded() : void
      {
         OSGi.getInstance().unregisterService(UidCheckService);
      }
      
      public function validateResult(_arg_1:ValidationStatus) : void
      {
         if(Boolean(this.validateCallback))
         {
            this.validateCallback(_arg_1);
         }
         this.validateCallback = null;
      }
      
      public function getMaxLength() : int
      {
         return getInitParam().length;
      }
      
      public function exist(param1:String, param2:Function) : void
      {
         var uid:String = param1;
         var callback:Function = param2;
         this.validate(uid,function(_arg_1:ValidationStatus):void
         {
            callback(_arg_1 == ValidationStatus.NOT_UNIQUE);
         });
      }
      
      public function validate(_arg_1:String, _arg_2:Function) : void
      {
         this.validateCallback = _arg_2;
         server.syvagycy(_arg_1);
      }
   }
}

