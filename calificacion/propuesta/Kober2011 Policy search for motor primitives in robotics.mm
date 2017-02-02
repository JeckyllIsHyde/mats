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
<node TEXT="General setting" ID="ID_421409848" CREATED="1485789581698" MODIFIED="1485789620357">
<node TEXT="for parametrized policies, linear in parameteres" ID="ID_694305080" CREATED="1485803369330" MODIFIED="1485803391752"/>
<node TEXT="$x_t$, $u_t$, $r_t$, $T$" ID="ID_1229938359" CREATED="1485803141553" MODIFIED="1485803234429" FORMAT="latexPatternFormat"/>
<node TEXT="stochastic policy $u_t\sim\pi_\theta(u_t|x_t,t)$" ID="ID_1202990283" CREATED="1485802982658" MODIFIED="1485803313352" FORMAT="latexPatternFormat">
<node TEXT="Allows a natural exploration by $\theta$" ID="ID_1888216567" CREATED="1485803102027" MODIFIED="1485803334462" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="expected return for a policy $\pi$ with parameter $\theta$" ID="ID_613650422" CREATED="1485803400707" MODIFIED="1485803456927" FORMAT="latexPatternFormat">
<node TEXT="$J(\theta)=\int_\mathbb{T}\,p_\theta(\tau)R(\tau)d\tau$" ID="ID_342378389" CREATED="1485803461800" MODIFIED="1485803525203" FORMAT="latexPatternFormat"/>
<node TEXT="with rollout as $\tau=[x_{1:T},u_{1:T}]$" ID="ID_1323419839" CREATED="1485803534487" MODIFIED="1485803612548" FORMAT="latexPatternFormat"/>
<node TEXT="standar markov assuption $p_\theta(\tau)=p(x_1)\prod_{t=1}^Tp(x_{t+1}|x_t,u_t)\pi_\theta(u_t|x_t,t)$" ID="ID_721149295" CREATED="1485803755603" MODIFIED="1485804014417" FORMAT="latexPatternFormat">
<node TEXT="distribuci&#xf3;n estado inicial: $x_1\sim p(x_1)$" ID="ID_457838831" CREATED="1485806372879" MODIFIED="1485806685291" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="additive acumulative reward $R(\tau)=T^{-1}\sum_{t=1}^Tr(x_t,u_t,s_{t+1},r_t)$" ID="ID_716073953" CREATED="1485806157561" MODIFIED="1485806254160" FORMAT="latexPatternFormat"/>
</node>
</node>
<node TEXT="episodic RL approach" ID="ID_1374197164" CREATED="1485789593146" MODIFIED="1485789641966">
<node TEXT="Finite horizons and episodic restart" ID="ID_170902331" CREATED="1485803237047" MODIFIED="1485803276169"/>
<node TEXT="bounds on policy improvement" ID="ID_474358993" CREATED="1485807455336" MODIFIED="1485807464103">
<node TEXT="maximizing the lower bounds of the cost function" ID="ID_296137579" CREATED="1485807495585" MODIFIED="1485807529142">
<node TEXT="with EM" ID="ID_1909785805" CREATED="1485807535920" MODIFIED="1485807539010">
<node TEXT="if the lower bound also becomes an equality for the sampling policy, the we can garantee that the policy will be improved by maximizing the lower bound" ID="ID_1670545225" CREATED="1485807581912" MODIFIED="1485807705018" MAX_WIDTH="300" MIN_WIDTH="300"/>
</node>
<node TEXT="can use supervised learning methods" ID="ID_1035735126" CREATED="1485807736355" MODIFIED="1485807747507"/>
</node>
<node TEXT="1. generate rollouts $\tau$ with $\theta$ and weighted with $R(\tau)$" ID="ID_1105044311" CREATED="1485808093342" MODIFIED="1485808246809" FORMAT="latexPatternFormat"/>
<node TEXT="2. match it  with a new parametrized $\theta&apos;$" ID="ID_184783429" CREATED="1485808248461" MODIFIED="1485808291283" FORMAT="latexPatternFormat">
<node TEXT="Def: $D_{KL}(p(\tau)\,||\,q(\tau))=\int p(\tau)\log \frac{p(\tau)}{q(\tau)}d\tau$" ID="ID_1852816375" CREATED="1485809406917" MODIFIED="1485809569633" FORMAT="latexPatternFormat"/>
<node TEXT="Kullback-Leibler divergence $D_{KL}(p_\theta(\tau)R(\tau)\,||\,p_{\theta&apos;}(\tau))$ of reward-weighted $p_\theta(\tau)R(\tau)$ and new path $p_{\theta&apos;}(\tau)$" ID="ID_869359487" CREATED="1485808378620" MODIFIED="1485809401160" FORMAT="latexPatternFormat" MAX_WIDTH="300" MIN_WIDTH="300"/>
<node TEXT="Lower bound of the expected return $L_\theta(\theta&apos;)=-D_{KL}(p_\theta(\tau)R(\tau)\,||\,p_{\theta&apos;}(\tau))$" ID="ID_1096251946" CREATED="1485811047590" MODIFIED="1485811219848" MAX_WIDTH="300" MIN_WIDTH="300" FORMAT="latexPatternFormat"/>
<node TEXT="policy improvement by maximizing $L_\theta(\theta&apos;)$" ID="ID_146243884" CREATED="1485811241568" MODIFIED="1485811299100" MAX_WIDTH="300" MIN_WIDTH="300" FORMAT="latexPatternFormat"/>
</node>
</node>
<node TEXT="resulting policy updates" ID="ID_1923927091" CREATED="1485811321289" MODIFIED="1485811330181">
<node TEXT="PG can be derived from $L_\theta(\theta&apos;)$" ID="ID_305252845" CREATED="1485811751896" MODIFIED="1485811814338" FORMAT="latexPatternFormat"/>
<node TEXT="PS via EM" ID="ID_1325195621" CREATED="1485812056978" MODIFIED="1485812220553"/>
</node>
</node>
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
