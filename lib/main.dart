import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(LernAppChemie());

class LernAppChemie extends StatefulWidget {
  const LernAppChemie({super.key});

  @override
  _LernAppChemieState createState() => _LernAppChemieState();
}

class _LernAppChemieState extends State<LernAppChemie> {
  int aktuellerModus = 0; // 0 = Lernkarten, 1 = Quiz, 2 = Quellen

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lernapp Chemie',
      home: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(title: Text('Lernapp Anorganische Chemie')),
        body: aktuellerModus == 0 ? LernkartenAnsicht() : aktuellerModus == 1 ? QuizAnsicht() : QuellenScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: aktuellerModus,
          onTap: (index) {
            setState(() {
              aktuellerModus = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Lernkarten'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
            BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Quellen'),
          ],
        ),
      ),
    );
  }
}

// 📚 Lernkarten-Ansicht
class LernkartenAnsicht extends StatefulWidget {
  const LernkartenAnsicht({super.key});

  @override
  _LernkartenAnsichtState createState() => _LernkartenAnsichtState();
}

class _LernkartenAnsichtState extends State<LernkartenAnsicht> {
  final Map<String, List<Map<String, dynamic>>> kapitelKarten = {
    'Einführung und PSE': [
		{'frage': 'Vergleich der Atomradien mit den Radien der stabilsten Ionen', 
		'antwort': 'Kationen der ersten zwei Hauptgruppen sind deutlich kleiner als ihre neutrale atomare Form. \n'
		'Anionen der sechsten und siebten Hauptgruppe sind deutlich größer als ihre atomare Form. ', 'gemerkt': false},
		
		{'frage': 'Die Entstehung des Periodensystems',
		'antwort': 'Das Periodensystem wurde 1869 von Dmitri Mendelejev erstmals veröffentlicht. ' 
		'Es bestand aus den damals bekannten 63 Elementen, die nach Atommasse aufsteigend angeordnet waren. ' 
		'Es enthielt noch Lücken für unbekannte Elemente, deren Eigenschaften Mendelejev bereits vorhersagen konnte. '
		'Unabhänig davon entwickelte Lothar Meyer ebenfalls das Periodensystem, welches er kurz nach Mendelejev veröffentlichte. \n'
		'Seither wurde das PSE immer weiter ergänzt. ', 'gemerkt': false},
		
		{'frage': 'Die Ordnungszahl',
		'antwort': 'Die Elemente werden nach ihrer Kernladungszahl angeordnet. Die Kernladungszahl enspricht dabei der Anzahl der Protonen im Atomkern. ' 
		'Da die Anordnung nach der Kernladungszahl erfolgt, nennt man diese auch Ordnungszahl. ', 'gemerkt': false},
		
		{'frage': 'Anzahl der Elemente',
		'antwort': 'Bisher sind 118 verschiedene Elemente bekannt. 94 natürlich vorkommende Elemente wurden bislang entdeckt. ' 
		'Die Elemente höherer Ordnungszahl konnten bisher nicht natürlich vorgefunden werden. '
		'Sie werden im Labor synthetisiert. \n'
		'Nicht alle Elemente besitzen ein stabiles Nuklid, sodass einige natürlich vorkommende Elemente die Zerfallsprodukte anderer sind. ', 'gemerkt': false},
		
		{'frage': 'Isotope',
		'antwort': 'Isotope sind unterschiedliche Ausprägungen des selben Elements. Sie unterscheiden sich in der Anzahl der Neutronen. '
		'Da auch die Neutronen zu der Masse des Atoms beitragen, kommen daher Atome unterschiedlicher Massen des selben Elements vor. '
		'Die im Periodensystem angegebene Massenzahl entspricht daher dem gewichteten Mittelwert aller Isotope eines Elements. \n'
		'Die Isotope eines Elements kommen nicht in der selben Menge vor. Bei den meisten Elementen gibt es ein besonders stabiles Isotop, '
		'das hauptsächlich vorkommt. Manche Isotope sind so instabil, dass sie radioaktiv zerfallen. \n'
		'Nur wenige Elemente sind Reinelemente, das heißt sie haben nur ein natürliches Isotop. ', 'gemerkt': false},
		
		{'frage': 'Perioden',
		'antwort': 'Das Periodensystem ist nach heutigem Wissen in sieben Zeilen aufgebaut. Diese Zeilen werden als Perioden bezeichnet. '
		'Diese entsprechen den Hauptquantenzahlen mit ihren Orbitalen. Die Ordnungszahlen steigen von links nach rechts auf, '
		'da die Anzahl der Protonen und Elektronen im Atom ansteigt. Die Eigenschaften der Elemente innerhalb einer Periode sind sehr verschieden.', 'gemerkt': false},
		
		{'frage': 'Die Orbitale',
		'antwort': 'Aus den Lösungen der Schrödiger-Gleichung entstehende Wahrscheinlichkeitsverteilungen der Elektronen um den Atomkern.  ', 'gemerkt': false},
		
		{'frage': 'Die Gruppen',
		'antwort': 'Die Spalten im Periodensystem werden als Gruppen bezeichnet.\nEs gibt acht Hauptgruppen. Die aus dem s- und dem p-Block bestehen.\n'
		'Zudem gibt es zehn Nebengruppen im d-Block und 14 Nebengruppen im f-Block (Lanthanoide und Actinoide). \n'
		'Die Elemente einer Gruppe weißen ähnliche chemische Eigenschaften auf, da die Anzahl der Valenzelektronen hierfür bestimmend ist. '
		'Die Elemente einer Gruppe besitzen die gleiche Valenzelektronenkonfiguration.', 'gemerkt': false},
		
		{'frage': 'Die Ionisierungsenergie',
		'antwort': 'Die Elektronen eines Atoms lassen sich durch Energiezufuhr entfernen. Das erste Elektron lässt sich noch mit einer vergleichsmäßig geringen '
		'Energiezufuhr entfernen in Relation zu den weiteren Elektronen. Jedes entfernte Elektron destabilisiert das Ion weiter, da die Ladungsungleichheit '
		'weiter ansteigt. Die Protonen im Kern bleiben erhalten. \nDie Atome einer Gruppe lassen sich ähnlich gut oder schlecht Ionisieren. '
		'Je höher die Hauptgruppennummer, desto mehr Energie muss zugeführt werden. Die Edelgaskonfiguration ist erstrebenswert, da sie am energetisch günstigsten ist. \n'
		'Die Ionisierungsenergie beschreibt daher die Menge an Energie, die zugeführt werden muss, um das Atom zu ionisieren.', 'gemerkt': false},
		
		{'frage': 'Metallischer Charakter',
		'antwort': 'Metalle besitzen einige typische charakteristische Eigenschaften. \n'
		'Metalle sind meist glänzend, da sie das Licht reflektieren. Metalle weißen eine gute Leitfähigkeit von Wärme und elektrischer Energie auf. '
		'Mit steigender Temperatur dehnen sich Metalle aus. Viele Metalle sind duktil und lassen sich gut verformen. ', 'gemerkt': false},
		
		{'frage': 'Die Elektronegativität',
		'antwort': 'Die Elektronegativität ist ein Maß für das Ziehen, der Atome in einer Verbindung, an den Bindungselektronen. \n'
		'Die elektronegativsten Elemente sitzen oben rechts im Periodensystem. Das elektronegativste Element ist Fluor, gefolgt von Sauerstoff, Stickstoff und Chlor. \n'
		'Die Differenz der Elektronegativitäten der beteiligten Atome einer Verbindung bestimmt die Art der Bindung. \n'
		'Im Allgemeinen ergeben sich folgende ungefähre Tendenzen: Bei einer Differenz von weniger als 0,4 bildet sich eine unpolare Bindung aus. '
		'Bei einer Differenz zwischen 0,4 und 1,6 wir die Bindung einen polaren Charakter aufweisen, ab 1,7 wird die Bindung zunehmend ionischer.', 'gemerkt': false},

		{'frage': 'Grundprinzip Molekülorbitaltheorie (MO-Theorie)',
		'antwort': 'Molekülorbitale bilden sich indem sich Atomorbitale überlappen. Diese sind delokalisiert. '
		'Die Molekülorbitale werden nach dem Pauli‑Prinzip und der Hund‑Regel mit Elektronen gefüllt.\n'
		'Es gibt σ- und π-Molekülorbitale:\n'
		'- σ: Elektronendichte entlang der Kernverbindungsachse, rotationssymmetrisch\n'
		'- π: Elektronendichte oberhalb/unterhalb der Achse, entstehen aus seitlicher Überlappung\n'
		'Es gibt bindende und antibindende Molekülorbitale:\n'
		'- Bindend (σ, π): konstruktive Überlappung, erhöhte Elektronendichte zwischen den Kernen, energieärmer\n'
		'- Antibindend (σ*, π*): destruktive Überlappung, Knotenebene zwischen den Kernen, energiereicher', 'gemerkt': false},
		
		{'frage': 'Paramagnetische Moleküle oder diamagnetische Moleküle',
		'antwort': 'Sind in den Molekülorbitalen ungepaarte Elektronen vorhanden, ist das Molekül paramagnetisch.\n'
		'Liegen in den Molekülorbitalen alle Elektronen gepaart vor, ist das Molekül diamagnetisch.', 'gemerkt': false},
		
		{'frage': 'Die Knotenebene im Orbital',
		'antwort': 'Die Knotenebene ist der Bereich, in dem die Elektronen eine Aufenthaltswahrscheinlichkeit von null aufweisen.\n'
		'Mit steigender Knotenanzahl steigt auch die Energie.', 'gemerkt': false},
		
		{'frage': 'HOMO und LUMO',
		'antwort': 'HOMO (Highest Occupied Molecular Orbital): Höchst besetzte Molekülorbital: '
		'Enthält die Elektronen, die am einfachsten angeregt/ abgegeben werden können.\n'
		'LUMO (Lowest Unoccupied Molecular Orbital): Niedrigst unbesetzte Molekülorbital: '
		'Nimmt die angeregten Elektronen auf.', 'gemerkt': false},

	],

  'Alkalimetalle': [

    {'frage': 'Die Alkalimetalle',
		'antwort': 'Die Alkalimetalle umfassen die Elemente der ersten Hauptgruppe (IUPAC Gruppe 1). '
    'Diese Gruppe beinhaltet die Elemente Wasserstoff (H), Lithium (Li), Natrium (Na), Kalium (K), Rubidium (Rb), Caesium (Cs) und Francium (Fr).', 'gemerkt': false},
		
		{'frage': 'Massendefekt',
		'antwort': 'Der Massendefekt ist die Differenz zwischen der Summe aller Nukleonenmassen eines Atoms und der tatsächlichen Masse des Atoms. '
		'Ursächlich hierfür ist die freiwerdende Energie bei der Kernbindung. Da zwischen Energie und Masse eine Äquivalenzrelation besteht, '
		'entspricht der Massendefekt der freiwerdenden Energie. \n'
		'Da die Kernbindungskräfte deutlich stärker als die Elektronenanziehungskräfte sind, entspricht der Massendefekt der Kernbindungsenergie.', 'gemerkt': false}, 
		
		{'frage': 'Die Gitterenergie',
		'antwort': 'Die Gitterenergie ist die Energie, die freigesetzt wird, wenn bei 0 K ein Mol einer kristallinen Verbindung zusammengesetzt wird. '
		'Die Zusammensetzung erfolgt dabei aus den zuvor unendlich voneinander entfernten Bestandteilen (Atome, Moleküle, Ionen). ', 'gemerkt': false}, 
		
		{'frage': 'Die Elementarzelle',
		'antwort': 'Die Elementarzelle ist die kleineste Baueinheit eines Kristalls. '
		'Ein theoretischer Kristall besteht aus lückenlosen Aneinanderreihungen der immer gleichen Elementarzelle. '
		'Die Verteilung der Atome innerhalb der Elementarzelle ist dabei abhänig von den Größenrelationen der beteiligten Atome. '
		'Die Zuordung der Atome zu einer Zelle erfolgt dabei so, dass keine Stelle mehrfach besetzt ist. '
		'Daher werden die Atome an den Ecken der würfelförmigen Elementarzelle auch allen beteiligten acht Elementarzellen zugesprochen, '
		'sodass eine Zelle immer nur ein achtel des Atoms je Ecke zugesprochen bekommt. '
		'Besteht nun eine Elementarzelle nur aus den vier Atomen an den Ecken des Würfels, wird sie als kubisch bezeichnet '
		'und besitzt eine Wertigkeit von eins (acht Ecken mit je Wertigkeit ein achtel). \n' 
		'Befindet sich in der Mitte der Elementarzelle ein ganzes Atom, wird sie als kubisch-raumzentriert Bezeichnet. '
		'Eine kubisch-raumzentrierte Elementarzelle hat eine Wertigkeit von zwei (acht Ecken mit je Wertigkeit ein achtel und eines in der Mitte). \n'
		'Sitzen neben den Ecken auch Atome auf den Flächen des Würfels, wird die Zelle als kubisch-flächenzentriert bezeichent. '
		'Ein auf der Fläche sitzendes Atom ist zur Hälfte in der Elementarzelle vorhanden, daher ist die Wertigkeit bei dieser Bauart vier. \n'
		'Liegt die Elementarzelle als Hexagonalprisma vor, nennt man sie hexagonal dichtest gepackt. '
		'Dabei zählen die zwölf Atome der Ecken zu je einem sechstel, das auf jeder Hexagonseite liegende Atom zur Hälfte '
		'und die drei innerhalb des Prismas liegenden Atome vollständig, sodass insgesamt sechs Atome in einer hexagonal dichtest gepackten Kugelpackung vorzufinden sind. ', 'gemerkt': false},
		
		{'frage': 'Die Schmelzflusselektrolyse',
		'antwort': 'Die Gewinnung der Alkalimetalle erfolgt meist durch eine Schmelzflusselektrolyse ihrer Salze. '
		'Da Alkalimetalle ein deutlich negativeres elektrochemisches Potential als Wasser besitzen, ist eine Elektrolyse der wässrigen Lösungen nicht möglich. \n'
		'Das Salz wird aufgeschmolzen und die Metallkationen können an der Kathode zu elementarem Metall reduziert werden.', 'gemerkt': false},
		
		{'frage': 'Reaktionen der Alkalimetalle',
		'antwort': 'Alkalimetalle (Alm) reagieren mit Sauerstoff (O₂) zu Oxiden: 4Alm + O₂ → 2Alm₂O \n'
		'Kalium, Rubidium und Caesium reagieren mit Sauerstoff zu Superoxiden: K/ Rb/ Cs + O₂ → KO₂/ RbO₂/ CsO₂ \n'
		'Alkalimetalle (Alm) reagieren mit Wasserstoff (H₂) zu Hydriden: 2Alm + H₂ → 2AlmH \n'
		'Alkalimetalle (Alm) bilden mit Halogenen (X) Salze: 2Alm + X₂ → 2AlmX', 'gemerkt': false},
		
		{'frage': 'Das Solvay-Verfahren - die Herstellung von Soda',
		'antwort': 'Das Solvay-Verfahren ist ein großtechnisches Verfahren zur Herstellung von Soda (Natriumcarbonat, Na₂CO₃) '
		'aus Kochsalz (NaCl), Ammoniak (NH₃) und Kohlendioxid (CO₂). \nAmmoniak wird unter Kühlung in eine wässrige, gesättigte Natriumchlorid-Lösung eingeleitet. '
		'Die dabei entstehende Lauge wird mit Kohlendioxid gesättigt. Dabei entstehen in der Lösung aus Ammoniak und Kohlendioxid Ammoniumhydrogencarbonat (NH₄HCO₃). '
		'Das Ammoniumhydrogencarbonat reagiert mit dem Natriumchlorid und Natriumhydrogencarbonat (NaHCO₃) fällt aus. '
		'Das ausgefallene Natriumhydrogencarbonat wird abfiltriert und erhitzt, dabei zerlegt es sich in das gewünschte Natriumcarbonat, '
		'desweiteren entstehen Wasser und Kohlendioxid. \n'
		'NH₃ + CO₂ + H₂O → NH₄HCO₃ \n' 
		'NH₄HCO₃ + NaCl → NH₄Cl + NaHCO₃ \n' 
		'2NaHCO₃ → Na₂CO₃ + H₂O + CO₂', 'gemerkt': false},
		
		{'frage': 'Die Herstellung von Natronlauge',
		'antwort': 'Natronlauge wird industriell durch Elektrolyse einer wässrigen Lösung von Natriumchlorid hergestellt. \n'
		'Dabei ist es wichtig, dass die Elektrodenbereiche voneinander getrennt werden, da ansonsten unerwünschte Nebenreaktionen ablaufen würden. '
		'Zur Trennung beider Bereiche eignet sich eine kationenpermeable Membran. Auch der Gasraum muss vollständig voneinander getrennt werden. \n' 
		'Wird Spannung auf die Elektroden gegeben laufen folgende Reaktionen ab: \n' 
		'Kathode: 2H₂O + 2e⁻ → H₂↑ + 2OH⁻ \n' 
		'Anode: 2NaCl → 2Na⁺ + Cl₂↑ + 2e⁻ \n' 
		'Gesamt: 2H₂O + 2NaCl → H₂↑ + 2NaOH + Cl₂↑ ', 'gemerkt': false},
		
		{'frage': 'Nachweise für Alkalimetalle im Labor',
		'antwort': 'Im Labor werden Alkalimetalle meist durch eine Flammenfärbung nachgewießen. \n' 
		'Dabei wird eine kleine Menge der Probe in eine Flamme gegeben. \n'
		'Beim Erhitzen werden Elektronen angeregt, unter Photonenabgabe fallen sie in den Grundzustand zurück. '
		'Die Lichtemission hat eine element-charakteristische Farbe. \n'
		'Lithium: rot, Natrium: gelb, Kalium: violett, Rubidium: rot-violett, Caesium: blau-violett', 'gemerkt': false},
			
	],

  'Erdalkalimetalle': [

    {'frage': 'Die Erdalkalimetalle',
		'antwort': 'Die Erdalkalimetalle befinden sich in der zweiten Hauptgruppe (IUPAC Gruppe 2). '
    'Diese Gruppe umfasst die Elemente Beryllium (Be), Magnesium (Mg), Calcium (Ca), Strontium (Sr), Barium (Ba) und Radium (Ra).', 'gemerkt': false},
	
		{'frage': 'Gruppeneigenschaften der Erdalkalimetalle',
		'antwort': 'Alle Elemente der Erdalkalimetalle sind typische Metalle und liegen bevorzugt in der Oxidationsstufe +2 vor.\n'
		'Erdalkalimetalle bilden Oxide mit Sauerstoff.\n'
		'Sie reagieren mit Stickstoff zu Nitriden mit einer Summenformel von Me₃N₂.\n'
		'Einige Erdalkalimetalle bilden in Wasser Hydroxide aus. Me + H₂O → Me(OH)₂ + H₂↑\n'
		'Mit steigender Ordnungszahl nimmt der basische Charakter der Hydroxide zu.\n'
		'Mit steigender Ordnungszahl nimmt zudem die Stabilität der Carbonate und Nitrate zu.', 'gemerkt': false},
		
		{'frage': 'Die Darstellung der Erdalkalimetalle',
		'antwort': 'Beryllium und Barium werden durch Reduktionen gewonnen.\n'
		'Beryllium: BeF₂ + Mg → Be + MgF₂\n'
		'Barium: 3 BaO + 2 Al → Al₂O₃ + 3 Ba oder 3 BaO + Si → BaSiO₃ + 2 Ba\n'
		'Magnesium, Calcium und Strontium werden durch Schmelzflusselektrolyse gewonnen. '
		'Magnesium wird dabei aus MgCl₂, Calcium und Strontium ebenfalls aus den Chloriden in einer Mischung mit ihren Fluoriden gewonnen.', 'gemerkt': false},
		
		{'frage': 'Löslichkeit der Erdalkalimetall-Salze',
		'antwort': 'Die Löslichkeit hängt von der Ionenladungsdichte der Erdalkalikationen ab. Je kleiner der Kationenradius bei gleicher Ladung, '
		'desto stärker die Hydration und daher bessere Löslichkeit.\nDaher sind alle Nitrate und Chloride der Erdalkalimetalle gut in Wasser löslich. '
		'Hingegen ihre Sulfate, Phosphate, Carbonate und Chromate meist schwer löslich sind. '
		'Ausnahmen bilden hier Berylliumsulfat und Magnesiumsulfat, die gut löslich sind, '
		'da die Kationen von Beryllium und Magnesium kleine Radien mit einer hohen Ladungsdichte aufweisen. ', 'gemerkt': false},
		
		{'frage': 'Die Rauchgasentschwefelung',
		'antwort': 'Bei der Rauchgasentschwefelung wird das Schwefeldioxid (SO₂) aus dem Abgas fossiler Brennstoffe entfernt, '
		'um nicht in die Atmosphäre frei gesetzt zu werden. Denn freigesetztes Schwefeldioxid reagiert mit Wasser zur Schwefeligen Säure.\n'
		'SO₂ + H₂O → H₂SO₃\n'
		'Schwefeldioxid ist die Hauptursache für Sauren Regen, der zum Absterben von Vegetation, der Zerstörung von Böden und der Ozeanversäuerung führt. \n'
		'Der Prozess der Entschwefelung beginnt mit einer wässrigen Aufschlämmung von Kalkstein (CaCO₃). '
		'Das Rauchgas wird im Gegenstromprinzip durch die Kalkaufschlämmung geleitet. '
		'In der Aufschlämmung reagiert das Schwefeldioxid mit dem Calciumcarbonat zu Calciumsulfit und weiter zum Calciumsulfat.\n'
		'Über den Schornstein wird am Ende "nur" CO₂ in die Atmosphäre abgegeben.\n'
		'2 SO₂ + 2 CaCO₃ + H₂O → 2 CaSO₃ * H₂O + 2 CO₂\n'
		'2 CaSO₃ * H₂O + 2 SO₂ + 2 H₂O → 2 Ca(HSO₃)₂ + H₂O\n'
		'Ca(HSO₃)₂ + O₂ + 2 H₂O → CaCO₄ * 2 H₂O + H₂SO₄\n'
		'H₂SO₄ + CaCO₃ + H₂O → CaCO₄ * 2 H₂O + CO₂', 'gemerkt': false},
	],

  'Erdmetalle': [
	
		{'frage': 'Die Erdmetalle',
		'antwort': 'Die Erdmetalle sind die Elemente der dritten Hauptgruppe (IUPAC Gruppe 13). Sie werden auch Triele oder Elemente der Borgruppe genannt. ' 
		'Diese Gruppe umfasst die Elemente Bor (B), Aluminium (Al), Gallium (Ga), Indium (In), Thallium (Tl) und Nihonium (Nh).', 'gemerkt': false},
		
		{'frage': 'Gruppeneigenschaften der Erdmetalle',
		'antwort': 'Durch ihre Elektronenkonfiguration sind Erdmetalle sehr reaktiv. '
		'Mit Ausnahme des Halbmetalls Bor, sind alle weiteren Elemente dieser Gruppe Metalle.', 'gemerkt': false},
		
		{'frage': 'Allotropie',
		'antwort': 'Allotropie bedeutet, dass ein Element in verschiedenen Zuständen vorkommt, '
		'die sich in physikalischen und chemischen Eigenschaften unterscheiden.\n' 
		'', 'gemerkt': false},
		
		{'frage': 'Die Elementstrukturen von Bor',
		'antwort': 'Als zentrale Struktureinheit enthalten alle bekannten kristallinen Modifikationen von Bor B₁₂-Ikosaeder.\n'
		'α-rhomboedrisches Bor: Kubisch-dichteste Packung von B₁₂-Ikosaedern, einfachste Modifikation mit hoher Symmetrie\n'
		'α-tetragonales Bor: Hexagonal-dichteste Packung von B₁₂-Ikosaedern, enthält zusätzliche Boratome zwischen den Ikosaedern\n'
		'β-rhomboedrisches Bor: Komplexe rhomboedrische Elementarzelle mit 105 Boratomen, Thermodynamisch stabilste Modifikation '
		'bei Raumtemperatur, meist in technischen Anwendungen\n'
		'β-tetragonales Bor: Sehr komplexe tetragonale Elementarzelle mit 190 Boratomen, selten', 'gemerkt': false},
		
		{'frage': 'Borane: Die Ausbildung von 3-Zentren-2-Elektronenbindungen',
		'antwort': 'Borane sind Verbindungen aus Bor und Wasserstoff. Das einfachste Boran das BH₃ ist nicht synthetisierbar, '
		'bei der Reduktion von Borverbindungen mit Wasserstoff erhält man ein Dimer: B₂H₆ Diboran. '
		'Darin sind die beiden Boratome zwei Mal über je ein Wasserstoffatom verbunden.\n'
		'BH₃ ist eine Elektronenmangelverbindung. Um drei Wasserstoffatome binden zu können, werden drei Orbitale benötigt. '
		'Liegt Bor sp³-hybridisiert vor, bliebe ein Orbital vakant. Das vakante Orbital wäre energetisch niedriger wodurch BH₃ instabil ist. '
		'Um alle Orbitale füllen zu können, bildet sich das Dimer oder höhere Borane aus.\n'
		'Das Problem dabei ist, dass das vakante Orbital kein freies Elektronenpaar für die Bindung besitzt. '
		'Die Bindung erfolgt, indem je BH₃ eine Bor-Wasserstoffbindung eine Bindung mit dem vakanten Orbital des anderen BH₃ eingeht. '
		'An den entstehenden bindenden Molekülorbitalen sind folgedessen je drei Atome und zwei Elektronen beteiligt. '
		'Da die Bindung drei Atome (Zentren) und zwei Elektronen umfasst, nennt man sie 3-Zentren-2-Elektronenbindungen.', 'gemerkt': false},
		
		{'frage': 'Das Bayer-Verfahren',
		'antwort': 'Das Bayer-Verfahren ist das wichtigste Verfahren, zur industriellen Gewinnung von Aluminiumoxid.\n'
		'Als erstes wird dazu Bauxit (Hauptbestandteile: AlO(OH) und Fe₂O₃) fein gemahlen und mit Natronlauge vermischt. '
		'Bei bis zu 40 bar Druck und Temperaturen zwischen 100 °C und 320 °C bildet sich in einigen Stunden, unter rühren, '
		'Natriumaluminat (Na[Al(OH)₄]) und ausfallendes Eisenhydroxid:\n AlO(OH) + Fe₂O₃ + NaOH → Na[Al(OH)₄] + Fe(OH)₃↓\n'
		'Die überättigte Lauge wird auf 60 °C bis 70 °C abgekühlt, dadurch fällt Aluminiumhydroxid aus. '
		'Durch das Animpfen mit kristallinem Aluminiumhydroxid wird das ganze beschleunigt: Na[Al(OH)₄] + Al(OH)₃ → Al(OH)₃↓ + NaOH\n'
		'Das Aluminiumhydroxid wird auf ungefähr 1100 °C erhitzt, dabei spaltet sich Wasser ab (Calcinieren): Al(OH)₃ → Al₂O₃ + 3 H₂O\n'
		'Aus dem im Bayer-Verfahren gewonnenen Aluminiumoxid, wird mittels Schmelzflusselektrolyse reines Aluminium produziert.', 'gemerkt': false},
		
	],
	
	'Kohlenstoffgruppe': [
		
		{'frage': 'Die Kohlenstoffgruppe',
		'antwort': 'Die Kohlenstoffgruppe umfasst die Elemente der vierten Hauptgruppe (IUPAC Gruppe 14). '
		'Diese Gruppe umfasst die Elemente Kohlenstoff (C), Silicium (Si), Germanium (Ge), Zinn (Sn), Blei (Pb) und Flerovium (Fl).', 'gemerkt': false},
		
		{'frage': 'Die Gruppeneigenschaften der Kohlenstoffgruppe',
		'antwort': 'Die Stabilität der Oxidationszahl +4 nimmt mit steigender Ordnungszahl ab -> Inert-Pair-Effekt stabilisiert +2\n'
		'Die metallischen Eigenschaften nehmen von oben nach unten zu (Nichtmetall (C), Halbmetalle (Si, Ge), Metalle (Sn, Pb, Fl))\n'
		'Die Ausbildung von Mehrfachbindungen nimmt von oben nach unten ab\n'
		'Mit steigender Atomgröße nimmt die Fähigkeit mit sich selbst Ketten zu bilden ab.', 'gemerkt': false},
		
		{'frage': 'Die Allotropie von Kohlenstoff',
		'antwort': 'Elementarer Kohlenstoff kommt in fünf verschiedenen Modifikationen vor:\n'
		'Die hochmolekularen Formen (C_∞):\n'
		'Graphit: Besteht aus ebenen sp²-hybridisierten Kohlenstoffschichten, Jede Schicht besteht aus planaren Hexagonen. '
		'Die nicht hybridisierten p_z-Orbitale stehen senkrecht zu den Kohlenstoffschichten. '
		'Diese p_z-Orbitale treten mit den p_z-Orbitalen der darüber und darunterliegenden Schicht in Wechselwirkung. '
		'Die delokalisierten Elektronen der nicht hybridisierten p_z-Orbitale sind ursächlich für die Leitfähigkeit und die scharze Farbe.\n'
		'Diamant: Besteht aus sp³-hybridisiertem Kohlenstoff, der über Einfachbindungen tetraedrisch an vier weitere Kohlenstoffatome gebunden ist. '
		'Die Bindungen führen zur großen Härte von Diamant. Da es keine delokalisierten Elektronen gibt, ist Diamant ein elektrischer Isolator.\n'
		'Die niedermolekularen Formen (C_n):\n'
		'Fullerene: Mehr oder weniger kugelförmige Modifikation aus meist 60 oder 70 Kohlenstoffatomen. '
		'Innerhalb eines Fullerens sind die Atome in pentagonalen und hexagonalen Strukturen angeordnet.\n'
		'Kohlenstoff-Nanoröhren: Zylindrisch gerollte Graphitschicht, die ein- oder mehrwändig auftreten. '
		'Sie weisen eine hohe mechanische Festigkeit auf und sind gleichzeitig elastisch. '
		'Je nach Struktur können sie auch metallische oder halbmetallische Leitfähigkeitseigenschaften aufweisen.\n'
		'Graphen: Einzelne Schicht aus hexagonal angeordneten Kohlenstoffatomen.', 'gemerkt': false},
		
		{'frage': 'Die Darstellung von metallischem Silicium',
		'antwort': 'Im elektrischen Ofen wird bei etwa 2000 °C Siliciumdioxid mit Kohle reduziert: SiO₂ + 2 C → Si + CO\n'
		'Um ein Kilogramm Silicium herzustellen, werden 14 kWh elektrische Energie benötigt!\n'
		'Das reduktiv gewonnene Silicium hat einen Reinheitsgrad von etwa 98% und liegt polykristallin vor. '
		'Das Silicium kann in dieser Form für Solarzellen verwendet werden, für Computerchips ist es nicht zu verwenden.', 'gemerkt': false},
		
		{'frage': 'Kristallziehverfahren nach Czochralski',
		'antwort': 'Metallisches Silicium wird in einem Tiegel geschmolzen. '
		'Ein kleiner Silicium-Einkristall wird als Impfling in die Schmelze eingetaucht. '
		'Der Impfkristall wird sehr lamgsam unter drehen nach oben gezogen, dabei entsteht ein homogener Einkristall mit hohem Reinheitsgrad.\n'
		'Um den Einkristall weiter aufzureinigen, sodass er in der Halbleiterindustrie verwendet werden kann, '
		'wird er lamgsam waagerecht durch einen Ofen transportiert. Dabei drinngen die Verunreinigungen an die Oberfläche '
		'und wandern an das Ende des Kristalls. Dieser hochreine Kristall wird in Stücke gesägt '
		'und für die Herstellung von Computerchips verwendet.', 'gemerkt': false},
		
		{'frage': 'Siliciumdioxid (SiO₂)',
		'antwort': 'Siliciumdioxid besteht aus SiO₄-Tetraedern. Darin ist jedes Siliciumatom von vier Sauerstoffatomen umgeben. '
		'Diese Tetraeder sind über gemeinsame Sauerstoffatome zu einem dreidimensionalen Netzwerk verbunden.\n'
		'Siliciumdioxid gibt es in amorpher und in kristalliner Form.\n'
		'Amorphe Form: Silicagel/Kieselgel: keine Fernordnung, nur lokale Tetraederstruktur, große Oberfläche (~700 m²/g), '
		'Wasserstoffbrückenbindung durch reaktive OH-Gruppen möglich\n'
		'Herstellung mittels Flammenpyrolyse bei etwa 1000 °C: SiCl₄ + 2 H₂ + O₂ → SiO₂ + 4 HCl\n'
		'Kristalline Form: Quarz (α-Quarz): regelmäßige Fernordnung, UV transparent bis 150 nm, piezoelektrisch', 'gemerkt': false},
		
	],
  'Pentele' : [
		
		
		{'frage': 'Die Pentele',
		'antwort': 'Die Pentele sind die Elemente der fünften Hauptgruppe (IUPAC Gruppe 15). Sie werden auch als Elemente der Stickstoffgruppe bezeichent. '
		'Die Gruppe umfasst die Elemente Stickstoff (N), Phosphor (P), Arsen (As), Antimon (Sb), Bismut (Bi), Moscovium (Mc).', 'gemerkt': false},
		
		{'frage': 'Die Gruppeneigenschaften der Pentele',
		'antwort': 'Die Stabilität der Oxidationszahl +3 nimmt mit steigender Ordnungszahl zu (Oxidationsstufe +5 wird instabiler), '
		'sodass die Stärke als Oxidationsmittel steigt -> Inert-Pair-Effekt stabilisiert\n'
		'Die Elektronegativität nimmt innerhalb der Gruppe von oben nach unten ab.\n'
		'Die metallischen Eigenschaften nehmen von oben nach unten zu (Nichtmetalle (N, P), Halbmetalle (As, Sb), Metall (Bi))\n', 'gemerkt': false},
		
		{'frage': 'Das Haber-Bosch-Verfahren',
		'antwort': 'Das Haber-Bosch-Verfahren ist das wichtigste großtechnische Verfahren zur Synthese von Ammoniak (NH₃) aus elementarem Stickstoff und Wasserstoff.\n'
		'Hierzu müssen zunächst beide Gase in hoher Reinheit gewonnen werden:\n'
		'Stickstoff: Stickstoff als Hauptbestandteil der Luft, wird aus ihr abgetrennt. '
		'Dafür wird Luft durch mehrfaches Komprimieren und Expandieren verflüssigt. '
		'Im Anschluss wird die verflüssigte Luft mehrfach verdampft und wieder kondensiert, dadurch lässt sich die Luft in ihre einzelnen Gase auftrennen.\n'
		'Wasserstoff: Wasserstoff wird durch die Reduktion von Wasser gewonnen. Technisch können dafür zwei verschiedene Verfahren verwendet werden:\n'
		'Kohlenstoff als Reduktionsmittel: C + H₂O ⇌ CO + H₂\n'
		'Steam-Reforming-Verfahren: CH₄ + H₂O ⇌ CO + 3 H₂\n'
		'Das bei der Wasserstoffgewinnung erhaltene Kohlenmonoxid würde das Eisen im Katalysator bei der Ammoniksynthese vergiften. '
		'Daher wird es zu Kohlendioxid umgewandelt: CO + H₂O ⇌ CO₂ + H₂ und mit Wasser ausgewaschen.\n'
		'Die folgende Synthese des Ammoniak nach: N₂ + 3 H₂ ⇌ 2 NH₃, ist technisch anspruchsvoll. '
		'Da es sich um eine Gleichgewischtsreaktion handelt, müssen die Bedingungen eingestellt werden, '
		'um eine möglichst hohe Produktausbeute zu erhalten. Da es sich um eine exotherme Reaktion handelt, '
		'wäre eine möglichst geringe Temperatur vorteilhaft, allerdings wird ein Katalysator (Fe₃O₄) zur Gleichgewischtseinstellung in vertretbarer Zeit benötigt. '
		'Dieser benötigt aber eine höhere Reaktionstemperatur, um effizient zu arbeiten, daher findet die Reaktion meist bei 500 °C statt. '
		'Das Gleichgewicht wird auch über einen Druck von 30 MPa eingestellt, denn die Reaktion findet unter Volumenabnahme statt. '
		'Dadurch verschiebt sich das Gleichgewischt auf die Produktseite.\n'
		'Trotz der Optimierungen der Bedinungen im Reaktor ergibt die Synthese nur eine Ausbeute von ca. 11%.', 'gemerkt': false},
		
		{'frage': 'Stickstoffverbindungen',
		'antwort': 'Durch die Vielfalt der möglichen Oxidationszahlen des Stickstoffs (von -3 bis +5) sind verschiedene Verbindungsklassen möglich:\n'
		'Stickoxide: (z. B. N₂O, NO, NO₂, N₂O₃, N₂O₅) manche Stickoxide liegen auch dimerisiert vor (z. B. N₂O₂  N₂O₄). '
		'Stickoxide sind starke Oxidationsmittel, einige sind giftig.\n'
		'Säuren und ihre Salze: Salpetersäure (HNO₃), salpetrige Säure (HNO₂), Nitrate (NO₃-), Nitrite (NO₂-), Stickstoffwasserstoffsäure (HN₃), Azide (N₃-)', 'gemerkt': false},
		
		{'frage': 'Phosphorverbindungen',
		'antwort': 'Phosphor kann verschiedene Verbindungsklassen eingehen:\n'
		'Wasserstoffverbindungen: Phosphan (PH₃) und Diphosphan (P₂H₄), sehr giftiges Gas (Knoblauchgeruch)\n'
		'Oxide: (z. B. P₄O₆, P₄O₈, P₄O₁₀) bilden mit Wasser Säuren aus, reagieren stark mit Wasser (Trockenmittel)\n'
		'Säuren: (z. B. Phosphorsäure (H₃PO₄), phosphorige Säure (H₃PO₃), hypophosphorige Säure (H₃PO₂)) auch Di- oder Polymerisation der Säuren möglich', 'gemerkt': false},
	
	],
	'Chalkogene' : [
	
		{'frage': 'Die Chalkogene',
		'antwort': 'Die Chalkogene sind die Elemente der sechsten Hauptgruppe (IUPAC Gruppe 16). Sie werden auch als Elemente der Sauerstoffgruppe bezeichent. '
		'Diese Gruppe umfasst die Elemente Sauerstoff (O), Schwefel (S), Selen (Se), Tellur (Te), Polonium (Po), Livermorium (Lv).', 'gemerkt': false},
		
		{'frage': 'Die Gruppeneigenschaften der Chalkogene',
		'antwort': 'Die metallischen Eigenschaften nehmen von oben nach unten zu (Nichtmetalle (O, S), Halbmetalle (Se, Te, Po)\n'
		'Doppelbindungsregel: Schwefel, Selen und Tellur bilden bevorzugt Ketten und Ringe, da ihre σ-Bindungen stabiler als die π-Bindungen sind.\n'
		'Bevorzugte Oxidationszahlen in dieser Gruppe sind -2, +4 und +6.', 'gemerkt': false},
		
		{'frage': 'Allotropie und Polymorphie',
		'antwort': 'Allotropie: Element bildet Moleküle unterschiedlicher Größe mit sich selbst.\n'
		'Polymorphie: Molekül kann an pysikalische Bedingungen anpassend unterschiedliche Strukturen ausbilden.', 'gemerkt': false},
		
		{'frage': 'Das Frasch-Verfahren',
		'antwort': 'Mit dem Frasch-Verfahren wird elementarer Schwefel aus unterirdischen Lagerstätten gefördert. '
		'Wasserdampf wird über Rohre in die unterirdische Lagerstätte gepumpt. In Folge dessen schmilzt der Schwefel auf. '
		'Über ein weiteres Rohr wird der flüssige Schwefel an die Oberfläche transportiert und anschließend auskristallisieren lassen.', 'gemerkt': false},
		
		{'frage': 'Der Claus-Prozess',
		'antwort': 'Mit dem Claus-Prozess wird Schwefel, aus dem bei der Verbrennung fossiler Energieträger entstandenen Schwefelwasserstoff, gewonnen. '
		'Im ersten Schritt wird der Schwefelwasserstoff (H₂S) mit Sauerstoff verbrannt. Dabei wird Wärmeenergie gewonnen. 2 H₂S + 3 O₂ → 2 SO₂ + 2 H₂O\n'
		'In einem Ofen mit eisenhaltigem Aluminiumoxid-Katalysator reagiert der restliche Schwefelwasserstoff '
		'mit dem Schwefeldioxid in einer Synproportionierungsreaktion zu elementarem Schwefel und Wasser. 2 H₂S + SO₂ → 3 S + 2 H₂O', 'gemerkt': false},
		
		{'frage': 'Schwefelverbindungen',
		'antwort': 'Die bevorzugten Oxidationszahlen des Schwefels sind -2, +4 und +6. Dadurch sind verschiedene Verbindugsklassen möglich:\n'
		'Schwefeloxide: Schwefeldioxid (SO₂) und Schwefeltrioxid (SO₃) beide Gase können zur Herstellung ihrer Säuren verwendet werden.\n'
		'Säuren: Schwefelsäure (H₂SO₄) und schweflige Säure (H₂SO₃), auch gerne dimerisiert oder beliebige andersweitige Verbindungen aus H, S, O.', 'gemerkt': false},
	],
	'Halogene' : [
	
		{'frage': 'Die Halogene',
		'antwort': 'Die Halogene sind die Elemente der siebten Hauptgruppe (IUPAC Gruppe 17). '
		'Diese Gruppe umfasst die Elemente Fluor (F), Chlor (Cl), Brom (Br), Jod (I), Astat (At), Tenness (Ts).', 'gemerkt': false},
		
		{'frage': 'Die Gruppeneigenschaften der Halogene',
		'antwort': 'Halogene sind sehr reaktionsfreudig und kommen deshalb nicht elementar vor.\n'
		'Halogene lassen sich besonders leicht ionisieren.\n'
		'Sie bilden zusammen mit Elementen der ersten und zweiten Hauptgruppe Salze.\n'
		'Mit der Ausnahme von Fluorwasserstoff (HF) reagieren alle Halogenwasserstoffe als starke Säuren.', 'gemerkt': false},
		
		{'frage': 'Die Fluorwasserstoffelektrolyse',
		'antwort': 'Elementares Fluor wird durch Elektrolyse einer Mischung aus Kaliumfluorid und Fluorwasserstoff gewonnen. '
		'Dabei entsteht an einer Kohlenstoff-Anode des gasförmige Fluor (F₂) und an der Stahl-Kathode Wasserstoff (H₂).', 'gemerkt': false},
		
		{'frage': 'Die Chloralkali-Elektrolyse',
		'antwort': 'Elementares Chlor wird durch die Elektrolyse einer wässrigen Natriumchloridlösung gewonnen. '
		'Da die entstehenden Gase Chlor und Wasserstoff nicht miteinander in Kontakt kommen dürfen (Chlorknallgasreaktion), '
		'sind beide Elektrodenkammern durch ein gasundurchlässiges Diaphragma getrennt.\n'
		'Folgende Reaktionen finden dabei an den Elektroden statt:\n'
		'Kathode: 2 H₂O + 2 e- → H₂↑ + 2 OH-\n'
		'Anode: 2 NaCl → 2 Na+ + Cl₂↑ + 2 e-', 'gemerkt': false},
	],
	'Edelgase' : [
	
		{'frage': 'Die Edelgase',
		'antwort': 'Die Edelgase sind die Elemente der achten Hauptgruppe (IUPAC 18). '
		'Diese Gruppe umfasst die Elemente Helium (He), Neon (Ne), Argon (Ar), Krypton (Kr), Xenon (Xe), Radon (Rn) und Oganesson (Og).', 'gemerkt': false},
		
		{'frage': 'Vorkommen der Edelgase',
		'antwort': 'Edelgase kommen meist elementar vor, durch ihre große Reaktionsträgheit. So ist Helium ein Bestandteil des Erdgases. '
		'Neon, Argon, Krypton und Xenon sind Bestandteile der Luft und werden aus ihr zur Nutzung isoliert. '
		'Radon tritt in einigen Regionen aus der Erde. Es ist ein Zerfallsprodukt von Radium.', 'gemerkt': false},
		
		{'frage': 'Edelgashalogenide',
		'antwort': 'Um Edelgase größerer Masse doch zu einer Reaktion zu zwingen sind hohe Drücke und Temperaturen notwendig. '
		'Am besten eignet sich das sehr elektronegative Fluor als Reaktionspartner. Damit lässt sich Xenon bis zum XeF₆ oxidieren. '
		'Auch Krypton und Radon konnten bereits mit Flour mehrfach oxidiert werden.', 'gemerkt': false},
		
		{'frage': 'Edelgasoxide',
		'antwort': 'Eine Oxidation von Xenon durch Sauerstoff konnte erfolgreich durchgeführt werden. '
		'Möglich ist hierbei XeO₃ und XeO₄.', 'gemerkt': false},
	],


  };

