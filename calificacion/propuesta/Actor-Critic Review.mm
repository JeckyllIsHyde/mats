<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1485264119463"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p style="text-align: center">
      Actor-Critic
    </p>
    <p style="text-align: center">
      Review
    </p>
  </body>
</html>
</richcontent>
<hook NAME="MapStyle" zoom="1.5">

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
<hook NAME="AutomaticEdgeColor" COUNTER="4"/>
<node TEXT="Introduction" POSITION="right" ID="ID_1906068532" CREATED="1485279701658" MODIFIED="1485279707365">
<edge COLOR="#0000ff"/>
<node TEXT="Actor-only" ID="ID_718711366" CREATED="1485280163243" MODIFIED="1485280168389">
<node TEXT="continuous actions" ID="ID_536720377" CREATED="1485280185639" MODIFIED="1485280198426"/>
<node TEXT="optimization methods" ID="ID_1068272575" CREATED="1485280198888" MODIFIED="1485280205769">
<node TEXT="policy gradient methods" ID="ID_916722561" CREATED="1485280205770" MODIFIED="1485280225649">
<node TEXT="high-variance" ID="ID_1636496571" CREATED="1485280225650" MODIFIED="1485280235692"/>
<node TEXT="slow learning" ID="ID_1231807095" CREATED="1485280236555" MODIFIED="1485280253260"/>
</node>
</node>
</node>
<node TEXT="Critic-only" ID="ID_591083115" CREATED="1485299236389" MODIFIED="1485299363184">
<node TEXT="Temporal differences learning" ID="ID_1815628010" CREATED="1485299377103" MODIFIED="1485299384900">
<node TEXT="lower-variance" ID="ID_1580927513" CREATED="1485299393353" MODIFIED="1485299398002"/>
</node>
<node TEXT="policies from value functions" ID="ID_13751288" CREATED="1485299413895" MODIFIED="1485299431979">
<node TEXT="greedy actions" ID="ID_1311912799" CREATED="1485299431981" MODIFIED="1485299436919">
<node TEXT="optimization process over each state" ID="ID_457726067" CREATED="1485299457155" MODIFIED="1485299485156">
<node TEXT="enumerations for finite spaces" ID="ID_419861868" CREATED="1485299585492" MODIFIED="1485299601438"/>
</node>
<node TEXT="computational intensive" ID="ID_36580791" CREATED="1485299517754" MODIFIED="1485299523385">
<node TEXT="not for continuous action spaces" ID="ID_878082872" CREATED="1485299534933" MODIFIED="1485299555718"/>
</node>
</node>
</node>
<node TEXT="policy is implemented implicitly by the critic" ID="ID_1293871758" CREATED="1485300418218" MODIFIED="1485300451766"/>
</node>
<node TEXT="Actor-critic" ID="ID_533817148" CREATED="1485299635582" MODIFIED="1485299640491">
<node TEXT="advantages of both" ID="ID_1848886633" CREATED="1485299719818" MODIFIED="1485299741037">
<node TEXT="A-only:" ID="ID_193690487" CREATED="1485299741039" MODIFIED="1485299791199">
<node TEXT="parametrized policies admits continuous actions without need of value functions" ID="ID_1823480451" CREATED="1485299801367" MODIFIED="1485299865700"/>
</node>
<node TEXT="C-only:" ID="ID_102111604" CREATED="1485299791833" MODIFIED="1485299798756">
<node TEXT="parametrized critics get low-variances knowledge of performance" ID="ID_1008206501" CREATED="1485299889359" MODIFIED="1485299971476">
<node TEXT="gradients to update actor" ID="ID_261110764" CREATED="1485300015911" MODIFIED="1485300027101"/>
<node TEXT="speed up learning processes" ID="ID_1815500811" CREATED="1485300040427" MODIFIED="1485300049036"/>
</node>
</node>
</node>
<node TEXT="good convegences properties over C-only" ID="ID_1683522065" CREATED="1485300088309" MODIFIED="1485300153673"/>
<node TEXT="two parametrization fncs" ID="ID_471797393" CREATED="1485300482758" MODIFIED="1485300502336">
<node TEXT="value or critic" ID="ID_1305775246" CREATED="1485300502338" MODIFIED="1485300508763"/>
<node TEXT="policy or actor" ID="ID_1334544492" CREATED="1485300509296" MODIFIED="1485300514614"/>
</node>
<node TEXT="policy gradient-based" ID="ID_586673349" CREATED="1485300239145" MODIFIED="1485300271737">
<node TEXT="standard &apos;vanilla&apos;" ID="ID_76525176" CREATED="1485300286477" MODIFIED="1485300295333"/>
<node TEXT="natural" ID="ID_1327188721" CREATED="1485300295856" MODIFIED="1485300306286"/>
</node>
</node>
</node>
<node TEXT="Markov decision processes MDP" POSITION="right" ID="ID_1967390515" CREATED="1485300844669" MODIFIED="1485300861640">
<edge COLOR="#00ff00"/>
<node TEXT="is a tuple $\langle X,U,f,\rho\rangle$" ID="ID_293711373" CREATED="1485300868775" MODIFIED="1485300976929" FORMAT="latexPatternFormat">
<node TEXT="if not chage in time, is a stationary MDP" ID="ID_413631658" CREATED="1485300988476" MODIFIED="1485301011722"/>
<node TEXT="otherwise is a non-stationary MDP" ID="ID_1648494729" CREATED="1485301012908" MODIFIED="1485301021958"/>
</node>
<node TEXT="" ID="ID_209293137" CREATED="1485300981934" MODIFIED="1485300981934"/>
</node>
<node TEXT="Actor-Critic in the context of RL" POSITION="right" ID="ID_1020821391" CREATED="1485371551520" MODIFIED="1485371561219">
<edge COLOR="#ff00ff"/>
<node TEXT="Critic-only" ID="ID_1107741717" CREATED="1485371565203" MODIFIED="1485371576923">
<node TEXT="as" ID="ID_1403459178" CREATED="1485371576931" MODIFIED="1485371579433">
<node TEXT="Q-learning" ID="ID_1349477607" CREATED="1485371579438" MODIFIED="1485371587758"/>
<node TEXT="SARSA" ID="ID_152530315" CREATED="1485371588295" MODIFIED="1485371593919"/>
</node>
<node TEXT="fail" ID="ID_576342794" CREATED="1485371597757" MODIFIED="1485371603258">
<node TEXT="in continous action-spaces" ID="ID_664694862" CREATED="1485371603260" MODIFIED="1485371619506"/>
</node>
<node TEXT="a solution was" ID="ID_882214601" CREATED="1485371636672" MODIFIED="1485371654573">
<node TEXT="Function approximators" ID="ID_870004811" CREATED="1485371654578" MODIFIED="1485371868869">
<node TEXT="fail" ID="ID_1180498306" CREATED="1485371729868" MODIFIED="1485371736862">
<node TEXT="convergences" ID="ID_1984677342" CREATED="1485371736866" MODIFIED="1485371740968"/>
</node>
<node TEXT="but" ID="ID_251167138" CREATED="1485371742411" MODIFIED="1485371745662">
<node TEXT="linear-in parameters works" ID="ID_1261001096" CREATED="1485371745665" MODIFIED="1485371767218">
<node TEXT="if on-policy is used to sample" ID="ID_879766267" CREATED="1485371767223" MODIFIED="1485371782750"/>
</node>
</node>
</node>
<node TEXT="Temporal differences" ID="ID_1062106106" CREATED="1485371809623" MODIFIED="1485371821982">
<node TEXT="From Bellsman&apos;s equ" ID="ID_1135428284" CREATED="1485376007028" MODIFIED="1485376022864">
<node TEXT="$Q^\pi(x,u)=\mathbb{E}\left[\rho(x,u,x&apos;)+\gamma Q^\pi(x&apos;,u&apos;)\right]$" ID="ID_1798702400" CREATED="1485376024174" MODIFIED="1485376222492" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="Error bounding" ID="ID_1492450353" CREATED="1485371831106" MODIFIED="1485371836338">
<node TEXT=" TD error $\delta_k=r_{k+1}+\gamma Q_\theta_k(x_{k+1})-Q_\theta_k(x_k)$" ID="ID_905402382" CREATED="1485379764240" MODIFIED="1485379977910" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="LSTD" ID="ID_1185032159" CREATED="1485371798070" MODIFIED="1485371807867"/>
</node>
</node>
</node>
<node TEXT="Actor-only" ID="ID_1261002851" CREATED="1485372035890" MODIFIED="1485372039527">
<node TEXT="obtain gradient as" ID="ID_1732555348" CREATED="1485375475861" MODIFIED="1485375606198">
<node TEXT="IPA" ID="ID_806846916" CREATED="1485375569417" MODIFIED="1485375577476"/>
<node TEXT="likelihood-based" ID="ID_1412918022" CREATED="1485375558312" MODIFIED="1485375565533">
<node TEXT="REINFORCE" ID="ID_1438340747" CREATED="1485375514949" MODIFIED="1485375549674"/>
</node>
<node TEXT="model-based" ID="ID_1592406172" CREATED="1485375588873" MODIFIED="1485375593844">
<node TEXT="PILCO" ID="ID_1350719894" CREATED="1485375612603" MODIFIED="1485375616257"/>
</node>
</node>
<node TEXT="good for" ID="ID_574349965" CREATED="1485375823427" MODIFIED="1485375828889">
<node TEXT="continuous action-spaces" ID="ID_1797743932" CREATED="1485375828892" MODIFIED="1485375843271"/>
</node>
<node TEXT="bad in" ID="ID_746537932" CREATED="1485375845281" MODIFIED="1485375849909">
<node TEXT="high-variance gradient estimate" ID="ID_799687290" CREATED="1485375849911" MODIFIED="1485375873364"/>
<node TEXT="loose info from past estimates" ID="ID_1865852880" CREATED="1485375873957" MODIFIED="1485375969857"/>
</node>
<node TEXT="gradient" ID="ID_390934518" CREATED="1485375639155" MODIFIED="1485375645074">
<node TEXT="$\nabla_\theta J=\frac{\partial J}{\partial \pi}\frac{\partial \pi}{\partial \theta}$" ID="ID_1954886673" CREATED="1485375645075" MODIFIED="1485380068298" FORMAT="latexPatternFormat"/>
<node TEXT="policy update equ: $\theta_{k+1}=\theta_k+\alpha_{a,k}\nabla_\theta J_k$" ID="ID_1258446161" CREATED="1485376369475" MODIFIED="1485380082434" FORMAT="latexPatternFormat">
<node TEXT="$\alpha_{a,k}$ must satisfy" ID="ID_738057441" CREATED="1485376769564" MODIFIED="1485380092021" FORMAT="latexPatternFormat">
<node TEXT="For convergence" ID="ID_845436756" CREATED="1485376911441" MODIFIED="1485376917139"/>
<node TEXT="$\sum_{k=0}^\infty\,\alpha_{a,k}=\infty$" ID="ID_1539708671" CREATED="1485376801136" MODIFIED="1485380105974" FORMAT="latexPatternFormat"/>
<node TEXT="$\sum_{k=0}^\infty\,\alpha_{a,k}^2&lt;\infty$" ID="ID_1716020566" CREATED="1485376872681" MODIFIED="1485380119796" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="the same for $\alpha_{c,k}$" ID="ID_831728128" CREATED="1485383054237" MODIFIED="1485383082412" FORMAT="latexPatternFormat"/>
</node>
</node>
</node>
<node TEXT="Actor-critic" ID="ID_529244108" CREATED="1485376979559" MODIFIED="1485376983199">
<node TEXT="from" ID="ID_1020729684" CREATED="1485376994090" MODIFIED="1485376998063">
<node TEXT="Critic-only" ID="ID_1685646871" CREATED="1485376998066" MODIFIED="1485377005743">
<node TEXT="TD(0)" ID="ID_1116559973" CREATED="1485380712339" MODIFIED="1485380721282"/>
<node TEXT="$TD(\lambda)$" ID="ID_1400148784" CREATED="1485377005745" MODIFIED="1485377142006" FORMAT="latexPatternFormat">
<node TEXT="$z_k=\lambda\gamma z_{k-1}+\nabla_\theta_{c,k}(x_k)$" ID="ID_1359224204" CREATED="1485380276799" MODIFIED="1485382084473" FORMAT="latexPatternFormat"/>
<node TEXT="$\theta_{c,k+1}=\theta_{c,k}+\alpha_{c,k}\delta_kz_k$" ID="ID_957998826" CREATED="1485380276799" MODIFIED="1485382117594" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="LSTD" ID="ID_1525742610" CREATED="1485377021233" MODIFIED="1485377024818">
<node TEXT="uses trayectory samples from a policy $\pi$ to setup a system of TD eqs" ID="ID_1904062935" CREATED="1485383169835" MODIFIED="1485383345590" FORMAT="latexPatternFormat"/>
<node TEXT="linear approx of value fnc" ID="ID_434199115" CREATED="1485383295420" MODIFIED="1485383311210">
<node TEXT="for least-square methods" ID="ID_314600300" CREATED="1485383323406" MODIFIED="1485383337049"/>
</node>
</node>
<node TEXT="Residual gradients" ID="ID_1062492350" CREATED="1485377025722" MODIFIED="1485377066905"/>
</node>
</node>
<node TEXT="algorithm (for discounted reward)" ID="ID_171685574" CREATED="1485377458376" MODIFIED="1485382978849">
<node TEXT="1. The critic approximates and updates the value function using samples" ID="ID_1420742381" CREATED="1485377461670" MODIFIED="1485377532519" MAX_WIDTH="299">
<node TEXT=" TD error $\delta_k=r_{k+1}+\gamma Q_\theta_k(x_{k+1})-Q_\theta_k(x_k)$" ID="ID_1247414466" CREATED="1485380430762" MODIFIED="1485380441272" FORMAT="latexPatternFormat"/>
<node TEXT="Update critic TD(0) $\theta_{c,k+1}=\theta_{c,k}+\alpha_{c,k}\delta_k\nabla_\theta_{c,k}(x_k)$" ID="ID_1346803061" CREATED="1485380276799" MODIFIED="1485380825242" FORMAT="latexPatternFormat">
<node TEXT="for linearly params $\theta_{c,k+1}=\theta_{c,k}+\alpha_{c,k}\delta_k\phi_{c,k}(x_k)$" ID="ID_752590442" CREATED="1485380621854" MODIFIED="1485380675773" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="or TD(\lambda)" ID="ID_231263756" CREATED="1485382192117" MODIFIED="1485382267464" FORMAT="latexPatternFormat"/>
</node>
<node TEXT="2. The value function is then used to update the actor&#x2019;s policy parameters in the direction of performance improvement." ID="ID_779428088" CREATED="1485377467567" MODIFIED="1485377532525" MAX_WIDTH="299">
<node TEXT="$\theta_{k+1}=\theta_k+\alpha_{a,k}\nabla_\theta J_k$" ID="ID_88752821" CREATED="1485376369475" MODIFIED="1485382319057" FORMAT="latexPatternFormat"/>
</node>
</node>
<node TEXT="fncs approximators" ID="ID_309446223" CREATED="1485379163238" MODIFIED="1485379177523">
<node TEXT="critic" ID="ID_927920492" CREATED="1485379177525" MODIFIED="1485379188048">
<node TEXT="V value-function" ID="ID_1351563964" CREATED="1485379221068" MODIFIED="1485379372562">
<node TEXT="$V_\theta_c(x)$" ID="ID_1474781372" CREATED="1485379193434" MODIFIED="1485379460622" FORMAT="latexPatternFormat">
<node TEXT="linear: $\theta_c^T\cdot\phi(x)$" ID="ID_488111747" CREATED="1485379290094" MODIFIED="1485379418604" FORMAT="latexPatternFormat"/>
</node>
</node>
<node TEXT="Q value-function" ID="ID_1580776325" CREATED="1485379235871" MODIFIED="1485379252783">
<node TEXT="$Q_\theta_c(x,u)$" ID="ID_1208798115" CREATED="1485379193434" MODIFIED="1485379474446" FORMAT="latexPatternFormat">
<node TEXT="linear: $\theta_c^T\cdot\phi(x,u)$" ID="ID_1508720914" CREATED="1485379290094" MODIFIED="1485379481439" FORMAT="latexPatternFormat"/>
</node>
</node>
</node>
<node TEXT="actor" ID="ID_1163293109" CREATED="1485379188720" MODIFIED="1485379192123">
<node TEXT="policy-function" ID="ID_728474861" CREATED="1485379507270" MODIFIED="1485379517472">
<node TEXT="deterministic $u\sim\pi_\theta(u|x)$" ID="ID_1030521250" CREATED="1485379517474" MODIFIED="1485380188343" FORMAT="latexPatternFormat"/>
<node TEXT="stochastic $u=\mu_\theta(x)$" ID="ID_1881573301" CREATED="1485379521438" MODIFIED="1485379646437" FORMAT="latexPatternFormat"/>
</node>
</node>
</node>
</node>
<node TEXT="Policy gradient theorem" ID="ID_1097577129" CREATED="1485383564959" MODIFIED="1485383572946"/>
</node>
<node TEXT="Discussion" POSITION="right" ID="ID_1659543106" CREATED="1485264088011" MODIFIED="1485264501923" FORMAT="STANDARD_FORMAT">
<edge COLOR="#ff0000"/>
<node TEXT="When to choose AC, A-only, C-only?" ID="ID_536978561" CREATED="1485264608976" MODIFIED="1485264759497">
<node TEXT="C-only" ID="ID_895414977" CREATED="1485265435266" MODIFIED="1485265447088">
<node TEXT="$\pi(x)=\text{argmax}_u Q(x,u)$" ID="ID_606004357" CREATED="1485266988788" MODIFIED="1485267147620" FORMAT="latexPatternFormat"/>
<node TEXT="not for continuous action-space" ID="ID_1501025703" CREATED="1485265817060" MODIFIED="1485265833145"/>
<node TEXT="for small (countable) finite action-space" ID="ID_1292322360" CREATED="1485266696604" MODIFIED="1485266772586"/>
<node TEXT="overcome problems with" ID="ID_475601662" CREATED="1485266794493" MODIFIED="1485266804609">
<node TEXT="high-variance gradients of actor-only" ID="ID_882545660" CREATED="1485266804612" MODIFIED="1485266894392"/>
<node TEXT="the introducction of more tunning params" ID="ID_846609465" CREATED="1485266897569" MODIFIED="1485266925977">
<node TEXT="learning rates on actor-critic" ID="ID_467660655" CREATED="1485266942799" MODIFIED="1485266952662"/>
</node>
</node>
</node>
<node TEXT="AC" ID="ID_956873457" CREATED="1485278276744" MODIFIED="1485278282949">
<node TEXT="quasi-stationary MDP model" ID="ID_653224296" CREATED="1485278282952" MODIFIED="1485278332992"/>
</node>
<node TEXT="A-only" ID="ID_555266910" CREATED="1485278355395" MODIFIED="1485278362456">
<node TEXT="for non-stationary fast changing environment" ID="ID_789745678" CREATED="1485278362458" MODIFIED="1485278393166">
<node TEXT="cause critic is not able to provide useful info to the actor" ID="ID_1699588483" CREATED="1485278428134" MODIFIED="1485278507102"/>
</node>
</node>
</node>
</node>
</node>
</map>
