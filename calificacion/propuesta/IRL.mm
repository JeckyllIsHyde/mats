<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="IRL" ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1481973829628"><hook NAME="MapStyle">
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
<hook NAME="AutomaticEdgeColor" COUNTER="3"/>
<node TEXT="Feature Construction for IRL" POSITION="right" ID="ID_493211443" CREATED="1481908784279" MODIFIED="1481908813409">
<edge COLOR="#0000ff"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Levine2010}
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Previous challenges" ID="ID_1503999917" CREATED="1481908817484" MODIFIED="1481908886576">
<node TEXT="user need to supply a basis of feature fucns for rewards" ID="ID_1961761087" CREATED="1481908886588" MODIFIED="1481908960460"/>
<node TEXT="pre-structuerd reward" ID="ID_223459136" CREATED="1481909483741" MODIFIED="1481909496233"/>
</node>
<node TEXT="Construct reward featues from" ID="ID_1218622746" CREATED="1481908990839" MODIFIED="1481909018268">
<node TEXT="easier to specify component feat. than feat.basis" ID="ID_722225695" CREATED="1481909602630" MODIFIED="1481909663607" MAX_WIDTH="300"/>
<node TEXT="large set of component features" ID="ID_1439534909" CREATED="1481909018769" MODIFIED="1481909083698"/>
<node TEXT="building logical conjunctions of component features" ID="ID_607239300" CREATED="1481909018278" MODIFIED="1481909138823">
<node TEXT="relevant to example policy" ID="ID_460823169" CREATED="1481909138838" MODIFIED="1481909157619"/>
</node>
</node>
<node TEXT="FIRL Algorithm return" ID="ID_167649634" CREATED="1481909196650" MODIFIED="1481909825442">
<node TEXT="Reward function" ID="ID_1436586784" CREATED="1481909203347" MODIFIED="1481909209107"/>
<node TEXT="Constructed features" ID="ID_1466652742" CREATED="1481909210085" MODIFIED="1481909224198">
<node TEXT="as logical conjuntions of components" ID="ID_1676425274" CREATED="1481909839769" MODIFIED="1481909861487"/>
<node TEXT="by capturing their logical relationships" ID="ID_1458904829" CREATED="1481909875255" MODIFIED="1481909895206"/>
<node TEXT="represented as a tree regression" ID="ID_1609365976" CREATED="1481916054245" MODIFIED="1481916064516"/>
</node>
<node TEXT="Tranfere reward on new environments with well defined component of features" ID="ID_49289065" CREATED="1481909288214" MODIFIED="1481909327187" MAX_WIDTH="300"/>
<node TEXT="Recover a stationary deterministic policy" ID="ID_1906978319" CREATED="1481909940089" MODIFIED="1481909971556"/>
</node>
<node TEXT="Results" ID="ID_187185619" CREATED="1481910001801" MODIFIED="1481910006737">
<node TEXT="" ID="ID_1130342890" CREATED="1481910006749" MODIFIED="1481910006749"/>
</node>
</node>
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
<node TEXT="IRL MaxEnt" ID="ID_1754879417" CREATED="1481835431119" MODIFIED="1481896499137"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Ziebart2008}
    </p>
  </body>