  String gewaehltesKapitel = 'Gemischt';
  List<int> verlauf = [];
  int aktuelleKarteIndex = 0;
  bool nurGemerkt = false;

  List<Map<String, dynamic>> getAktuellerStapel() {
    if (gewaehltesKapitel == 'Gemischt') {
      return kapitelKarten.values.expand((liste) => liste).toList();
    } else {
      return kapitelKarten[gewaehltesKapitel]!;
    }
  }

  void neueKarte() {
  // aktuellen Stapel bestimmen (wie in build)
  final stapel = nurGemerkt
      ? kapitelKarten.values
          .expand((liste) => liste)
          .where((karte) => karte['gemerkt'] == true)
          .toList()
      : getAktuellerStapel();

  if (stapel.isEmpty) return;

  // Wenn wir schon alle Karten einmal gesehen haben → Verlauf zurücksetzen
  if (verlauf.length >= stapel.length) {
    verlauf.clear();
  }

  final random = Random();
  int neuerIndex;

  // so lange ziehen, bis wir einen Index haben, der noch nicht im Verlauf ist
  do {
    neuerIndex = random.nextInt(stapel.length);
  } while (verlauf.contains(neuerIndex) && verlauf.length < stapel.length);

  verlauf.add(neuerIndex);

  setState(() {
    aktuelleKarteIndex = neuerIndex;
  });
}

