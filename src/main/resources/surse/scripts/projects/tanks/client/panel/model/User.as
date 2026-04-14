package projects.tanks.client.panel.model
{
   public class User
   {
      
      public var place:int = 0;
      
      public var callsign:String;
      
      public var achiviments:String;
      
      public var kills:int = 0;
      
      public var deaths:int = 0;
      
      public var ratio:int = 0;
      
      public var rank:int = 0;
      
      public var score:int = 0;
      
      public var wealth:int = 0;
      
      public var rating:Number = 0;
      
      public function User(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int)
      {
         super();
         this.place = _arg_5;
         this.callsign = _arg_1;
         this.achiviments = _arg_2;
         this.kills = _arg_6;
         this.deaths = _arg_7;
         this.ratio = _arg_8;
         this.rank = _arg_4;
         this.score = _arg_3;
         this.wealth = _arg_9;
         this.rating = _arg_10;
      }
   }
}

