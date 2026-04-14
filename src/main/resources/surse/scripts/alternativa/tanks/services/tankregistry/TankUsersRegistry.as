package alternativa.tanks.services.tankregistry
{
   import alternativa.object.ClientObject;
   
   public interface TankUsersRegistry
   {
      
      function addUser(param1:ClientObject) : void;
      
      function removeUser(param1:ClientObject) : void;
      
      function latokurif() : int;
      
      function wakosibi() : Vector.<ClientObject>;
      
      function bebosaca(param1:String) : ClientObject;
      
      function wyqewu() : ClientObject;
      
      function gosela() : Boolean;
   }
}