  void vorherigeKarte() {
    if (verlauf.length >= 2) {
      verlauf.removeLast();
      setState(() {
        aktuelleKarteIndex = verlauf.last;
      });
    }
  }

  void kapitelWechseln(String? neuesKapitel) {
    if (neuesKapitel != null) {
      setState(() {
        gewaehltesKapitel = neuesKapitel;
        verlauf = [0];
        aktuelleKarteIndex = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    verlauf.add(0);
  }
@override
Widget build(BuildContext context) {
  final stapel = nurGemerkt
      ? kapitelKarten.values
          .expand((liste) => liste)
          .where((karte) => karte['gemerkt'] == true)
          .toList()
      : getAktuellerStapel();

  // Sicherheitsprüfung: Index zurücksetzen, wenn Stapel leer
  if (stapel.isEmpty) {
    aktuelleKarteIndex = 0;
  } else if (aktuelleKarteIndex >= stapel.length) {
  	aktuelleKarteIndex = 0;
	}


  return SingleChildScrollView( 
    child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        DropdownButton<String>(
          value: gewaehltesKapitel,
          items: ['Gemischt', ...kapitelKarten.keys].map((kapitel) {
            return DropdownMenuItem(
              value: kapitel,
              child: Text(kapitel),
            );
          }).toList(),
          onChanged: kapitelWechseln,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              nurGemerkt = !nurGemerkt;
              verlauf = [0];
              aktuelleKarteIndex = 0;
            });
          },
          child: Text(nurGemerkt ? 'Alle Karten anzeigen' : 'Nur gemerkte Karten'),
        ),
        SizedBox(height: 24),
        SizedBox(
          height: 220,
          child: stapel.isEmpty
              ? Center(
                  child: Text(
                    'Keine Karten verfügbar.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          stapel[aktuelleKarteIndex]['frage'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Text(
                          stapel[aktuelleKarteIndex]['antwort'],
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                stapel[aktuelleKarteIndex]['gemerkt'] == true
                                    ? Icons.star
                                    : Icons.star_border,
                                color: stapel[aktuelleKarteIndex]['gemerkt'] == true
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  for (var kapitel in kapitelKarten.values) {
                                    for (var k in kapitel) {
                                      if (k['frage'] ==
                                              stapel[aktuelleKarteIndex]['frage'] &&
                                          k['antwort'] ==
                                              stapel[aktuelleKarteIndex]['antwort']) {
                                        k['gemerkt'] = !(k['gemerkt'] == true);
                                      }
                                    }
                                  }

                                  final neuerStapel = nurGemerkt
                                      ? kapitelKarten.values
                                          .expand((liste) => liste)
                                          .where((k) => k['gemerkt'] == true)
                                          .toList()
                                      : getAktuellerStapel();

                                  if (neuerStapel.isEmpty) {
                                    verlauf = [0];
                                    aktuelleKarteIndex = 0;
                                  } else {
                                    aktuelleKarteIndex =
                                        aktuelleKarteIndex % neuerStapel.length;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), )
                ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: vorherigeKarte, child: Text('Zurück')),
            ElevatedButton(onPressed: neueKarte, child: Text('Nächste')),
          ],
        ),
      ],
    ),
 ) );
}
}

