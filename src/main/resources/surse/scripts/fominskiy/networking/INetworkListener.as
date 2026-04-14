package fominskiy.networking
{
   import fominskiy.networking.commands.Command;
   
   public interface INetworkListener
   {
      
      function onData(param1:Command) : void;
   }
}

