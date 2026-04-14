package platform.client.fp10.core
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.types.Long;
   import flash.system.System;
   import flash.utils.getQualifiedClassName;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.service.transport.ITransportService;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class CoreCommands
   {
      
      [Inject]
      public static var gameTypeRegistry:GameTypeRegistry;
      
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var commandService:CommandService;
      
      [Inject]
      public static var transportService:ITransportService;
      
      private var osgi:OSGi;
      
      public function CoreCommands()
      {
         super();
         this.osgi = OSGi.getInstance();
         commandService.registerCommand("core","models","Список моделей поведения",[],this.cmdModelsList);
         commandService.registerCommand("core","objects","Список загруженных объектов",[],this.cmdObjectsList);
         commandService.registerCommand("core","resource","Список ресурсов",[],this.cmdResourcesList);
         commandService.registerCommand("core","spaces","Список спейсов",[],this.cmdSpacesList);
         commandService.registerCommand("system","gc","Вызвать сборщик мусора (debug only)",[],this.cmdSystemGc);
      }
      
      private function cmdSystemGc(_arg_1:FormattedOutput) : void
      {
         System.gc();
      }
      
      private function cmdSpacesList(_arg_1:FormattedOutput) : void
      {
         var _local_2:ISpace = null;
         var _local_3:Vector.<ISpace> = SpaceRegistry(this.osgi.getService(SpaceRegistry)).spaces;
         for each(_local_2 in _local_3)
         {
            _arg_1.addText("space id: " + (_local_2.id == null ? "null" : _local_2.id.toString()));
         }
      }
      
      private function cmdModelsList(_arg_1:FormattedOutput) : void
      {
         var _local_2:IModel = null;
         var _local_3:String = null;
         var _local_4:Vector.<Class> = null;
         var _local_5:Vector.<String> = null;
         var _local_6:Class = null;
         var _local_7:String = null;
         var _local_8:int = 0;
         var _local_9:ModelRegistry = ModelRegistry(this.osgi.getService(ModelRegistry));
         for each(_local_2 in _local_9.models)
         {
            _local_3 = getQualifiedClassName(_local_2);
            _arg_1.addText(_local_3);
            _arg_1.addText("  id: " + _local_2.id);
            _local_4 = _local_9.getInterfacesForModel(_local_2.id);
            if(_local_4 != null)
            {
               _local_5 = new Vector.<String>();
               for each(_local_6 in _local_4)
               {
                  _local_7 = getQualifiedClassName(_local_6);
                  _local_8 = _local_7.indexOf("::");
                  if(_local_8 > -1)
                  {
                     _local_7 = _local_7.substr(_local_8 + 2);
                  }
                  _local_5.push(_local_7);
               }
               _arg_1.addText("  interfaces: " + _local_5.join(", "));
            }
            else
            {
               _arg_1.addText("  no interfaces found");
            }
         }
      }
      
      private function cmdResourcesList(_arg_1:FormattedOutput) : void
      {
         var _local_2:Resource = null;
         var _local_4:int = 0;
         var _local_3:Vector.<Resource> = resourceRegistry.resources;
         while(_local_4 < _local_3.length)
         {
            _local_2 = _local_3[_local_4];
            _arg_1.addText(_local_2.toString());
            _local_4++;
         }
      }
      
      private function cmdObjectsList(_arg_1:FormattedOutput) : void
      {
         var _local_2:ISpace = null;
         var _local_3:Vector.<IGameObject> = null;
         var _local_4:IGameObject = null;
         var _local_5:IGameClass = null;
         var _local_6:Vector.<Long> = null;
         var _local_7:int = 0;
         var _local_9:int = 0;
         var _local_8:Vector.<ISpace> = spaceRegistry.spaces;
         while(_local_9 < _local_8.length)
         {
            _local_2 = _local_8[_local_9];
            _arg_1.addText("space id: " + _local_2.id);
            _local_3 = _local_2.objects;
            for each(_local_4 in _local_3)
            {
               _arg_1.addText("  object id: " + _local_4.id);
               _local_5 = _local_4.gameClass;
               if(_local_5 != null)
               {
                  _arg_1.addText("    class id: " + _local_5.id);
                  _local_6 = _local_4.gameClass.models;
                  if(_local_6.length > 0)
                  {
                     _arg_1.addText("    models:");
                     _local_7 = 0;
                     while(_local_7 < _local_6.length)
                     {
                        _arg_1.addText("      " + this.getClassName(modelRegister.getModel(_local_6[_local_7])) + " [" + _local_6[_local_7] + "]");
                        _local_7++;
                     }
                  }
               }
               else
               {
                  _arg_1.addText("    class id: null");
               }
            }
            _local_9++;
         }
      }
      
      private function getClassName(_arg_1:Object) : String
      {
         var _local_2:String = getQualifiedClassName(_arg_1);
         var _local_3:int = _local_2.indexOf("::");
         if(_local_3 > -1)
         {
            return _local_2.substr(_local_3 + 2);
         }
         return _local_2;
      }
   }
}

