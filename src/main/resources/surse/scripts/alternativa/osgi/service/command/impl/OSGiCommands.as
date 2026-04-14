package alternativa.osgi.service.command.impl
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.Qajuhy;
   import alternativa.osgi.catalogs.ServiceInfo;
   import alternativa.osgi.catalogs.ServiceParam;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   
   public class OSGiCommands
   {
      
      private var commandService:CommandService;
      
      private var osgi:OSGi;
      
      public function OSGiCommands(_arg_1:OSGi, _arg_2:CommandService)
      {
         super();
         this.osgi = _arg_1;
         this.commandService = _arg_2;
         _arg_2.registerCommand("osgi","ss","Список плагинов",[],this.cmdBundlesList);
         _arg_2.registerCommand("osgi","services","Список сервисов",[],this.cmdServicesList);
      }
      
      public function cmdBundlesList(_arg_1:FormattedOutput) : void
      {
         var _local_3:int = 0;
         var _local_2:Vector.<Qajuhy> = this.osgi.bundleList;
         while(_local_3 < _local_2.length)
         {
            _arg_1.addText(int(_local_3 + 1).toString() + ". " + _local_2[_local_3].name);
            _local_3++;
         }
      }
      
      public function cmdServicesList(_arg_1:FormattedOutput) : void
      {
         var _local_2:ServiceInfo = null;
         var _local_4:int = 0;
         var _local_3:Vector.<ServiceInfo> = this.osgi.getServicesInfo();
         while(_local_4 < _local_3.length)
         {
            _local_2 = _local_3[_local_4];
            _arg_1.addText((_local_4 + 1).toString() + ": " + _local_2.service + this.getServicesParam(_local_2.params));
            _local_4++;
         }
      }
      
      private function getServicesParam(_arg_1:Vector.<ServiceParam>) : String
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:ServiceParam = null;
         var _local_5:* = " ";
         if(_arg_1 != null)
         {
            _local_2 = 0;
            _local_3 = int(_arg_1.length);
            while(_local_2 < _local_3)
            {
               _local_4 = _arg_1[_local_2];
               _local_5 += "(" + _local_4.name + " = " + _local_4.value + ")";
               _local_2++;
            }
         }
         return _local_5;
      }
   }
}

