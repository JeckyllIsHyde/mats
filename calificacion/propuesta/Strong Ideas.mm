<map version="freeplane 1.3.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Strong Ideas" ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1473197527649"><hook NAME="MapStyle" zoom="0.75">
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
<hook NAME="AutomaticEdgeColor" COUNTER="4"/>
<font SIZE="14" BOLD="true"/>
<node TEXT="Dynamic motor primitives" POSITION="right" ID="ID_1990593429" CREATED="1471737568820" MODIFIED="1473070937511" HGAP="146" VSHIFT="-350">
<edge COLOR="#ff00ff"/>
<hook NAME="FreeNode"/>
<node TEXT="Rhythmic" ID="ID_423242598" CREATED="1471737931005" MODIFIED="1471739504002"/>
<node TEXT="Discrete" ID="ID_1429669836" CREATED="1471737943477" MODIFIED="1471739529395"/>
</node>
<node TEXT="Neuromuscular model" POSITION="right" ID="ID_340652323" CREATED="1471737493923" MODIFIED="1472327569491" HGAP="80" VSHIFT="40">
<edge COLOR="#0000ff"/>
<node TEXT="Neuronal" ID="ID_1075105876" CREATED="1472727195333" MODIFIED="1472727209017">
<node TEXT="Reflexes" ID="ID_1970645041" CREATED="1472727280655" MODIFIED="1472727284924">
<node TEXT="Propioceptors" ID="ID_444189026" CREATED="1472178243020" MODIFIED="1472178359224">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_532318946" STARTINCLINATION="124;0;" ENDINCLINATION="124;0;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<node TEXT="anatomical angles" ID="ID_367692793" CREATED="1472178412754" MODIFIED="1472178420660"/>
</node>
<node TEXT="Exteroceptive" ID="ID_1977929648" CREATED="1472178264345" MODIFIED="1472728200913">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_532318946" STARTINCLINATION="112;0;" ENDINCLINATION="112;0;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<node TEXT="inertial angles" ID="ID_1544532605" CREATED="1472178430786" MODIFIED="1472178436387"/>
</node>
</node>
<node TEXT="CPGs" ID="ID_409110524" CREATED="1472727344355" MODIFIED="1472727348626"/>
<node TEXT="MLR" ID="ID_1986450020" CREATED="1472727349357" MODIFIED="1472727357040"/>
<node TEXT="Basal Ganglia" ID="ID_1175804552" CREATED="1472727357838" MODIFIED="1472727368995"/>
<node TEXT="Cerebellum" ID="ID_171383550" CREATED="1472727373680" MODIFIED="1472727381163"/>
</node>
<node TEXT="Muscular" ID="ID_630232390" CREATED="1472727221385" MODIFIED="1472727229214">
<node TEXT="MTU (Hill&apos;s Model)" ID="ID_277785643" CREATED="1472727231172" MODIFIED="1472833942742"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Geyer2003,Haeufle2012}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Models" ID="ID_129883036" CREATED="1472327067661" MODIFIED="1472727732037">
<node TEXT="Taga&apos;s model" ID="ID_1838012946" CREATED="1472727735196" MODIFIED="1472727750522"/>
<node TEXT="Geyer&apos;s model" ID="ID_1881450575" CREATED="1472727751842" MODIFIED="1472727756073"/>
<node TEXT="Manoonpong&apos;s model" ID="ID_362074072" CREATED="1472727756987" MODIFIED="1472727767637"/>
<node TEXT="Marques and IIda&apos;s model" ID="ID_1899795061" CREATED="1472727768771" MODIFIED="1472727788026"/>
</node>
</node>
<node TEXT="Reinforcement Learning" POSITION="left" ID="ID_700389203" CREATED="1471737584233" MODIFIED="1473197433438" HGAP="80" VSHIFT="-100">
<edge STYLE="sharp_bezier" COLOR="#00ffff" WIDTH="1"/>
<cloud COLOR="#cdf4ed" SHAPE="ARC"/>
<node TEXT="Classification" ID="ID_356109592" CREATED="1472399005193" MODIFIED="1472399027635">
<node TEXT="(VI) Q-learning" ID="ID_1518216321" CREATED="1471817435153" MODIFIED="1473032976867">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_1412166523" STARTINCLINATION="115;0;" ENDINCLINATION="115;0;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<node TEXT="Fuzzy Q-Learning FQL" ID="ID_1139486464" CREATED="1472746446030" MODIFIED="1472746459631"/>
<node TEXT="Deep Q-Learning DQL" ID="ID_1355456962" CREATED="1472746460730" MODIFIED="1472746479536"/>
</node>
<node TEXT="(PI) SARSA" ID="ID_1779997369" CREATED="1471817441930" MODIFIED="1473033005128">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_1412166523" STARTINCLINATION="128;0;" ENDINCLINATION="128;0;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
</node>
<node TEXT="(PS) Policy Search" ID="ID_1039442639" CREATED="1471817451986" MODIFIED="1473033885123">
<node TEXT="Critic-only" ID="ID_1412166523" CREATED="1471982362007" MODIFIED="1473033022381"/>
<node TEXT="Actor-only" ID="ID_1617013073" CREATED="1471982371209" MODIFIED="1473033033839">
<node TEXT="REINFORCE" ID="ID_842825095" CREATED="1473033045786" MODIFIED="1473033050041"/>
<node TEXT="PGPE" ID="ID_102183101" CREATED="1473033050669" MODIFIED="1473033061083"/>
</node>
<node TEXT="Actro-Critic" ID="ID_941737240" CREATED="1471982377784" MODIFIED="1472057999360">
<node TEXT="Gradient-free" ID="ID_1728142867" CREATED="1471993937091" MODIFIED="1472058053864"/>
<node TEXT="Gradient-based" ID="ID_1202188315" CREATED="1472057948062" MODIFIED="1472057971746">
<node TEXT="Standard or Vanilla" ID="ID_1009366964" CREATED="1472058010472" MODIFIED="1472398415532">
<node TEXT="FACRLN" ID="ID_1580071663" CREATED="1472770822398" MODIFIED="1472771701314"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Wang2007,Cheng2004}
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="DDPG Deep" ID="ID_1432184508" CREATED="1474818124663" MODIFIED="1474818254017"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Duan2016}
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="SPSA" ID="ID_1882910099" CREATED="1473033975869" MODIFIED="1474818224045"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Christensen2014,Grondman2012,Sehnke2010}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Natural" ID="ID_1339151529" CREATED="1472058031458" MODIFIED="1472398421229">
<hook NAME="FirstGroupNode"/>
<node TEXT="eNAC" ID="ID_1791681479" CREATED="1472767267036" MODIFIED="1472767281240"/>
</node>
</node>
</node>
</node>
</node>
<node TEXT="Challenges" ID="ID_880608625" CREATED="1472399046499" MODIFIED="1472399057432">
<node TEXT="Exploitation-Exploration dilema" ID="ID_937866458" CREATED="1472399059382" MODIFIED="1472399076488">
<node TEXT="$\epsilon$-greedy" ID="ID_1934290860" CREATED="1472399104416" MODIFIED="1472399215533" FORMAT="latexPatternFormat"/>
<node TEXT="Boltzmann" ID="ID_1170117378" CREATED="1472399133521" MODIFIED="1472399163953"/>
<node TEXT="Expectation-Maximization EM" ID="ID_118579721" CREATED="1472399144614" MODIFIED="1472399157206">
<node TEXT="PoWER" ID="ID_1389021215" CREATED="1472767288820" MODIFIED="1472767295798"/>
</node>
<node TEXT="Curiosity" ID="ID_1056460300" CREATED="1473698886270" MODIFIED="1473698890150">
<node TEXT="Deep Bayesian Networks" ID="ID_545835589" CREATED="1473698902834" MODIFIED="1473699426376"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Houthooft2016}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node TEXT="Course of dimensionality" ID="ID_780478624" CREATED="1472399077007" MODIFIED="1472399084919"/>
<node TEXT="High variance gradient stimates" ID="ID_39997182" CREATED="1473032510921" MODIFIED="1473032526580"/>
<node TEXT="Reward signal design" ID="ID_139881342" CREATED="1472828462025" MODIFIED="1472829795080">
<node TEXT="Inverse Reinforcement Learning" ID="ID_1671626175" CREATED="1472666433828" MODIFIED="1472666445596">
<node TEXT="Learning Locomotion Rewards" ID="ID_793059597" CREATED="1472728652186" MODIFIED="1472746546795">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_790568083" STARTINCLINATION="688;1018;" ENDINCLINATION="899;468;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<node TEXT="Example of optimal rewards" ID="ID_1418076320" CREATED="1473194499976" MODIFIED="1481646400263">
<icon BUILTIN="image"/>
<richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <a href="images/Park2010ExampleRewardsFcnsIRL.png"><img src="images/Park2010ExampleRewardsFcnsIRL.png" width="198" height="121"/>
</a>  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Approaches" ID="ID_1746611056" CREATED="1473690101761" MODIFIED="1473690110101">
<node TEXT="Maximum Entropy" ID="ID_695438538" CREATED="1473690111429" MODIFIED="1473690134359"/>
<node TEXT="GPIRL" ID="ID_1172090867" CREATED="1473690135620" MODIFIED="1473690143033"/>
<node TEXT="Deep Learning" ID="ID_1074881517" CREATED="1473690429712" MODIFIED="1473690439735"/>
</node>
</node>
<node TEXT="Motivacion" ID="ID_1174185753" CREATED="1472828485354" MODIFIED="1472828491802">
<node TEXT="Intrinsic" ID="ID_581261391" CREATED="1472828497489" MODIFIED="1472828510969">
<node TEXT="Information-driven" ID="ID_1546258287" CREATED="1473010002676" MODIFIED="1473010012601"/>
</node>
<node TEXT="Extrinsic" ID="ID_1120662620" CREATED="1472828511678" MODIFIED="1472828514970"/>
</node>
</node>
</node>
</node>
<node TEXT="Control" POSITION="left" ID="ID_1416953666" CREATED="1472327202939" MODIFIED="1472327225132" HGAP="140" VSHIFT="10">
<edge COLOR="#007c00"/>
<node TEXT="Model-base" ID="ID_1781940090" CREATED="1472327279717" MODIFIED="1472433943754">
<font SIZE="10"/>
<node TEXT="Hybrid zero dynamics" ID="ID_933581275" CREATED="1472327298511" MODIFIED="1472327327470"/>
<node TEXT="Passivity-Based Control" ID="ID_1615649105" CREATED="1472327327995" MODIFIED="1472327387933"/>
</node>
<node TEXT="Moldel-free" ID="ID_428692507" CREATED="1472327289531" MODIFIED="1472680142986">
<font SIZE="10"/>
<node TEXT="Robust Control" ID="ID_1969728467" CREATED="1472327397354" MODIFIED="1472327401753">
<node TEXT="Sliding-mode Control" ID="ID_170993312" CREATED="1472327404045" MODIFIED="1472666374711" HGAP="25" VSHIFT="5"/>
<node TEXT="Jaconbian-based Control" ID="ID_1005432623" CREATED="1472327473586" MODIFIED="1472327484497"/>
<node TEXT="$H_\infty$" ID="ID_466428939" CREATED="1472666500584" MODIFIED="1472666548796" FORMAT="latexPatternFormat"/>
<node TEXT="LMI (Sellami2015a)" ID="ID_1097991065" CREATED="1472729038132" MODIFIED="1472729129680"/>
<node TEXT="ADRC" ID="ID_314145238" CREATED="1472697739623" MODIFIED="1472697744238">
<node TEXT="GPI" ID="ID_1694103867" CREATED="1472697753858" MODIFIED="1472697757126"/>
</node>
</node>
<node TEXT="Optimal Control" ID="ID_504216939" CREATED="1472666384818" MODIFIED="1472728306468">
<node TEXT="Deterministic" ID="ID_737690218" CREATED="1472666400176" MODIFIED="1472666411636"/>
<node TEXT="Stochastic" ID="ID_1579787407" CREATED="1472666412273" MODIFIED="1472666417028"/>
<node TEXT="Inverse" ID="ID_584012806" CREATED="1472666419674" MODIFIED="1472765705437"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Mombaur2010}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node TEXT="Model-learning" ID="ID_691785228" CREATED="1472398250122" MODIFIED="1472398254755"/>
</node>
<node TEXT="Morphological computation" POSITION="right" ID="ID_317814592" CREATED="1471737614136" MODIFIED="1473012587804" VSHIFT="80">
<edge COLOR="#ffff00"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Expoiting environmental and morphological properties are an important featues of embodied systmems. The main reason is that it allows to significantly reduce the controller complexity \cite{Ghazi-Zahedi2015a}.
    </p>
    <p>
      
    </p>
    <p>
      Transferred to robotics, this means that systems with high morphological computation only need to generate motor com- mands when they are needed. Not only does such a control increase the durability of the systems (because thewear-out of the actuators is decreased), it alsomeans that robotswithhighMCwill have a reduced energy demand for their actuation (e.g., Niiyama et al. (2012) andRenjewski et al. (2015)).By outsourcing computa- tion to the embodiment, the controller complexity, and hence, the computational cost can be reduced,which again contributes to the overall reduction of the energy consumption.
    </p>
    <p>
      
    </p>
    <p>
      To summarize, increasing MC for a robotic system potentially decreases the overall energy demand, the controller complexity, and finally also the wear-out of the system.
    </p>
    <p>
      
    </p>
    <p>
      MC does not contribute to the energy efficiency (running is not energy efficient), but it is required to enable the behavior. We believe thatmaximizingMC coversmore than just energy efficiency (fast adaptivity inuncertain environments is one example), but that this is an immediate benefit in the field of robotics.
    </p>
    <p>
      
    </p>
    <p>
      When hunting prey or escaping from a predator, adaptivity to irregularities in the environment throughmorphological properties is a clear evolutionary advantage. Therefore, MC may be a driving force in evolution.
    </p>
    <p>
      
    </p>
    <p>
      Muscles improvemovement stability in comparison to torque driven models (van Soest and Bobbert, 1993) or simplified linearized muscle models (see (Haeufle et al., 2012)). In hopping movements, non-linear muscles reduce the control effort (amount of information required to control themovement) by a factor of approximately 20 in comparison to a DC-motor drivenmovement (Haeufle et al., 2014).
    </p>
    <p>
      
    </p>
    <p>
      Meassure MC: \cite{Hauser2012b,Polani2011,Ruckert2012}. In our previous work, we have focused on a direct quantification of the embodiment, whereasmost other approaches quantify MC indirectly through the controller complexity.
    </p>
    <p>
      
    </p>
    <p>
      The main contribution of this publication is to evaluate two measures of MC on biologically realistic hopping models. With this, we want to demonstrate their applicability in non-trivial, realistic scenarios. Based on our previous findings (see above),we hypothesize thatMC is higher in hoppingmovements driven by a non-linearmuscle compared to those driven by a simplified linear muscle or a DC-motor.
    </p>
    <p>
      
    </p>
    <p>
      Entropy++ on github.
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Information theory" ID="ID_671604546" CREATED="1471817487032" MODIFIED="1472327565199" HGAP="50" VSHIFT="-20">
<node TEXT="Entropy" ID="ID_168626147" CREATED="1472398334051" MODIFIED="1472834418672"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Haeufle2014}
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="Predictive information" ID="ID_1117695860" CREATED="1472398337939" MODIFIED="1473030356248"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Zahedi2013} The main focus of this work is the second question, which
    </p>
    <p>
      dealswith finding a first principled IRF.We propose the predictive information (PI) (Bialek et al., 2001) for the following reasons. Information-driven self-organization, by the means of maximiz- ing the one-step approximation of the PI has proved to produce a coordinated behavior among physically coupled but otherwise independent agents (Ay et al., 2008; Zahedi et al., 2010).
    </p>
    <p>
      
    </p>
    <p>
      The predictive information (PI) (Bialek et al., 2001), which is also known as excess entropy (Crutchfield and Young, 1989)and effective measure complexity (Grassberger, 1986) is defined as the mutual information of the entire past and future of the sensor data stream
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="Maximum Entropy" ID="ID_790568083" CREATED="1472728701520" MODIFIED="1472728710114"/>
<node TEXT="KL-Divergence or relative entropy" ID="ID_1780531076" CREATED="1473073387778" MODIFIED="1473073459601"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{MacKay2005}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Self-organzation" ID="ID_733538556" CREATED="1472727402199" MODIFIED="1473012587802" HGAP="73" VSHIFT="53">
<node TEXT="(G. Marques, F. Iida)" ID="ID_321792239" CREATED="1472727420578" MODIFIED="1472727465741"/>
<node TEXT="Reservoirs" ID="ID_398221697" CREATED="1472727477416" MODIFIED="1472727534184"/>
<node TEXT="Deep Learining LSTM" ID="ID_212331070" CREATED="1472727972510" MODIFIED="1472727984071"/>
</node>
<node TEXT="Sensorimotor-loop (Ay)" ID="ID_532318946" CREATED="1471746653844" MODIFIED="1473011508466" HGAP="60" VSHIFT="50">
<node TEXT="Application" ID="ID_1088180038" CREATED="1473011547473" MODIFIED="1473011551083">
<node TEXT="Playfull machines" ID="ID_1746930622" CREATED="1471746637328" MODIFIED="1472327537621" HGAP="40" VSHIFT="60">
<node TEXT="Position sensors" ID="ID_636480157" CREATED="1473022534350" MODIFIED="1473022543504">
<node TEXT="Thrist for information" ID="ID_314989587" CREATED="1473023010616" MODIFIED="1473023020358"/>
</node>
<node TEXT="Velocity sensors and directed movements" ID="ID_457166603" CREATED="1473022544004" MODIFIED="1473022894159">
<node TEXT="Jumping" ID="ID_35854006" CREATED="1473022986161" MODIFIED="1473022991493"/>
<node TEXT="Forward" ID="ID_1956736586" CREATED="1473022992053" MODIFIED="1473022995143"/>
<node TEXT="Turning" ID="ID_526411794" CREATED="1473022995826" MODIFIED="1473022998378"/>
</node>
</node>
<node TEXT="Stumpy (H Hauser)" ID="ID_148760265" CREATED="1472728058792" MODIFIED="1472728157131"/>
<node TEXT="CPG as sensor predictors" ID="ID_1057217637" CREATED="1472728266104" MODIFIED="1472728284893"/>
</node>
<node TEXT="Models" ID="ID_1872263389" CREATED="1473011573437" MODIFIED="1473012447387">
<node TEXT="Causal model for reactive systems" ID="ID_1100499351" CREATED="1473011579159" MODIFIED="1473012523493" HGAP="36" VSHIFT="62">
<node TEXT="Graphic" ID="ID_1497694159" CREATED="1473012383753" MODIFIED="1473195289611">
<icon BUILTIN="image"/>
<richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <a href="images/Ghazi-Zahedi2015aCausalModel_sensorimotor_loop.png"><img src="images/Ghazi-Zahedi2015aCausalModel_sensorimotor_loop.png" width="202" height="80"/>
</a>  </body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
<node TEXT="Quantifing for" ID="ID_740078777" CREATED="1473069821780" MODIFIED="1473070904523"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      \cite{Zahedi2013a}
    </p>
  </body>
