package projects.tanks.clients.flash.resources.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.types.Long;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.flash.resources.resource.PropLibResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Activator implements IBundleActivator
   {
      
      public var resourceRegistry:ResourceRegistry;
      
      public function Activator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         this.resourceRegistry = ResourceRegistry(_arg_1.getService(ResourceRegistry));
         this.resourceRegistry.registerTypeClasses(MapResource.TYPE,MapResource);
         this.resourceRegistry.registerTypeClasses(PropLibResource.TYPE,PropLibResource);
         this.resourceRegistry.registerTypeClasses(Tanks3DSResource.TYPE,Tanks3DSResource);
      }
      
      public function stop(_arg_1:OSGi) : void
      {
         this.resourceRegistry.unregisterResource(Long(PropLibResource.TYPE));
         this.resourceRegistry.unregisterResource(Long(MapResource.TYPE));
      }
   }
}