</html>
</richcontent>
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
<node TEXT="Solving IRL MaxEnt using Laplace approx. of reward log likelihood with" ID="ID_1615793284" CREATED="1481898396087" MODIFIED="1481898696064" MAX_WIDTH="300">
<node TEXT="quadratic rewards" ID="ID_789665851" CREATED="1481898565767" MODIFIED="1481898595987"/>
<node TEXT="locally linearized dynamics" ID="ID_1789791479" CREATED="1481898544611" MODIFIED="1481898565218"/>
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
<node TEXT="IOC for humanoid locomotion" ID="ID_1350785897" CREATED="1481896332091" MODIFIED="1481896378616"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Park2013a}
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Prev. Challanges" ID="ID_947951039" CREATED="1481897497431" MODIFIED="1481897507197">
<node TEXT="Genaralize for new situations" ID="ID_1482160577" CREATED="1481897508773" MODIFIED="1481897522118"/>
<node TEXT="Avoid hand-crafted control laws" ID="ID_1941607984" CREATED="1481897550174" MODIFIED="1481897564882"/>
<node TEXT="Using Cost functions" ID="ID_1197539595" CREATED="1481897606208" MODIFIED="1481897619234"/>
</node>
<node TEXT="From" ID="ID_1277230231" CREATED="1481896778420" MODIFIED="1481896784341">
<node TEXT="motion-captured running as demo" ID="ID_103862373" CREATED="1481896784344" MODIFIED="1481896838004"/>
<node TEXT="Contact-discontinuities" ID="ID_15779093" CREATED="1481907784968" MODIFIED="1481907811038">
<node TEXT="Softed contact model" ID="ID_306172264" CREATED="1481907833199" MODIFIED="1481907863583"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Tassa2012}
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="MuJoCo" ID="ID_1282036318" CREATED="1481907871372" MODIFIED="1481907880128"/>
</node>
</node>
<node TEXT="Cost Features" ID="ID_186167397" CREATED="1481906350909" MODIFIED="1481907329838">
<node TEXT="Torque minization" ID="ID_1839009534" CREATED="1481906364976" MODIFIED="1481906373287"/>
<node TEXT="Root position and velocity" ID="ID_169257213" CREATED="1481906373638" MODIFIED="1481906385372"/>
<node TEXT="Joint Angle regularization" ID="ID_244807541" CREATED="1481906391375" MODIFIED="1481906419727"/>
<node TEXT="Periodic foot motion" ID="ID_1402991030" CREATED="1481906428837" MODIFIED="1481906436657"/>
<node TEXT="Arm swing" ID="ID_915014344" CREATED="1481906437268" MODIFIED="1481906447984"/>
</node>
<node TEXT="Results" ID="ID_1830473932" CREATED="1481897984713" MODIFIED="1481898009296">
<node TEXT="get reward func able to" ID="ID_1650729455" CREATED="1481898009298" MODIFIED="1481898226872">
<node TEXT="repro. smooth, realistic and highly dyns running" ID="ID_1755334637" CREATED="1481898034096" MODIFIED="1481898060894"/>
<node TEXT="generalizable representation to" ID="ID_1196892435" CREATED="1481898061519" MODIFIED="1481898087928">
<node TEXT="perturbations" ID="ID_185821813" CREATED="1481898087930" MODIFIED="1481898095711"/>
<node TEXT="changes in terrain" ID="ID_1112679746" CREATED="1481898096136" MODIFIED="1481898104028"/>
</node>
<node TEXT="avoid local poor optima present in hand-crafted" ID="ID_49970279" CREATED="1481898228977" MODIFIED="1481898251303"/>
</node>
</node>
<node TEXT="Posterior challenges" ID="ID_321601130" CREATED="1481907204601" MODIFIED="1481907237615">
<node TEXT="Online scheme with MPC" ID="ID_1118371113" CREATED="1481907237643" MODIFIED="1481907267476"/>
<node TEXT="Explore other human behaviors" ID="ID_1195234611" CREATED="1481907529397" MODIFIED="1481907545919"/>
<node TEXT="Feature-based Non linear reward funcs to avoid set of pre-engineered set of features" ID="ID_1406775508" CREATED="1481907575359" MODIFIED="1481907660286" MAX_WIDTH="300"/>
</node>
</node>
</node>
<node TEXT="Bibliography" LOCALIZED_STYLE_REF="defaultstyle.floating" POSITION="left" ID="ID_505753630" CREATED="1481973652286" MODIFIED="1481974022631" HGAP="150" VSHIFT="10">
<edge COLOR="#0603d9"/>
<cloud COLOR="#c0c1fd" SHAPE="ARC"/>
<node TEXT="Ng, A., &amp; Russell, S. (2000). Algorithms for inverse reinforcement learning. pp. 663&#x2013;670" ID="ID_1491779898" CREATED="1481948787394" MODIFIED="1481974490210" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
<node TEXT="Def IRL as" ID="ID_167583306" CREATED="1481974132077" MODIFIED="1481974549951" MAX_WIDTH="400">
<node TEXT="Extracting reward func. given observed optimal behavior" ID="ID_244443955" CREATED="1481974552472" MODIFIED="1481974557346"/>
<node TEXT="or a reward fucn. that explain some behavior" ID="ID_164836288" CREATED="1482004725233" MODIFIED="1482004745194"/>
</node>
<node TEXT="IRL useful for" ID="ID_1248082846" CREATED="1481974787602" MODIFIED="1481974796523">
<node TEXT="apprenticeship learning to acquire skilled behavior" ID="ID_98205134" CREATED="1481974799500" MODIFIED="1481974892220"/>
<node TEXT="ascertain reward fucns. from natural systems" ID="ID_1654573104" CREATED="1481974892647" MODIFIED="1481975001244"/>
</node>
<node TEXT="principal issues" ID="ID_1406433688" CREATED="1481975056480" MODIFIED="1481975060962">
<node TEXT="degeneracy: several rewards for the same optim. policy" ID="ID_1829477567" CREATED="1481978799758" MODIFIED="1481978833422"/>
</node>
<node TEXT="for degeneracy" ID="ID_667000438" CREATED="1482005179656" MODIFIED="1482005189303">
<node TEXT="use a simple heuristic resulting in a linear programming solution to IRL problem" ID="ID_1885942879" CREATED="1482005190670" MODIFIED="1482005277479" MAX_WIDTH="400"/>
</node>
<node TEXT="3 algorithms" ID="ID_1120457234" CREATED="1481975062217" MODIFIED="1481975070194">
<node TEXT="1st Alg. known policy tabs reward funcs on finite state space" ID="ID_1691997369" CREATED="1481975098354" MODIFIED="1481978166222" MAX_WIDTH="400">
<node TEXT="linear programming" ID="ID_1685451589" CREATED="1482007044328" MODIFIED="1482007051606"/>
</node>
<node TEXT="2nd Alg. known policy linear apprx. on infinte state space" ID="ID_874271728" CREATED="1481978089365" MODIFIED="1481978233391">
<node TEXT="linear weigthed features" ID="ID_400768987" CREATED="1481979238747" MODIFIED="1481979254719"/>
</node>
<node TEXT="3rd Alg. known policy through a finite set of observed trajs." ID="ID_252501770" CREATED="1481978690989" MODIFIED="1481979087291"/>
</node>
<node TEXT="experiments" ID="ID_409878932" CREATED="1481980075240" MODIFIED="1481980079334">
<node TEXT="5x5 grid with alg. 1" ID="ID_1119207209" CREATED="1481980080552" MODIFIED="1481980160822"/>
<node TEXT="mountain car with alg. 2" ID="ID_1787714096" CREATED="1481980087349" MODIFIED="1481980168616">
<node TEXT="appx. funtr. 26 gaussians evenly spaced" ID="ID_1288868483" CREATED="1481980223001" MODIFIED="1481980250669"/>
</node>
<node TEXT="continous grid [0,1]x[0,1]" ID="ID_466518848" CREATED="1481981240508" MODIFIED="1481981260784">
<node TEXT="apprx functr 15x15 2D-gaussians" ID="ID_418815471" CREATED="1481981341848" MODIFIED="1481981365962"/>
<node TEXT="Monte Carlo trials" ID="ID_715089836" CREATED="1481981376650" MODIFIED="1481981399489"/>
<node TEXT="50x50 discretizated space" ID="ID_1799294889" CREATED="1481981459447" MODIFIED="1481981475288"/>
</node>
</node>
<node TEXT="posterior challenges" ID="ID_767662461" CREATED="1481979153904" MODIFIED="1481979162905">
<node TEXT="design easy IRL algorithms" ID="ID_1490646382" CREATED="1481979333450" MODIFIED="1481979352617"/>
<node TEXT="metrics for fit sensor and action noisy signals" ID="ID_1426308129" CREATED="1481979416771" MODIFIED="1481979444191"/>
<node TEXT="locally optimal in specific regions" ID="ID_441713845" CREATED="1481979445328" MODIFIED="1481979508341"/>
<node TEXT="experiment design" ID="ID_1459417611" CREATED="1481979529936" MODIFIED="1481979535483"/>
<node TEXT="algs. on POMDPs" ID="ID_806862733" CREATED="1481979536321" MODIFIED="1481979567490"/>
<node TEXT="4133149 3118842619" ID="ID_1665021417" CREATED="1482003438458" MODIFIED="1482003441784"/>
</node>
</node>
<node TEXT="Abbeel, P., &amp; Ng, A. Y. (2004). Apprenticeship learning via inverse reinforcement learning. pp. 1&#x2013;8" ID="ID_632187818" CREATED="1482008752124" MODIFIED="1482010553800" MAX_WIDTH="400">
<edge STYLE="sharp_bezier"/>
<node TEXT="Def Apprenticeship" ID="ID_272705136" CREATED="1482010473614" MODIFIED="1482011629495">
<node TEXT="from" ID="ID_11099993" CREATED="1482010702469" MODIFIED="1482011646886">
<node TEXT="directly mimic demo with supervised learning: a = pi(s)" ID="ID_234164223" CREATED="1482011646907" MODIFIED="1482011773913"/>
<node TEXT="reward as quad. deviation penalization from desired traj." ID="ID_1841543562" CREATED="1482011793863" MODIFIED="1482011958962"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Atkeson1997b}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="for" ID="ID_1048547978" CREATED="1482012059282" MODIFIED="1482012061409">
<node TEXT="traj. demo (e.i. robot movements)" ID="ID_902049274" CREATED="1482012064979" MODIFIED="1482012096140"/>
<node TEXT="non-traj. demo tasks (e.i driving a car)" ID="ID_1058362130" CREATED="1482012004004" MODIFIED="1482012032833"/>
</node>
</node>
<node TEXT="motivation from" ID="ID_1709294426" CREATED="1482012892729" MODIFIED="1482012896999">
<node TEXT="biomechanics and cognitive science" ID="ID_983460305" CREATED="1482012901680" MODIFIED="1482012915161">
<node TEXT="simple reward functs. explain complex behavior" ID="ID_318881447" CREATED="1482012917043" MODIFIED="1482012956543"/>
<node TEXT="examples" ID="ID_1780671426" CREATED="1482012957120" MODIFIED="1482012969303">
<node TEXT="minimum jerk for limb primate movements" ID="ID_987412701" CREATED="1482012969319" MODIFIED="1482013001645"/>
<node TEXT="minimum torque-change for human multijoint arm movement" ID="ID_885056587" CREATED="1482013002837" MODIFIED="1482013072875" MAX_WIDTH="400"/>
</node>
</node>
</node>
<node TEXT="algorithm" ID="ID_994800338" CREATED="1482013749382" MODIFIED="1482013753946">
<node TEXT="linear combination of known features" ID="ID_1489010736" CREATED="1482013900152" MODIFIED="1482013913904"/>
<node TEXT="feature expectation of a policy" ID="ID_203389353" CREATED="1482015404927" MODIFIED="1482015419747">
<node TEXT="$\mu_i(\pi)\,=\,E[\sum_k\gamma^k\phi_i(s)|\pi]$" ID="ID_919297978" CREATED="1482015429117" MODIFIED="1482016264474" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="the value of a policy pi is" ID="ID_396433088" CREATED="1482015782508" MODIFIED="1482015794347">
<node TEXT="$E_{s_0\sim D}[V^\pi(s_0)]\,=\,w\cdot\mu(\pi)$" ID="ID_11781670" CREATED="1482015794365" MODIFIED="1482016280819" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="expert&apos;s feature expectation" ID="ID_917987014" CREATED="1482016577039" MODIFIED="1482016587716"/>
<node TEXT="QP-based or SVM solver" ID="ID_333115552" CREATED="1482023885068" MODIFIED="1482023900036"/>
</node>
<node TEXT="results" ID="ID_280735221" CREATED="1482008459971" MODIFIED="1482008464377">
<node TEXT="IRL-based alg. few number of iterations" ID="ID_1797853742" CREATED="1482013803277" MODIFIED="1482013852761"/>
<node TEXT="from an expert &quot;trying&quot; to optimize an unknown reward" ID="ID_58207767" CREATED="1482013414081" MODIFIED="1482013603781">
<node TEXT="expressed as a linear &quot;feature&quot; combination" ID="ID_1427159782" CREATED="1482013474793" MODIFIED="1482013615836"/>
</node>
<node TEXT="convex and compu.ly. efficient for optimization" ID="ID_1460440810" CREATED="1482008464395" MODIFIED="1482008538495"/>
<node TEXT="cannot always recover the true reward" ID="ID_1055312899" CREATED="1482012668005" MODIFIED="1482012740521"/>
<node TEXT="find policy with close demo. performance" ID="ID_1618400079" CREATED="1482012635433" MODIFIED="1482012667280"/>
</node>
<node TEXT="posterior challenges" ID="ID_1225645787" CREATED="1482014126690" MODIFIED="1482014134278">
<node TEXT="nonlinear funcs. of feature" ID="ID_735556954" CREATED="1482014134298" MODIFIED="1482014163726"/>
</node>
</node>
<node TEXT="Ziebart, B., Maas, A., Bagnell, J., &amp; Dey, A. (2008). Maximum Entropy Inverse Reinforcement Learning. 1433&#x2013;1438." ID="ID_618804910" CREATED="1481948890603" MODIFIED="1481974490243" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
<node TEXT="Maximum Entropy-based Probabilistic approach for IRL" ID="ID_715781450" CREATED="1482008148370" MODIFIED="1482008199429" MAX_WIDTH="400">
<node TEXT="Well-defined globally normalized distrib. over decisions" ID="ID_1279141688" CREATED="1482008226401" MODIFIED="1482008280176"/>
</node>
<node TEXT="previews challenges" ID="ID_1060555935" CREATED="1482008405406" MODIFIED="1482008421116">
<node TEXT="resolve ambiguities from MMP and Ng&apos;s IRL algs" ID="ID_1469062665" CREATED="1482027427343" MODIFIED="1482027554724"/>
<node TEXT="noise and imperfect bahavior" ID="ID_773544112" CREATED="1482008422222" MODIFIED="1482027426056"/>
<node TEXT="reasoning about uncertainty for imitation learning" ID="ID_94103798" CREATED="1482024143834" MODIFIED="1482024192060"/>
</node>
<node TEXT="previous methods" ID="ID_1423824132" CREATED="1482024678417" MODIFIED="1482024685018">
<node TEXT="margin methods" ID="ID_1648689364" CREATED="1482024686861" MODIFIED="1482024699960">
<node TEXT="structured maximum margin prediction MMP" ID="ID_507224242" CREATED="1482027035831" MODIFIED="1482027063863"/>
</node>
<node TEXT="normalize locally" ID="ID_826191945" CREATED="1482026634570" MODIFIED="1482026681383"/>
</node>
<node TEXT="algorithm Max Ent IRL" ID="ID_1986040500" CREATED="1482026713407" MODIFIED="1482026726389"/>
</node>
<node TEXT="Kalakrishnan, M., Theodorou, E., &amp; Schaal, S. (2010). Inverse reinforcement learning with PI 2. pp. 1&#x2013;2." ID="ID_72098108" CREATED="1481949054273" MODIFIED="1481974490264" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
<node TEXT="Algorithm" ID="ID_901859969" CREATED="1482582866964" MODIFIED="1482583046063" MAX_WIDTH="400">
<node TEXT="Recover cost func from expert-demos trays." ID="ID_560728507" CREATED="1482583179646" MODIFIED="1482583217852"/>
<node TEXT="Weighted linear comb. features cost function" ID="ID_555939169" CREATED="1482582877281" MODIFIED="1482583046065" MAX_WIDTH="400"/>
<node TEXT="not require repeated solving an inner RL problem" ID="ID_1102121241" CREATED="1482582971440" MODIFIED="1482583046070" MAX_WIDTH="400"/>
<node TEXT="use PI&#xb2; for" ID="ID_1041975729" CREATED="1482583254880" MODIFIED="1482584342733">
<node TEXT="continuous spaces" ID="ID_755383192" CREATED="1482583259019" MODIFIED="1482583269909"/>
<node TEXT="high dims" ID="ID_377586854" CREATED="1482583270552" MODIFIED="1482583276401"/>
</node>
<node TEXT="policy representation by" ID="ID_1191321180" CREATED="1482583455811" MODIFIED="1482583464166">
<node TEXT="DMP" ID="ID_168709900" CREATED="1482583466735" MODIFIED="1482583470097"/>
</node>
</node>
</node>
<node TEXT="Levine, S., Popovic, Z., &amp; Koltun, V. (2010). Feature Construction for Inverse Reinforcement Learning. 1&#x2013;9." ID="ID_1417633712" CREATED="1481949087871" MODIFIED="1481974490285" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
<node TEXT="FIRL alg." ID="ID_1385891064" CREATED="1482590651389" MODIFIED="1482590661664"/>
</node>
<node TEXT="Levine, S., Popovic, Z., Koltun, V., Popovic, Z., &amp; Koltun, V. (2011). Nonlinear Inverse Reinforcement Learning with Gaussian Processes. 19&#x2013;27." ID="ID_1096845178" CREATED="1481949101371" MODIFIED="1481974490303" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
<node TEXT="Boularias, A., Kober, J., Peters, J., &amp; A. Boularias, J. K. (2011). Relative Entropy Inverse Reinforcement Learning. pp. 20&#x2013;27." ID="ID_292049427" CREATED="1481949165210" MODIFIED="1481974490319" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
<node TEXT="Aghasadeghi, N., &amp; Bretl, T. (2011). Maximum entropy inverse reinforcement learning in continuous state spaces with path integrals. pp. 1561&#x2013;1566." ID="ID_613710808" CREATED="1481949188309" MODIFIED="1481974490333" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
<node TEXT="Levine, S., &amp; Koltun, V. (2012). Continuous Inverse Optimal Control with Locally Optimal Examples. pp. 41&#x2013;48." ID="ID_1083616756" CREATED="1481949347409" MODIFIED="1481974490346" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
<node TEXT="Zhifei, S., &amp; Meng Joo, E. (2012). A survey of inverse reinforcement learning techniques. 293&#x2013;311." ID="ID_1717122549" CREATED="1481949367601" MODIFIED="1481974490356" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
<node TEXT="Park, T., &amp; Levine, S. (2013). Inverse Optimal Control for Humanoid Locomotion. pp. 1&#x2013;5." ID="ID_754270356" CREATED="1481949413284" MODIFIED="1481974490365" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
<node TEXT="Wulfmeier, M., Ondruska, P., &amp; Posner, I. (2015). Maximum Entropy Deep Inverse Reinforcement Learning. 1&#x2013;9." ID="ID_1183642602" CREATED="1481949799345" MODIFIED="1481974490372" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
<node TEXT="Finn, C., Levine, S., &amp; Abbeel, P. (2016). Guided Cost Learning: Deep Inverse Optimal Control via Policy Optimization." ID="ID_283838212" CREATED="1481949804017" MODIFIED="1481974490378" MAX_WIDTH="400">
<edge STYLE="sharp_bezier" COLOR="#0f1183"/>
</node>
</node>
</node>
</map>