</html>
</richcontent>
<node TEXT="exploting dynamics" ID="ID_505091025" CREATED="1473070789205" MODIFIED="1473070800426">
<node TEXT="Natrual Dynamics" ID="ID_249435101" CREATED="1473071184780" MODIFIED="1473071193523"/>
</node>
<node TEXT="outsourcing control" ID="ID_1778837094" CREATED="1473070801559" MODIFIED="1473070813346"/>
<node TEXT="environment-morphology relation" ID="ID_1876171965" CREATED="1473070871260" MODIFIED="1473070886403"/>
</node>
</node>
<node TEXT="Multibody Simulation" POSITION="left" ID="ID_263848003" CREATED="1472398023441" MODIFIED="1472398127297" HGAP="10" VSHIFT="80">
<edge COLOR="#7c7c00"/>
<node TEXT="Multi-physics-based" ID="ID_1177540502" CREATED="1472398077154" MODIFIED="1472666623191" HGAP="60" VSHIFT="-20">
<node TEXT="Port-Hamiltonians PH" ID="ID_817373460" CREATED="1472399554954" MODIFIED="1472666623190" HGAP="43"/>
<node TEXT="Screw-based PH-dynamic model" ID="ID_1157621143" CREATED="1471739539485" MODIFIED="1472666617589" HGAP="30" VSHIFT="8"/>
</node>
<node TEXT="Constraints" ID="ID_1792885456" CREATED="1472398084059" MODIFIED="1472398138417">
<node TEXT="Ground" ID="ID_1647381443" CREATED="1472398144358" MODIFIED="1472398147509"/>
<node TEXT="Friction-model" ID="ID_860036596" CREATED="1472398147973" MODIFIED="1472398164530"/>
<node TEXT="Virtual constraints" ID="ID_1473526977" CREATED="1472398165601" MODIFIED="1472398177872"/>
</node>
<node TEXT="Screw Theory algorithms" ID="ID_1263548458" CREATED="1472399515849" MODIFIED="1472399545047"/>
<node TEXT="Kane&apos;s equations" ID="ID_1393578038" CREATED="1473698739339" MODIFIED="1473698748464"/>
</node>
<node TEXT="Central patern generators" POSITION="left" ID="ID_7163652" CREATED="1471737532411" MODIFIED="1473710895826" HGAP="-46" VSHIFT="-41">
<edge COLOR="#ff00ff"/>
<font SIZE="10"/>
<node TEXT="Oscillators" ID="ID_105891698" CREATED="1472398490854" MODIFIED="1472398502205">
<node TEXT="Hopf" ID="ID_432210927" CREATED="1471817548367" MODIFIED="1472398510666" HGAP="30" VSHIFT="10"/>
<node TEXT="Kuramoto" ID="ID_1158235353" CREATED="1471817543111" MODIFIED="1471817547636"/>
<node TEXT="Van der Pol" ID="ID_288240825" CREATED="1472398571446" MODIFIED="1472398580659"/>
<node TEXT="Rayleigh" ID="ID_1550668910" CREATED="1472398581366" MODIFIED="1472398641744"/>
<node TEXT="Morphed oscillators" ID="ID_1529046803" CREATED="1472742431718" MODIFIED="1472742442972"/>
</node>
<node TEXT="Neural Oscillators" ID="ID_346406089" CREATED="1472398538570" MODIFIED="1472398558092">
<node TEXT="Artifitial-based" ID="ID_1432517879" CREATED="1471817537853" MODIFIED="1472398770617">
<node TEXT="Matsuoka" ID="ID_1622641981" CREATED="1472398754069" MODIFIED="1472398758926"/>
</node>
<node TEXT="Natural-based" ID="ID_1067789880" CREATED="1472398771301" MODIFIED="1472398777125">
<node TEXT="Holmes" ID="ID_1815067338" CREATED="1472398780448" MODIFIED="1472398787774"/>
</node>
</node>
<node TEXT="Types" ID="ID_386760561" CREATED="1472575802895" MODIFIED="1472575805429">
<node TEXT="Half-center" ID="ID_848860730" CREATED="1472575807029" MODIFIED="1472575811701"/>
</node>
<node TEXT="Structure" ID="ID_1607060451" CREATED="1472742933510" MODIFIED="1472742938660">
<node TEXT="Pattern Generation" ID="ID_1928466153" CREATED="1472742940312" MODIFIED="1472742949164"/>
<node TEXT="Rhythm Generation" ID="ID_736962630" CREATED="1472742950094" MODIFIED="1472742994325"/>
</node>
</node>
</node>
</map>
