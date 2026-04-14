package projects.tanks.client.clans.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.types.Long;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         var _local_4:ICodec = null;
         osgi = _arg_1;
         var _local_2:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         _local_2.register(Long.getLong(202978443,152865914),Long.getLong(1980347621,1611632721));
         _local_2.register(Long.getLong(202978443,152865914),Long.getLong(1261234115,476186094));
         _local_2.register(Long.getLong(1575927935,-367368112),Long.getLong(946943636,-1512579195));
         _local_2.register(Long.getLong(1575927935,-367368112),Long.getLong(709518332,1700494084));
         _local_2.register(Long.getLong(525873271,1744909560),Long.getLong(123212251,-1982333947));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(224690586,33129736));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(661618191,747527866));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(255752141,-162666891));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(1686179352,1619108917));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(2117528051,-1228799124));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(899591349,1207281551));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(255677344,1199269997));
         _local_2.register(Long.getLong(1406824912,-478599334),Long.getLong(180626480,535638748));
         _local_2.register(Long.getLong(1889621503,1893984398),Long.getLong(2135860306,-1585042188));
         _local_2.register(Long.getLong(1889621503,1893984398),Long.getLong(526095397,633372847));
         _local_2.register(Long.getLong(1889621503,1893984398),Long.getLong(489547868,-896284526));
         _local_2.register(Long.getLong(794660588,-483099162),Long.getLong(492813833,1824512689));
         _local_2.register(Long.getLong(794660588,-483099162),Long.getLong(1902640351,1514469490));
         _local_2.register(Long.getLong(1448266566,-1893699662),Long.getLong(47370739,-335983741));
         _local_2.register(Long.getLong(1448266566,-1893699662),Long.getLong(1468492941,414226622));
         _local_2.register(Long.getLong(1647741962,-1293471250),Long.getLong(264735719,2108782023));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(1925555464,-742779729));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(680200609,-1147294464));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(1659309065,-71192762));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(1659309105,-102307188));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(1767156062,-1193480447));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(615510449,-291351864));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(1820972193,-1147714599));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(1902588706,-1770274302));
         _local_2.register(Long.getLong(454139398,-2069165154),Long.getLong(1149292226,-49512386));
         _local_2.register(Long.getLong(1850785827,-2022019480),Long.getLong(2052398186,-511753871));
         _local_2.register(Long.getLong(1408324582,-1932105818),Long.getLong(340356364,-824818575));
         _local_2.register(Long.getLong(1408324582,-1932105818),Long.getLong(1961112713,-2039360050));
         _local_2.register(Long.getLong(606942677,1590617894),Long.getLong(1587343137,-1916924187));
         _local_2.register(Long.getLong(606942677,1590617894),Long.getLong(723365112,-1678221051));
         _local_2.register(Long.getLong(606942677,1590617894),Long.getLong(1322847239,424158635));
         _local_2.register(Long.getLong(1602467880,168781542),Long.getLong(871743923,-1602562917));
         _local_2.register(Long.getLong(471234096,-1683897946),Long.getLong(1264515209,-1616011663));
         _local_2.register(Long.getLong(471234096,-1683897946),Long.getLong(545265830,-796542002));
         _local_2.register(Long.getLong(1233534043,-1972982554),Long.getLong(1928764250,-1868285925));
         _local_2.register(Long.getLong(1233534043,-1972982554),Long.getLong(337850372,-157499174));
         _local_2.register(Long.getLong(1120804751,-1974844538),Long.getLong(591561906,1809211473));
         _local_2.register(Long.getLong(1120804751,-1974844538),Long.getLong(1158549911,-1988807186));
         _local_2.register(Long.getLong(151267905,-1393229156),Long.getLong(1638331388,1514392729));
         _local_2.register(Long.getLong(151267905,-1393229156),Long.getLong(751334509,-1941322344));
         _local_2.register(Long.getLong(1420566941,-260091189),Long.getLong(511635594,2072865495));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(57363867,1237781863));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(618126442,-725356522));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(1671975780,-1329402274));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(57363920,-817863194));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(57363960,-848977620));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(325235064,-2121980921));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(1693514433,32146500));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(944293305,-1852342578));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(1492352330,720837769));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(1273341198,-1482111631));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(193176875,2068732989));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(193176886,893937818));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(1136230800,538530230));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(2062667168,-2002974215));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(1570177194,1280257195));
         _local_2.register(Long.getLong(259670316,1522052296),Long.getLong(321756128,1414681448));
         _local_2.register(Long.getLong(205268203,-139952058),Long.getLong(230800152,-1398596335));
         _local_2.register(Long.getLong(205268203,-139952058),Long.getLong(1435129862,-1648365870));
         _local_2.register(Long.getLong(1029456312,194126704),Long.getLong(2072556979,560987130));
         _local_2.register(Long.getLong(1029456312,194126704),Long.getLong(1821924666,143246274));
         _local_2.register(Long.getLong(1029456312,194126704),Long.getLong(1269926118,-537285713));
         _local_2.register(Long.getLong(1029456312,194126704),Long.getLong(2037318745,22259876));
         _local_2.register(Long.getLong(1029456312,194126704),Long.getLong(1203575776,253980200));
         _local_2.register(Long.getLong(1029456312,194126704),Long.getLong(763277444,804297489));
         _local_2.register(Long.getLong(1978103354,1644120870),Long.getLong(742414901,491655143));
         _local_2.register(Long.getLong(1978103354,1644120870),Long.getLong(521749674,-1882127080));
         var _local_3:IProtocol = IProtocol(osgi.getService(IProtocol));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

