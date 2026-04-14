package alternativa.osgi.catalogs
{
   public class ServiceInfo
   {
      
      public var service:Object;
      
      public var params:Vector.<ServiceParam>;
      
      public function ServiceInfo(_arg_1:Object, _arg_2:Vector.<ServiceParam>)
      {
         super();
         this.service = _arg_1;
         this.params = _arg_2;
      }
   }
}