// ❓ Quiz-Ansicht
class QuizAnsicht extends StatefulWidget {
  const QuizAnsicht({super.key});

  @override
  _QuizAnsichtState createState() => _QuizAnsichtState();
}

class _QuizAnsichtState extends State<QuizAnsicht> {
  final List<Map<String, dynamic>> fragen = [
    {
      'frage': 'Was ist eine Säure nach Brønsted?',
      'optionen': ['Elektronendonator', 'Protonendonator', 'Ligand', 'Oxidationsmittel'],
      'richtigeAntwort': 1,
    },
    {
      'frage': 'Was ist ein Oxidationsmittel?',
      'optionen': ['Elektronendonator', 'Elektronenakzeptor', 'Protonenakzeptor', 'Base'],
      'richtigeAntwort': 1,
    },
    {
		'frage': 'Wie ist die Größentendenz von Kationenradien im Vergleich zu ihren Atomradien?',
		'optionen': ['Gleiche Größe', 'Größer', 'Kleiner', 'Sie sind energetisch ungünstig und existieren daher nicht' ],
		'richtigeAntwort': 2,
	  },
	  {	'frage': 'Wie ist die Größentendenz von Anionenradien im Vergleich zu ihren Atomradien?',
		  'optionen': ['Gleiche Größe', 'Größer', 'Kleiner', 'Sie sind energetisch ungünstig und existieren daher nicht' ],
		  'richtigeAntwort': 1,
	  },
	  {	'frage': 'Nach welcher Anzahl richtet sich die Ordnungszahl?',
	  	'optionen': ['Protonenanzahl', 'Neutronenanzahl', 'Elektronenanzahl', 'Nukleonenanzahl' ],
	  	'richtigeAntwort': 0,
	  },
	  {	'frage': 'Wie viele natürlich vorkommende Elemente wurden bislang entdeckt?',
	  	'optionen': ['63', '92', '94', '118' ],
	  	'richtigeAntwort': 2,
	  },
	  {	'frage': 'Was sind Isotope?',
	  	'optionen': ['geladene Teilchen', 'radioaktive Elemente', 'Atome mit verschiedener Elektronenanzahl des selben Elements', 'Atome mit verschiedener Neutronenanzahl des selben Elements' ],
	  	'richtigeAntwort': 3,
	  },
	  {	'frage': 'Wie sind die Perioden im PSE dargestellt?',
	  	'optionen': ['Spalte', 'Block', 'Zeile', 'Diagonale' ],
	  	'richtigeAntwort': 2,
	  },
	  {	'frage': 'Wie sind die Gruppen im PSE dargestellt?',
	  	'optionen': ['Spalte', 'Block', 'Zeile', 'Diagonale' ],
	  	'richtigeAntwort': 0,
	  },
	  {	'frage': 'Welches der folgenden Eigenschaften trifft nicht auf Metalle zu?',
	  	'optionen': ['glänzend', 'Wärme gut leitend', 'isolatorische Eigenschaften', 'duktil' ],
	  	'richtigeAntwort': 2,
	  },
	  {	'frage': 'Welches Element ist am elektronegativsten?',
	  	'optionen': ['Sauerstoff', 'Chlor', 'Stickstoff', 'Fluor' ],
	  	'richtigeAntwort': 3,
	  },
    {	'frage': 'Welcher Energie entspricht der Massendefekt?',
		'optionen': ['Elektronenabstoßungsenergie', 'Difussionsenergie', 'Beschleunigungsenergie', 'Kernbindungsenergie' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Welche Wertigkeit besitzt eine kubisch-raumzentrierte Elementarzelle?',
		'optionen': ['1', '2', '3', '4' ],
		'richtigeAntwort': 1,
	},
	{	'frage': 'Welche Wertigkeit besitzt eine kubisch-flächenzentrierte Elementarzelle?',
		'optionen': ['1', '2', '3', '4' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Welche Wertigkeit besitzt eine hexagonal dichtest gepackte Elementarzelle?',
		'optionen': ['4', '5', '6', '7' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Durch welches Verfahren werden die meisten Alkalimetalle (Reinstoff) gewonnen?',
		'optionen': ['Schmelzflusselektrolyse', 'Solvay-Verfahren', 'Haber-Bosch-Verfahren', 'Bergbau' ],
		'richtigeAntwort': 0,
	},
	{	'frage': 'Was wird mit dem Solvay-Verfahren großtechnisch hergestellt?',
		'optionen': ['NH₄NO₃', 'NH₃', 'Na₂CO₃', 'NaCl' ],
		'richtigeAntwort': 2,
	},
  {	'frage': 'Welches der Merkmale ist keine typische Gruppeneigenschaft der Erdalkalimetalle?',
		'optionen': ['Bevorzugen Oxidationsstufe +2', 'Typische Metalle', 'Bilden mit Stickstoff Nitride', 'Prinzipiell inert' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Wie werden Beryllium und Barium großtechnisch dargestellt?',
		'optionen': ['Schmelzflusselektrolyse', 'Reduktion', 'Solvay-Verfahren', 'Haber-Bosch-Verfahren' ],
		'richtigeAntwort': 1,
	},
	{	'frage': 'Wie werden Magnesium, Calcium und Strontium großtechnisch gewonnen?',
		'optionen': ['Reduktion', 'Bergbau', 'Schmelzflusselektrolyse', 'Elektrolyse' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Wovon hängt die Löslichkeit bei Salzen in Wasser ab?',
		'optionen': ['Schmelzpunkt', 'Molare Masse', 'Form der Elementarzelle', 'Ionenladungsdichte' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Welches Produkt bildet sich bevorzugt, wenn Schwefeldioxid in die Atmosphäre gelangt?',
		'optionen': ['H₂SO₃', '(CH₃)₂SO', 'H₂SO₄', 'FeSO₄' ],
		'richtigeAntwort': 0,
	},
	{	'frage': 'Welches Problem ergibt sich durch Schwefeldioxid in der Atmosphäre?',
		'optionen': ['Smog', 'Saurer Regen', 'Chemtrails', '5G' ],
		'richtigeAntwort': 1,
	},
  {	'frage': 'Welches der folgenden Elementen gehört nicht in die Gruppe der Erdmetalle?',
		'optionen': ['Aluminium', 'Bor', 'Eisen', 'Thallium' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Wie nennt man die Eigenschaft, dass ein Element in verschiedenen Zuständen vorkommt, die sich chemisch und pysikalisch unterscheiden?',
		'optionen': ['Allotropie', 'Isotopie', 'Topographie', 'Geometrie' ],
		'richtigeAntwort': 0,
	},
	{	'frage': 'Mit welchem Verfahren wird Aluminiumoxid aus Bauxit gewonnen?',
		'optionen': ['Haber-Bosch-Verfahren', 'Bayer-Verfahren', 'Schmelzflusselektrolyse', 'Solvay-Verfahren' ],
		'richtigeAntwort': 1,
	},
	{	'frage': 'Wie nennt man eine Bindung an der drei Atome aber nur zwei Elektronen beteiligt sind?',
		'optionen': ['Nicht existent!', 'Ionenkomplexbindung', '3-Zentren-2-Elektronenbindung', '3-Atome-2-Elektronenbindung' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Welches der folgenden Elemente gehört nicht in die Kohlenstoffgruppe?',
		'optionen': ['Silicium', 'Germanium', 'Blei', 'Quecksilber' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Wie nennt man die meist kugelförmigen Modifikationen aus Pentagonen/ Hexagonen des Kohlenstoffs?',
		'optionen': ['Fullerene', 'Diamant', 'Nanotubes', 'Graphen' ],
		'richtigeAntwort': 0,
	},
	{	'frage': 'Wie wird metallisches Silicium dargestellt?',
		'optionen': ['Schmelzflusselektrolyse', 'Reduktion', 'Bergbau', 'Elektrolyse' ],
		'richtigeAntwort': 1,
	},
  {	'frage': 'Welches der folegenden Elementen ist kein Element der Stickstoffgruppe?',
		'optionen': ['Phosphor', 'Antimon', 'Arsen', 'Selen' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Mit welchem Verfahren wird Ammoniak großtechnisch synthetisiert?',
		'optionen': ['Bayer-Verfahren', 'Haber-Bosch-Verfahren', 'Solvay-Verfahren', 'Schmelzflusselektrolyse' ],
		'richtigeAntwort': 1,
	},
	{	'frage': 'Warum ist das Einstellen der Reaktionsbedingungen bei der Ammoniaksynthese ausbeutebestimmend?',
		'optionen': ['Reaktion ist explosiv', 'Reaktion benötigt exakte Menge Licht', 'Reaktion ist eine Gleichgewichtsreaktion', 'Katalyse nur bei Unterdruck möglich' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Welches der folgenden Elemente ist kein Element der Sauerstoffgruppe?',
		'optionen': ['Tellur', 'Schwefel', 'Selen', 'Arsen' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Welches der folgenden Elemente bildet nicht bevorzugt Ketten und Ringe aus?',
		'optionen': ['Schwefel', 'Selen', 'Tellur', 'Helium' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Wie wird die Eigenschaft genannt, bei der Moleküle je nach pysikalischer Bedingung unterschiedliche Strukturen ausbilden?',
		'optionen': ['Polymorphie', 'Allotropie', 'Isotopie', 'Topographie' ],
		'richtigeAntwort': 0,
	},
	{	'frage': 'Mit welchem Verfahren wird elementarer Schwefel aus unterirdischen Lagerstätten gefördert?',
		'optionen': ['Claus-Verfahren', 'Haber-Bosch-Verfahren', 'Frasch-Verfahren', 'Solvay-Verfahren' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Mit welchem Verfahren wird Schwefel aus Schwefelwasserstoff gewonnen?',
		'optionen': ['Frasch-Verfahren', 'Solvay-Verfahren', 'Claus-Verfahren', 'Haber-Bosch-Verfahren' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Welches der folgenden Elementen ist kein Element der Halogene?',
		'optionen': ['Chlor', 'Fluor', 'Jod', 'Argon' ],
		'richtigeAntwort': 3,
	},
	{	'frage': 'Welche der folgenden Eigenschaften trifft auf Halogene zu?',
		'optionen': ['Reaktionsträge', 'Schwache Oxidationsmittel', 'Reaktionsfreudig', 'Bilden meist Kationen' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Wie wird elementares Fluor gewonnen?',
		'optionen': ['Bergbau', 'Elektrolyse', 'Oxidation', 'Solvay-Verfahren' ],
		'richtigeAntwort': 1,
	},
	{	'frage': 'Wie wird elementares Chlor gewonnen?',
		'optionen': ['Luftverflüssigung', 'Bergbau', 'Elektrolyse', 'Oxidation' ],
		'richtigeAntwort': 2,
	},
	{	'frage': 'Welches der folgenden Elemente ist kein Edelgas?',
		'optionen': ['Neon', 'Helium', 'Radium', 'Xenon' ],
		'richtigeAntwort': 2,
	},
  ];

  int aktuelleFrage = 0;
  int? ausgewaehlt;
  bool beantwortet = false;
  String rueckmeldung = '';
  bool quizBeendet = false;
  int richtigeAntworten = 0;

  @override
  void initState() {
    super.initState();
    quizFragen = List.from(fragen)..shuffle();
    quizFragen = quizFragen.take(10).toList();
  }

  void naechsteFrage() {
    setState(() {
      if (aktuelleFrage < quizFragen.length - 1) {
        aktuelleFrage++;
        ausgewaehlt = null;
        beantwortet = false;
        rueckmeldung = '';
      } else {
        aktuelleFrage = quizFragen.length;
      }
    });
  }

  void quizBeenden() {
    setState(() {
      quizBeendet = true;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz beendet'),
        content: Text('Du hast das Quiz vorzeitig beendet.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // schließt den Dialog
              Navigator.of(context).maybePop(); // geht zurück, wenn möglich
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void quizNeuStarten() {
    setState(() {
      quizFragen = List.from(fragen)..shuffle();
      quizFragen = quizFragen.take(10).toList();
      aktuelleFrage = 0;
      ausgewaehlt = null;
      beantwortet = false;
      rueckmeldung = '';
      quizBeendet = false;
      richtigeAntworten = 0;
    });
  }

  void pruefenAntwort(int index) {
    final istRichtig = index == quizFragen[aktuelleFrage]['richtigeAntwort'];
    if (istRichtig) {
      richtigeAntworten++; 
    }
    setState(() {
      ausgewaehlt = index;
      beantwortet = true;
      rueckmeldung = istRichtig ? '✅ Richtig!' : '❌ Leider falsch.';
    });
  }

  List<Map<String, dynamic>> quizFragen = [];

  @override
  Widget build(BuildContext context) {
    if (quizBeendet) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Das Quiz wurde beendet.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: quizNeuStarten,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text('Neue Runde starten'),
            ),
          ],
        ),
      );
    }
   
    if (aktuelleFrage >= quizFragen.length) {
     return Center(
        child: Column(
         mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quiz beendet!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
           ),
            SizedBox(height: 12),
            Text(
              'Du hast $richtigeAntworten von ${quizFragen.length} Fragen richtig beantwortet.',
              style: TextStyle(fontSize: 18),
           ),
            SizedBox(height: 24),
            ElevatedButton(
             onPressed: quizNeuStarten,
             style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
             child: Text('Neue Runde starten'),
           ),
          ],
        ),
      );
    }

    final frage = quizFragen[aktuelleFrage];

    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(frage['frage'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            ...List.generate(frage['optionen'].length, (index) {
              final istRichtig = index == frage['richtigeAntwort'];
              final istAusgewaehlt = index == ausgewaehlt;
              Color farbe = Colors.blue;

              if (beantwortet) {
                if (istAusgewaehlt && istRichtig) {
                  farbe = Colors.green;
                } else if (istAusgewaehlt && !istRichtig) farbe = Colors.red;
                else farbe = Colors.grey;
              }

              return Container(
               margin: EdgeInsets.symmetric(vertical: 4),
               child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: farbe,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: beantwortet ? null : () => pruefenAntwort(index),
                  child: Text(frage['optionen'][index]),
                ),
              );
            }),
            SizedBox(height: 16),
            if (beantwortet)
             Text(
                rueckmeldung,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: rueckmeldung.contains('Richtig') ? Colors.green : Colors.red,
                ),
              ),
            SizedBox(height: 24),
            ElevatedButton(onPressed: naechsteFrage, child: Text('Nächste Frage')),
            SizedBox(height: 12),
            if (aktuelleFrage < quizFragen.length) ... [
              ElevatedButton( // Quiz vorzeitig beenden
              onPressed: quizBeenden,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text('Quiz beenden'),
            ),
            ]
          ],
        ),
      ),
    );
  }
}
class QuellenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
Quellen:

Diese Lernapp basiert auf der Vorlesung Anorganische Chemie für Forensiker:innen von Dr. Ulf Ritgen an der Hochschule Bonn-Rhein-Sieg im Wintersemester 2025/2026.

Zusätzlich wurden folgende Quellen verwendet:
- Böhme U., "Anorganische Chemie für dummies", Wiley-VCH Verlag, 3. Aufl., (2019)
- Ortanderl S., Ritgen U., "Chemie Das Lehrbuch für dummies", Wiley-VCH Verlag, 2. Aufl., (2018)
- Müller U., "Anorganische Strukturchemie", Vieweg + Teubner (Springer) Verlag, 6. Aufl., (2009)
- Kiefer C., "Quantentheorie", Fischer Taschenbuch Verlag, 2. Aufl., (2003)
- Savree, "Was ist Rauchgasentschwefelung?", [online] https://savree.com/de/enzyklopadie/entschwefelungsanlage-rauchgase , entnommen: 27.10.25
- Aluminium Deutschland, "Bayer-Verfahren", [online] https://www.aluminiumdeutschland.de/lexikon/begriff/bayer-verfahren/ , entnommen: 15.12.25
            
Technische Umsetzung KI gestützt
			''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
