package alternativa.osgi.service.launcherparams
{
   import alternativa.startup.LibraryInfo;
   import alternativa.utils.Properties;
   import flash.display.LoaderInfo;
   
   public class LauncherParams implements ILauncherParams
   {
      
      private var strictUseHttp:Boolean;
      
      private var _urlLoader:String;
      
      private var urlParams:Properties;
      
      private var _startupLibraryInfos:Vector.<LibraryInfo>;
      
      public function LauncherParams(_arg_1:LoaderInfo = null, _arg_2:* = false)
      {
         super();
         if(Boolean(_arg_1))
         {
            this._urlLoader = _arg_1.loaderURL;
            this.urlParams = new Properties(_arg_1.parameters);
         }
         else
         {
            this.urlParams = new Properties();
         }
         this.strictUseHttp = _arg_2;
      }
      
      public function setStartupLibraryInfos(_arg_1:Vector.<LibraryInfo>) : void
      {
         this._startupLibraryInfos = _arg_1;
      }
      
      public function getParameter(_arg_1:String, _arg_2:String = null) : String
      {
         return this.urlParams.getProperty(_arg_1) || _arg_2;
      }
      
      public function setParameter(_arg_1:String, _arg_2:String) : void
      {
         this.urlParams.setProperty(_arg_1,_arg_2);
      }
      
      public function removeParameter(_arg_1:String) : void
      {
         this.urlParams.removeProperty(_arg_1);
      }
      
      public function get parameterNames() : Vector.<String>
      {
         return this.urlParams.propertyNames;
      }
      
      public function get startupLibraryInfos() : Vector.<LibraryInfo>
      {
         return this._startupLibraryInfos;
      }
      
      public function get isDebug() : Boolean
      {
         return Boolean(this.urlParams.getProperty("debug"));
      }
      
      public function get urlLoader() : String
      {
         return this._urlLoader;
      }
      
      public function isStrictUseHttp() : Boolean
      {
         return this.strictUseHttp;
      }
   }
}

