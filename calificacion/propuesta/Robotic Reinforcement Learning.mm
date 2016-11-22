<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Robotic Reinforcement Learning" ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1478555326515"><hook NAME="MapStyle">

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
<hook NAME="AutomaticEdgeColor" COUNTER="7"/>
<node TEXT="Context of" POSITION="right" ID="ID_53471831" CREATED="1478555362764" MODIFIED="1478555387663">
<edge COLOR="#ff0000"/>
<node TEXT="Machine Learning" ID="ID_1108863272" CREATED="1478555387681" MODIFIED="1478555407279"/>
<node TEXT="Optimal Control" ID="ID_793083707" CREATED="1478555407927" MODIFIED="1478555438015"/>
</node>
<node TEXT="Problem" POSITION="right" ID="ID_953001672" CREATED="1478555562678" MODIFIED="1478555630067">
<edge COLOR="#0000ff"/>
<node TEXT="Find an Optimal policy as an optimzation problem" ID="ID_1212417925" CREATED="1478555630092" MODIFIED="1478555711848"/>
<node TEXT="Solution approaches" ID="ID_1573596914" CREATED="1478555642383" MODIFIED="1478555761772">
<node TEXT="Value Functions (dual formulation)" ID="ID_1066972611" CREATED="1478555746035" MODIFIED="1478555804532">
<node TEXT="Based on Bellman&apos;s equations" ID="ID_402246248" CREATED="1478555832392" MODIFIED="1478555925662">
<node TEXT="Crirerios de optimalidad" ID="ID_29882207" CREATED="1478567600354" MODIFIED="1478567607777"/>
</node>
<node TEXT="Methods" ID="ID_1711537111" CREATED="1478555888277" MODIFIED="1478555905807">
<node TEXT="Dynamic Programming and Model-Based" ID="ID_1054928998" CREATED="1478555877134" MODIFIED="1478556025344">
<node TEXT="Policy Iteration" ID="ID_1330141919" CREATED="1478555942713" MODIFIED="1478555949219"/>
<node TEXT="Value Iteration" ID="ID_1939273746" CREATED="1478555949833" MODIFIED="1478555955940"/>
</node>
<node TEXT="Monte Carlo and Model-Free" ID="ID_529318822" CREATED="1478555931128" MODIFIED="1478566077837">
<node TEXT="Sampling roll-outs to estimates policy evaluation" ID="ID_50996049" CREATED="1478556127830" MODIFIED="1478566114647"/>
<node TEXT="Episodic On-policy free-model" ID="ID_644637950" CREATED="1478566027994" MODIFIED="1478566236150"/>
</node>
<node TEXT="Temporal Difference" ID="ID_462226521" CREATED="1478566238476" MODIFIED="1478566626776">
<node TEXT="Bellman&apos;s equation as iterative contraction step" ID="ID_453129575" CREATED="1478566750481" MODIFIED="1478566890824"/>
<node TEXT="Error estimates of the value function" ID="ID_1849242017" CREATED="1478566643528" MODIFIED="1478566745079"/>
<node TEXT="Q-Learning off-policy" ID="ID_1360917521" CREATED="1478566930232" MODIFIED="1478566943035"/>
<node TEXT="SARSA on-policy" ID="ID_1673882294" CREATED="1478566943556" MODIFIED="1478566952372"/>
</node>
</node>
</node>
<node TEXT="Policy Search (original formulation)" ID="ID_1974794199" CREATED="1478555777318" MODIFIED="1478567628438">
<node TEXT="Direct search and no optimality support" ID="ID_513192514" CREATED="1478567630309" MODIFIED="1478567898640"/>
<node TEXT="Integration of expert knowledge" ID="ID_1522874901" CREATED="1478566992105" MODIFIED="1478567088446"/>
<node TEXT="Methods" ID="ID_65334094" CREATED="1478567770944" MODIFIED="1478567776494">
<node TEXT="Gradient-based" ID="ID_1095006627" CREATED="1478567777862" MODIFIED="1478567784763"/>
<node TEXT="Gradient-free" ID="ID_1330301021" CREATED="1478567785222" MODIFIED="1478567795872"/>
</node>
</node>
<node TEXT="Actor-Critic" ID="ID_1538140302" CREATED="1478568184234" MODIFIED="1478569799897">
<node TEXT="Best of both" ID="ID_81248554" CREATED="1478569823433" MODIFIED="1478569828426">
<node TEXT="Actor-Only or Policy Search" ID="ID_1601391197" CREATED="1478569831057" MODIFIED="1478570020106">
<node TEXT="High variance gradient" ID="ID_906457405" CREATED="1478570300690" MODIFIED="1478570319495"/>
</node>
<node TEXT="Critic-Only or Value Function" ID="ID_386857648" CREATED="1478569865235" MODIFIED="1478570035993"/>
</node>
</node>
<node TEXT="Function Approximation" ID="ID_296577083" CREATED="1478570041460" MODIFIED="1478570089750">
<node TEXT="for tackle intractable problems of" ID="ID_497504329" CREATED="1478570109964" MODIFIED="1478570338300">
<node TEXT="computational" ID="ID_1629044285" CREATED="1478570134918" MODIFIED="1478570359200"/>
<node TEXT="information-theoretical" ID="ID_577465071" CREATED="1478570359739" MODIFIED="1478570372290"/>
</node>
<node TEXT="methods" ID="ID_1365014578" CREATED="1478571315581" MODIFIED="1478571322919">
<node TEXT="parametric" ID="ID_66772075" CREATED="1478571322933" MODIFIED="1478571329196"/>
<node TEXT="non-parametric" ID="ID_334211821" CREATED="1478571330212" MODIFIED="1478571336489"/>
</node>
<node TEXT="limitation" ID="ID_1765626552" CREATED="1478614275851" MODIFIED="1478614279451">
<node TEXT="for iid" ID="ID_807667263" CREATED="1478614282918" MODIFIED="1478614287117"/>
</node>
</node>
</node>
</node>
<node TEXT="Challenges" POSITION="right" ID="ID_1521267584" CREATED="1478614543610" MODIFIED="1478614622798">
<edge COLOR="#00ff00"/>
<node TEXT="Curse of Dimensionality" ID="ID_1931178262" CREATED="1478614550246" MODIFIED="1478614563668"/>
<node TEXT="Curse of Real-World Samples" ID="ID_1936423108" CREATED="1478614596411" MODIFIED="1478614611833"/>
<node TEXT="Curse of Under-Modeling and Model Uncertainty" ID="ID_873427375" CREATED="1478614625334" MODIFIED="1478614689836"/>
<node TEXT="Curse of Goal Specification" ID="ID_1500534995" CREATED="1478614690415" MODIFIED="1478614708650"/>
</node>
<node TEXT="Tractability through" POSITION="right" ID="ID_1254048753" CREATED="1478614939144" MODIFIED="1478614977533">
<edge COLOR="#ff00ff"/>
<node TEXT="Representation" ID="ID_1185060851" CREATED="1478614977548" MODIFIED="1478614984925">
<node TEXT="Smart State-Action Discretization" ID="ID_807857209" CREATED="1478615026413" MODIFIED="1478615064296">
<node TEXT="Hand-Crafted Discretization" ID="ID_1289087842" CREATED="1478615090765" MODIFIED="1478615106589"/>
<node TEXT="Learnide from Data" ID="ID_652789806" CREATED="1478615107435" MODIFIED="1478615142256"/>
<node TEXT="Meta-Actions" ID="ID_1808737194" CREATED="1478615149254" MODIFIED="1478615160365"/>
<node TEXT="Relational Representation" ID="ID_1950966150" CREATED="1478615167163" MODIFIED="1478615176119"/>
</node>
<node TEXT="Value Function Approximation" ID="ID_980546580" CREATED="1478614985419" MODIFIED="1478615004289">
<node TEXT="Physics-inspired Features" ID="ID_50570147" CREATED="1478615192641" MODIFIED="1478615217081"/>
<node TEXT="Neural Networks" ID="ID_1217725583" CREATED="1478615231791" MODIFIED="1478615238717"/>
<node TEXT="Generalize through Neighboring Cells" ID="ID_825512440" CREATED="1478615245357" MODIFIED="1478615262278"/>
<node TEXT="Local Models" ID="ID_1850594767" CREATED="1478615266004" MODIFIED="1478615269578"/>
<node TEXT="Gaussian Process Regression" ID="ID_1402563201" CREATED="1478615270251" MODIFIED="1478615301861"/>
</node>
<node TEXT="Pre-structured Policies" ID="ID_1326122574" CREATED="1478615004692" MODIFIED="1478615025677">
<node TEXT="Via Points &amp; Splines" ID="ID_1104778692" CREATED="1478615383748" MODIFIED="1478615396687"/>
<node TEXT="Linear Models" ID="ID_1454743840" CREATED="1478615397070" MODIFIED="1478615412658"/>
<node TEXT="Motor Primitives" ID="ID_1536590393" CREATED="1478615413118" MODIFIED="1478615426654"/>
<node TEXT="Gaussian Mixture Models and Radial Basis Function Models" ID="ID_632953056" CREATED="1478615427055" MODIFIED="1478615457865"/>
<node TEXT="Neural Networks" ID="ID_1816904922" CREATED="1478615733960" MODIFIED="1478615742204"/>
<node TEXT="Linear Local Controllers" ID="ID_1710114689" CREATED="1478615744315" MODIFIED="1478615752212"/>
<node TEXT="Non-parametric Policies" ID="ID_948917416" CREATED="1478615759075" MODIFIED="1478615768870"/>
</node>
</node>
<node TEXT="Prior Knowledge" ID="ID_438142988" CREATED="1478615073750" MODIFIED="1478615821996">
<node TEXT="Demonstration" ID="ID_729706141" CREATED="1478615831057" MODIFIED="1478615843767">
<node TEXT="By Teacher" ID="ID_1115967486" CREATED="1478615866422" MODIFIED="1478615875433"/>
<node TEXT="Hand-Crafted Policies" ID="ID_1420749984" CREATED="1478615882584" MODIFIED="1478615894601"/>
</node>
<node TEXT="Task Structuring" ID="ID_1464305451" CREATED="1478615844402" MODIFIED="1478615911020">
<node TEXT="Hierarchical Reinforcement Learning" ID="ID_577731572" CREATED="1478615915868" MODIFIED="1478615980941"/>
<node TEXT="Progressive Tasks" ID="ID_1731939350" CREATED="1478615988378" MODIFIED="1478615995404"/>
</node>
<node TEXT="Directed Exploration" ID="ID_700649059" CREATED="1478616065885" MODIFIED="1478616105763">
<node TEXT="Curiosity" ID="ID_164024438" CREATED="1478616138571" MODIFIED="1478616141475"/>
</node>
</node>
<node TEXT="Models" ID="ID_1745484187" CREATED="1478616153101" MODIFIED="1478616160316">
<node TEXT="Core Issues" ID="ID_1106501234" CREATED="1478616617709" MODIFIED="1478616622026">
<node TEXT="Dealing with Simulation Biases" ID="ID_457430831" CREATED="1478616691090" MODIFIED="1478616705050"/>
</node>
<node TEXT="Techniques" ID="ID_1172053808" CREATED="1478616622404" MODIFIED="1478616641429">
<node TEXT="Distribution over Models for Simulation" ID="ID_644433627" CREATED="1478616641447" MODIFIED="1478616689246"/>
<node TEXT="Sampling by Re-Using Random Numbers" ID="ID_890763223" CREATED="1478617050672" MODIFIED="1478617072341"/>
</node>
<node TEXT="Successfull learning approches with forward models" ID="ID_1995478715" CREATED="1478617882699" MODIFIED="1478617907579">
<node TEXT="Iterative Learning Control" ID="ID_277554123" CREATED="1478617908453" MODIFIED="1478617920253"/>
<node TEXT="Locally Linear Quadratic Regulators" ID="ID_1161132222" CREATED="1478617920841" MODIFIED="1478617951483"/>
<node TEXT="Value Function Methods with Learned Models" ID="ID_818615730" CREATED="1478617960002" MODIFIED="1478617988888"/>
<node TEXT="Policy Search with Learned Models" ID="ID_1584129495" CREATED="1478617989342" MODIFIED="1478618007229"/>
</node>
</node>
</node>
<node TEXT="Open Questions" POSITION="right" ID="ID_986687860" CREATED="1478720564445" MODIFIED="1478720576298">
<edge COLOR="#00ffff"/>
<node TEXT="How to choose representations automatically?" ID="ID_722325953" CREATED="1478720780217" MODIFIED="1478720849575"/>
<node TEXT="How to generate reward functions from data?" ID="ID_129846958" CREATED="1478720800274" MODIFIED="1478720829428"/>
<node TEXT="How much can prior knowledge help and how much is needed?" ID="ID_610176528" CREATED="1478720850745" MODIFIED="1478720911338"/>
<node TEXT="How to integrate more tightly with perception?" ID="ID_421791113" CREATED="1478720882120" MODIFIED="1478720959971"/>
<node TEXT="How to reduce parameter sensitivity?" ID="ID_1057103568" CREATED="1478720967080" MODIFIED="1478720982772"/>
<node TEXT="How to deal with model errors and under-modeling?" ID="ID_963382332" CREATED="1478720983511" MODIFIED="1478721100103"/>
</node>
<node TEXT="Practical Challenges" POSITION="right" ID="ID_1851182425" CREATED="1478720601359" MODIFIED="1478720614870">
<edge COLOR="#ffff00"/>
<node TEXT="Exploit data sets better" ID="ID_52046876" CREATED="1478721115851" MODIFIED="1478721137671"/>
<node TEXT="Comparable Experiments and Consistent Evaluation" ID="ID_1995446139" CREATED="1478721148627" MODIFIED="1478721170130"/>
</node>
<node TEXT="Robotic Lessons for RL" POSITION="right" ID="ID_1587376557" CREATED="1478720671724" MODIFIED="1478720692238">
<edge COLOR="#7c0000"/>
<node TEXT="Focus on High-Dimensional Continuous Actions and Constant Adaptation" ID="ID_181829585" CREATED="1478721188183" MODIFIED="1478721220104"/>
<node TEXT="Exploit Domain Structure for Scalability" ID="ID_986341973" CREATED="1478721220921" MODIFIED="1478721247008"/>
<node TEXT="Local Optimality and Controller State Distributions" ID="ID_251991529" CREATED="1478721259128" MODIFIED="1478721277438"/>
<node TEXT="Reward Design" ID="ID_1360621537" CREATED="1478721291814" MODIFIED="1478721301665"/>
</node>
</node>
</map>
