<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="IRL" ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1481829039399"><hook NAME="MapStyle">
    <properties show_icon_for_attributes="true" show_note_icons="true"/>

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
<hook NAME="AutomaticEdgeColor" COUNTER="1"/>
<node TEXT="IOC with Locally Optimal Examples" POSITION="right" ID="ID_1658301643" CREATED="1481829042705" MODIFIED="1481829963288">
<edge COLOR="#ff0000"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Levine2012}
    </p>
  </body>
</html>

</richcontent>
<node TEXT="Previous challenges" ID="ID_1437141092" CREATED="1481834422055" MODIFIED="1481834431284">
<node TEXT="Convergence without optimal examples" ID="ID_223757359" CREATED="1481834433464" MODIFIED="1481834455644"/>
</node>
<node TEXT="Local appx. reward func." ID="ID_1739369467" CREATED="1481829174471" MODIFIED="1481829518026">
<node TEXT="For deterministic MDPs" ID="ID_408584022" CREATED="1481829982737" MODIFIED="1481829992679"/>
<node TEXT="Expert demo isn&apos;t to be optimal" ID="ID_1394935567" CREATED="1481830077991" MODIFIED="1481830113237"/>
<node TEXT="Appx. likelihood of expert trajs" ID="ID_1029430698" CREATED="1481830184164" MODIFIED="1481830304059"/>
<node TEXT="Reward shape" ID="ID_909637904" CREATED="1481830311137" MODIFIED="1481830333258">
<node TEXT="linear comb. of features" ID="ID_1830880782" CREATED="1481830333281" MODIFIED="1481830345746"/>
<node TEXT="non-linear comb. of features" ID="ID_942701735" CREATED="1481830346260" MODIFIED="1481830356543">
<node TEXT="Gaussian process GP" ID="ID_460654161" CREATED="1481843167292" MODIFIED="1481844927809"/>
</node>
</node>
<node TEXT="IRL MaxEnt" ID="ID_1754879417" CREATED="1481835431119" MODIFIED="1481835440036">
<node TEXT="$P(\mathbf{u}|\mathbf{x}_0)=\frac{1}{Z}\exp{\sum_t{r(\mathbf{x}_t,\mathbf{u}_t)}}$" ID="ID_1356895515" CREATED="1481835457796" MODIFIED="1481837149583" FORMAT="latexPatternFormat">
<node TEXT="Z is Intractable for High-dim" ID="ID_1457709785" CREATED="1481837165867" MODIFIED="1481837221694"/>
</node>
</node>
</node>
<node TEXT="Extending from" ID="ID_1433433937" CREATED="1481833536956" MODIFIED="1481833857150">
<node TEXT="Simplest IOC" ID="ID_1202513903" CREATED="1481833858305" MODIFIED="1481833860876">
<node TEXT="Linear systems" ID="ID_264567932" CREATED="1481833547528" MODIFIED="1481833555695"/>
<node TEXT="Quadratic reward" ID="ID_1866514796" CREATED="1481833556094" MODIFIED="1481833565408"/>
</node>
<node TEXT="Adding info from a non-linear reward by" ID="ID_93056940" CREATED="1481833866844" MODIFIED="1481833926647">
<node TEXT="Hessian" ID="ID_741049470" CREATED="1481833886481" MODIFIED="1481833893077"/>
<node TEXT="Gradient" ID="ID_1559860923" CREATED="1481833893634" MODIFIED="1481833901099"/>
</node>
<node TEXT="Without linear dynamics" ID="ID_1222890101" CREATED="1481833975006" MODIFIED="1481833987177"/>
</node>
<node TEXT="Why reward func?" ID="ID_516347985" CREATED="1481829519244" MODIFIED="1481829532902">
<node TEXT="Apprenticeship learning" ID="ID_1825578975" CREATED="1481829532925" MODIFIED="1481829563276"/>
<node TEXT="Genearlize expert&apos;s behavior to new situations" ID="ID_587138680" CREATED="1481829563658" MODIFIED="1481829623042"/>
<node TEXT="Infer the expert&apos;s goals" ID="ID_1363250673" CREATED="1481829623440" MODIFIED="1481829686026"/>
</node>
<node TEXT="Posterior challenges" ID="ID_380592838" CREATED="1481834724168" MODIFIED="1481834730192">
<node TEXT="Features with discontinuities" ID="ID_1154757890" CREATED="1481834505754" MODIFIED="1481834721794"/>
<node TEXT="Reward structures for high-dim without" ID="ID_399148469" CREATED="1481834766786" MODIFIED="1481834878238">
<node TEXT="detailed features" ID="ID_501760643" CREATED="1481834787759" MODIFIED="1481834795324"/>
<node TEXT="numerous examples" ID="ID_840337609" CREATED="1481834795807" MODIFIED="1481834800680"/>
</node>
<node TEXT="Design rewards" ID="ID_323677383" CREATED="1481834895022" MODIFIED="1481834912720">
<node TEXT="meaningful features" ID="ID_926208354" CREATED="1481834912739" MODIFIED="1481834944894"/>
<node TEXT="generalizable featues" ID="ID_801153117" CREATED="1481834926452" MODIFIED="1481834937081"/>
</node>
</node>
</node>
</node>
</map>
