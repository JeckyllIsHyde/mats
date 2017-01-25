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
<hook NAME="MapStyle">

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
