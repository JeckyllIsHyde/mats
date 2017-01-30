<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1485730609514"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p style="text-align: center">
      Policy search
    </p>
    <p style="text-align: center">
      for motor primitives
    </p>
    <p style="text-align: center">
      in robotics
    </p>
  </body>
</html>
</richcontent>
<hook NAME="MapStyle">
    <properties show_note_icons="true"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node">
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right">
<stylenode LOCALIZED_TEXT="default" MAX_WIDTH="600" COLOR="#000000" STYLE="as_parent">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.note"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="5"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Kober2011}
    </p>
    <p style="margin-left: 24pt; text-indent: -24.0pt">
      
    </p>
    <p style="margin-left: 24pt; text-indent: -24.0pt">
      Kober, J. &amp; Peters, J., 2011. Policy search for motor primitives in robotics. <i>Machine Learning</i>, 84(1&#8211;2), pp.171&#8211;203.
    </p>
  </body>
</html>
</richcontent>
<node TEXT="justification and motivation" POSITION="right" ID="ID_286375880" CREATED="1485733709265" MODIFIED="1485734079115">
<edge COLOR="#00ff00"/>
<node TEXT="motor skills through parametrized motor primitives" ID="ID_1855356693" CREATED="1485730619582" MODIFIED="1485789340684">
<node TEXT="as DMPs" ID="ID_106464069" CREATED="1485734344123" MODIFIED="1485734348906"/>
</node>
<node TEXT="limitation of imitation learning" ID="ID_989554664" CREATED="1485734060565" MODIFIED="1485734064622">
<node TEXT="by demos from a teacher, insufficient task knowledge, is transfer" ID="ID_410221763" CREATED="1485733730300" MODIFIED="1485734250958"/>
</node>
<node TEXT="reinforcement learning is an alternative for demos" ID="ID_151304353" CREATED="1485734014198" MODIFIED="1485734123824">
<node TEXT="challenges to include in imitation learning are" ID="ID_1467906625" CREATED="1485734140496" MODIFIED="1485734298891">
<node TEXT="task-appropiate policy representation" ID="ID_547013767" CREATED="1485734157339" MODIFIED="1485734166486"/>
<node TEXT="encoding prior knowledge" ID="ID_60255778" CREATED="1485734171644" MODIFIED="1485734182848"/>
</node>
<node TEXT="using policy search, we can get" ID="ID_1559292740" CREATED="1485734390992" MODIFIED="1485734408234">
<node TEXT="domain-appropiate pre-structured policies" ID="ID_1726895424" CREATED="1485734408236" MODIFIED="1485734433439"/>
<node TEXT="straightforward integration of  a teacher&apos;s presentation" ID="ID_1315277249" CREATED="1485734433928" MODIFIED="1485734490507"/>
<node TEXT="fast online learning" ID="ID_1253035622" CREATED="1485734501115" MODIFIED="1485734506766"/>
<node TEXT="policy search over value-function methods" ID="ID_306222629" CREATED="1485734548015" MODIFIED="1485734565557"/>
</node>
</node>
</node>
<node TEXT="objective" POSITION="right" ID="ID_809349470" CREATED="1485789423678" MODIFIED="1485789428070">
<edge COLOR="#00ffff"/>
<node TEXT="apply RL to high-dimentional motor control tasks in robotics" ID="ID_1103182166" CREATED="1485789428074" MODIFIED="1485789460491"/>
</node>
<node TEXT="methodology suit for robotics" POSITION="right" ID="ID_1206376282" CREATED="1485734643390" MODIFIED="1485734666960">
<edge COLOR="#ff00ff"/>
<node TEXT="General idea" ID="ID_683955019" CREATED="1485789517233" MODIFIED="1485789523946">
<node TEXT="1. initialize by imitation" ID="ID_274162673" CREATED="1485734649690" MODIFIED="1485734688495">
<node TEXT="needs a policy representation as" ID="ID_1176810220" CREATED="1485734837870" MODIFIED="1485735039372">
<node TEXT="DMP" ID="ID_200854798" CREATED="1485735040907" MODIFIED="1485735043481">
<node TEXT="linear in parameters" ID="ID_1854599504" CREATED="1485735043483" MODIFIED="1485735052477"/>
<node TEXT="easy for demonstration" ID="ID_1800709134" CREATED="1485735067193" MODIFIED="1485735082769"/>
<node TEXT="point-to point and rhythmic behaviors" ID="ID_1050509469" CREATED="1485735094537" MODIFIED="1485735121127"/>
<node TEXT="episodic behaviors" ID="ID_487405374" CREATED="1485735153551" MODIFIED="1485735159637"/>
</node>
</node>
</node>
<node TEXT="2. policy search for self-improvement" ID="ID_1828707312" CREATED="1485734667291" MODIFIED="1485734729407"/>
</node>
<node TEXT="RL problem" ID="ID_1050121545" CREATED="1485789532061" MODIFIED="1485789550254">
<node TEXT="General setting" ID="ID_421409848" CREATED="1485789581698" MODIFIED="1485789620357"/>
<node TEXT="episodic RL approach" ID="ID_1374197164" CREATED="1485789593146" MODIFIED="1485789641966"/>
</node>
</node>
<node TEXT="common framework using DMPs for" POSITION="right" ID="ID_943785856" CREATED="1485733321146" MODIFIED="1485733578206">
<edge COLOR="#0000ff"/>
<node TEXT="policy gradient methods" ID="ID_891223027" CREATED="1485733338046" MODIFIED="1485733359111">
<node TEXT="eREINFORCE" ID="ID_1107408930" CREATED="1485733450599" MODIFIED="1485733456352"/>
<node TEXT="Vanilla Policy Gradients with optimal baselines" ID="ID_1473273138" CREATED="1485733457164" MODIFIED="1485733491571">
<node TEXT="policy gradient theorem" ID="ID_280758142" CREATED="1485733920853" MODIFIED="1485733931500"/>
</node>
<node TEXT="eNAC" ID="ID_986393349" CREATED="1485733492105" MODIFIED="1485733500701"/>
</node>
<node TEXT="expectation-maximization inspired methods" ID="ID_646063351" CREATED="1485733359554" MODIFIED="1485733383449">
<node TEXT="eRWR" ID="ID_1340979897" CREATED="1485733507537" MODIFIED="1485733510372"/>
<node TEXT="PoWER" ID="ID_1849028244" CREATED="1485733510839" MODIFIED="1485733569398"/>
</node>
</node>
</node>
</map>
