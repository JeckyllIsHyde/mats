<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1488313114933" MAX_WIDTH="300" MIN_WIDTH="300"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p style="text-align: center">
      Good Posture, Good Balance: Comparison of Bioinspired and Model-Based Approaches for Posture Control of Humanoid Robots
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
<hook NAME="AutomaticEdgeColor" COUNTER="2"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p style="margin-left: 24pt; text-indent: -24.0pt">
      \cite{Ott2016}
    </p>
    <p style="margin-left: 24pt; text-indent: -24.0pt">
      
    </p>
    <p style="margin-left: 24pt; text-indent: -24.0pt">
      Ott, C., Henze, B., Hettich, G., Seyde, T. N., Roa, M. A., Lippi, V., &amp; Mergner, T. (2016). Good Posture, Good Balance: Comparison of Bioinspired and Model-Based Approaches for Posture Control of Humanoid Robots. <i>IEEE Robotics &amp; Automation Magazine</i>, <i>23</i>(1), 22&#8211;33. https://doi.org/10.1109/MRA.2015.2507098
    </p>
  </body>
</html>
</richcontent>
<node TEXT="abstract" POSITION="right" ID="ID_204434943" CREATED="1488313169702" MODIFIED="1488313173828">
<edge COLOR="#ff0000"/>
<node TEXT="experimental comparisons of posture balance of" ID="ID_1609301364" CREATED="1488313173844" MODIFIED="1488313198770">
<node TEXT="1. model-based" ID="ID_427664430" CREATED="1488313198779" MODIFIED="1488313353286">
<node TEXT="good for" ID="ID_528427052" CREATED="1488313245298" MODIFIED="1488391113440">
<node TEXT="3D" ID="ID_920648551" CREATED="1488313247533" MODIFIED="1488313251043"/>
<node TEXT="multi-contact" ID="ID_1146804648" CREATED="1488313251572" MODIFIED="1488313258051"/>
</node>
</node>
<node TEXT="2. bioinspired" ID="ID_1279705951" CREATED="1488313205864" MODIFIED="1488313356784">
<node TEXT="good for" ID="ID_1660306794" CREATED="1488313276721" MODIFIED="1488391107725">
<node TEXT="only 2D" ID="ID_563930722" CREATED="1488313280426" MODIFIED="1488313284925"/>
<node TEXT="robust under time-delays in the feedback loop" ID="ID_1046756965" CREATED="1488313285442" MODIFIED="1488313310057"/>
</node>
</node>
<node TEXT="on robot TORO [6-9]" ID="ID_1546785604" CREATED="1488313358682" MODIFIED="1488314145064"/>
</node>
</node>
<node TEXT="A neurorobotics approach" POSITION="right" ID="ID_1933551277" CREATED="1488313396141" MODIFIED="1488313406232">
<edge COLOR="#0000ff"/>
<node TEXT="motivation:" ID="ID_1048129380" CREATED="1488313582474" MODIFIED="1488314285425">
<node TEXT="balance from humanoid control" ID="ID_83363474" CREATED="1488314292202" MODIFIED="1488314314064">
<node TEXT="as" ID="ID_4441371" CREATED="1488313684925" MODIFIED="1488313690844">
<node TEXT="a template model" ID="ID_690222993" CREATED="1488313593882" MODIFIED="1488313602640"/>
<node TEXT="complex multibody models" ID="ID_1879620985" CREATED="1488313603038" MODIFIED="1488313637920"/>
</node>
<node TEXT="used" ID="ID_1309231865" CREATED="1488313697620" MODIFIED="1488313700673">
<node TEXT="ZMP [1]" ID="ID_111080965" CREATED="1488313700685" MODIFIED="1488314175382">
<node TEXT="applied to external disturbances [2-5]" ID="ID_1956685206" CREATED="1488314190550" MODIFIED="1488314209798"/>
</node>
<node TEXT="floating base multibody dynamics and GRF" ID="ID_961436562" CREATED="1488313829675" MODIFIED="1488314248470">
<node TEXT="passivity based balancing [10-12]" ID="ID_664636237" CREATED="1488313860506" MODIFIED="1488314131290"/>
<node TEXT="inverse dynamic control [13-14]" ID="ID_1515225594" CREATED="1488314045334" MODIFIED="1488314100427"/>
</node>
</node>
</node>
<node TEXT="balance from neurocience" ID="ID_196000212" CREATED="1488314287689" MODIFIED="1488314322902">
<node TEXT="describe neural mechanisms underlying human balance" ID="ID_1929143477" CREATED="1488314333037" MODIFIED="1488314363357">
<node TEXT="as a property of the human sensorimotor system" ID="ID_920829560" CREATED="1488314380644" MODIFIED="1488314404930"/>
</node>
<node TEXT="aspects" ID="ID_1184162149" CREATED="1488314441412" MODIFIED="1488314449094">
<node TEXT="1. feedback loops with different time-delays" ID="ID_832621831" CREATED="1488314449107" MODIFIED="1488314501453">
<node TEXT="PL: passive loop joint torques with time delays" ID="ID_1703675755" CREATED="1488314582440" MODIFIED="1488314799673" MAX_WIDTH="300"/>
<node TEXT="SL: short latencies primitives from spinal cord and brainstem (80ms)" ID="ID_243862056" CREATED="1488314612178" MODIFIED="1488314799681" MAX_WIDTH="300"/>
<node TEXT="LL: long latencies context-dependent reactions from basal ganglia and cerebral cortex (300ms)" ID="ID_765151194" CREATED="1488314708943" MODIFIED="1488314799690" MAX_WIDTH="300"/>
</node>
<node TEXT="2. several sensory systems" ID="ID_1718252380" CREATED="1488317432988" MODIFIED="1488317449903">
<node TEXT="as" ID="ID_503572830" CREATED="1488317620155" MODIFIED="1488317621785">
<node TEXT="vestibular" ID="ID_1055129034" CREATED="1488317486859" MODIFIED="1488317491177"/>
<node TEXT="propiocepcion" ID="ID_771354727" CREATED="1488317491658" MODIFIED="1488317538624"/>
<node TEXT="vision" ID="ID_1986576522" CREATED="1488317539020" MODIFIED="1488317551319"/>
</node>
<node TEXT="dynamically modify contribution for each sensory system to account for changes in the environment scenarios and sensory availability" ID="ID_1491417396" CREATED="1488317707232" MODIFIED="1488317821772" MAX_WIDTH="300"/>
</node>
<node TEXT="3" OBJECT="java.lang.Long|3" ID="ID_39292479" CREATED="1488317554132" MODIFIED="1488329675112"/>
</node>
</node>
</node>
</node>
</node>
</map>
