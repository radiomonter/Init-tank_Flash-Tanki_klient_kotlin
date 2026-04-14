package alternativa.tanks.services.tankregistry
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Cosocyton implements TankUsersRegistry
   {
      
      private const users:Dictionary = new Dictionary();
      
      private var digic:Vector.<ClientObject>;
      
      private var buvubedop:int;
      
      private var fyz:ClientObject;
      
      public function Cosocyton()
      {
         super();
      }
      
      public function addUser(_arg_1:ClientObject) : void
      {
         this.digic = null;
         if(!this.users[_arg_1.id])
         {
            this.users[_arg_1.id] = _arg_1;
            ++this.buvubedop;
         }
         if(IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService)).userName == _arg_1.id)
         {
            this.fyz = _arg_1;
         }
      }
      
      public function removeUser(_arg_1:ClientObject) : void
      {
         this.digic = null;
         if(Boolean(this.users[_arg_1.id]))
         {
            delete this.users[_arg_1.id];
            --this.buvubedop;
         }
         if(IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService)).userName == _arg_1.id)
         {
            this.fyz = null;
         }
      }
      
      public function latokurif() : int
      {
         return this.buvubedop;
      }
      
      public function wakosibi() : Vector.<ClientObject>
      {
         var _local_1:ClientObject = null;
         if(this.digic == null)
         {
            this.digic = new Vector.<ClientObject>();
            for each(_local_1 in this.users)
            {
               this.digic.push(_local_1);
            }
         }
         return this.digic;
      }
      
      public function bebosaca(_arg_1:String) : ClientObject
      {
         return this.users[_arg_1];
      }
      
      public function wyqewu() : ClientObject
      {
         return this.fyz;
      }
      
      public function gosela() : Boolean
      {
         return this.fyz != null;
      }
   }
}

