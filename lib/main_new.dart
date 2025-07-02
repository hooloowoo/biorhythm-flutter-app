import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'l10n/app_localizations.dart';

void main() {
  runApp(const BiorhythmApp());
}

class BiorhythmApp extends StatefulWidget {
  const BiorhythmApp({super.key});

  @override
  State<BiorhythmApp> createState() => _BiorhythmAppState();
}

class _BiorhythmAppState extends State<BiorhythmApp> {
  Locale _locale = const Locale('en');

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('hu')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biorhythm',
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('hu')],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BiorhythmHomePage(onLanguageToggle: _toggleLanguage),
    );
  }
}

class BiorhythmHomePage extends StatefulWidget {
  const BiorhythmHomePage({super.key, required this.onLanguageToggle});

  final VoidCallback onLanguageToggle;

  @override
  State<BiorhythmHomePage> createState() => _BiorhythmHomePageState();
}

class _BiorhythmHomePageState extends State<BiorhythmHomePage> {
  DateTime? _birthDate;
  DateTime _selectedDate = DateTime.now();

  // Biorhythm cycles (in days)
  static const int physicalCycle = 23;
  static const int emotionalCycle = 28;
  static const int intellectualCycle = 33;

  double _calculateBiorhythm(int cycle, int daysSinceBirth) {
    return math.sin(2 * math.pi * daysSinceBirth / cycle);
  }

  List<FlSpot> _generateBiorhythmData(int cycle, Color color) {
    if (_birthDate == null) return [];

    List<FlSpot> spots = [];
    DateTime startDate = _selectedDate.subtract(const Duration(days: 15));

    for (int i = 0; i < 31; i++) {
      DateTime currentDate = startDate.add(Duration(days: i));
      int daysSinceBirth = currentDate.difference(_birthDate!).inDays;
      double value = _calculateBiorhythm(cycle, daysSinceBirth);
      spots.add(FlSpot(i.toDouble(), value));
    }

    return spots;
  }

  String _getBiorhythmDescription(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_birthDate == null) {
      return l10n.analysisDescription;
    }

    int daysSinceBirth = _selectedDate.difference(_birthDate!).inDays;
    double physical = _calculateBiorhythm(physicalCycle, daysSinceBirth);
    double emotional = _calculateBiorhythm(emotionalCycle, daysSinceBirth);
    double intellectual = _calculateBiorhythm(
      intellectualCycle,
      daysSinceBirth,
    );

    // Get simple descriptions
    String physicalDesc = physical > 0.5
        ? l10n.high
        : physical > -0.5
        ? l10n.medium
        : l10n.low;
    String emotionalDesc = emotional > 0.5
        ? l10n.high
        : emotional > -0.5
        ? l10n.medium
        : l10n.low;
    String intellectualDesc = intellectual > 0.5
        ? l10n.high
        : intellectual > -0.5
        ? l10n.medium
        : l10n.low;

    // Get detailed descriptions based on biorhythm values
    String physicalDetailDesc = physical > 0.5
        ? l10n.descrPhysicalMax
        : physical > -0.5
        ? l10n.descrPhysicalMid
        : l10n.descrPhysicalMin;

    String emotionalDetailDesc = emotional > 0.5
        ? l10n.descrEmotionalMax
        : emotional > -0.5
        ? l10n.descrEmotionalMid
        : l10n.descrEmotionalMin;

    String intellectualDetailDesc = intellectual > 0.5
        ? l10n.descrIntellectualMax
        : intellectual > -0.5
        ? l10n.descrIntellectualMid
        : l10n.descrIntellectualMin;

    return """${l10n.biorhythmAnalysisFor(DateFormat('MMM dd, yyyy').format(_selectedDate))}

🏃 ${l10n.physical}: $physicalDesc (${(physical * 100).toStringAsFixed(2)}%)
❤️ ${l10n.emotional}: $emotionalDesc (${(emotional * 100).toStringAsFixed(2)}%)
🧠 ${l10n.intellectual}: $intellectualDesc (${(intellectual * 100).toStringAsFixed(2)}%)

📋 ${l10n.detailedAnalysis}:

🏃 ${l10n.physicalCycle}:
$physicalDetailDesc

❤️ ${l10n.emotionalCycle}:
$emotionalDetailDesc

🧠 ${l10n.intellectualCycle}:
$intellectualDetailDesc

${l10n.chartDescription}""";
  }

  Future<void> _selectBirthDate() async {
    final l10n = AppLocalizations.of(context)!;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _birthDate ?? DateTime.now().subtract(const Duration(days: 365 * 25)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: l10n.selectBirthDateHelp,
    );

    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  Future<void> _selectDate() async {
    final l10n = AppLocalizations.of(context)!;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: l10n.selectAnalysisDateHelp,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n.appTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: widget.onLanguageToggle,
            tooltip: 'Toggle Language / Nyelv váltás',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Birth date selector
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      l10n.birthDate,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _birthDate != null
                          ? DateFormat('MMMM dd, yyyy').format(_birthDate!)
                          : l10n.notSelected,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _selectBirthDate,
                      child: Text(l10n.selectBirthDate),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Analysis date selector
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      l10n.analysisDate,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat('MMMM dd, yyyy').format(_selectedDate),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _selectDate,
                      child: Text(l10n.selectDate),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Biorhythm chart
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      l10n.biorhythmChart,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 300,
                      child: _birthDate != null
                          ? LineChart(
                              LineChartData(
                                gridData: const FlGridData(show: true),
                                lineTouchData: LineTouchData(
                                  touchTooltipData: LineTouchTooltipData(
                                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                                      return touchedSpots.map((
                                        LineBarSpot touchedSpot,
                                      ) {
                                        final percentage = (touchedSpot.y * 100)
                                            .toStringAsFixed(2);
                                        String label = '';
                                        Color color = Colors.black;

                                        // Determine which line was touched based on bar index
                                        switch (touchedSpot.barIndex) {
                                          case 0:
                                            label = l10n.physical;
                                            color = Colors.red;
                                            break;
                                          case 1:
                                            label = l10n.emotional;
                                            color = Colors.blue;
                                            break;
                                          case 2:
                                            label = l10n.intellectual;
                                            color = Colors.green;
                                            break;
                                          default:
                                            return null; // Don't show tooltip for marker line
                                        }

                                        return LineTooltipItem(
                                          '$label: $percentage%',
                                          TextStyle(
                                            color: color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 50,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          '${(value * 100).toStringAsFixed(2)}%',
                                          style: const TextStyle(fontSize: 10),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      getTitlesWidget: (value, meta) {
                                        if (value.toInt() % 5 == 0) {
                                          DateTime date = _selectedDate
                                              .subtract(
                                                const Duration(days: 15),
                                              )
                                              .add(
                                                Duration(days: value.toInt()),
                                              );
                                          return Text(
                                            DateFormat('M/d').format(date),
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          );
                                        }
                                        return const Text('');
                                      },
                                    ),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                borderData: FlBorderData(show: true),
                                minX: 0,
                                maxX: 30,
                                minY: -1.2,
                                maxY: 1.2,
                                lineBarsData: [
                                  // Physical cycle (red)
                                  LineChartBarData(
                                    spots: _generateBiorhythmData(
                                      physicalCycle,
                                      Colors.red,
                                    ),
                                    isCurved: true,
                                    color: Colors.red,
                                    barWidth: 2,
                                    dotData: const FlDotData(show: false),
                                  ),
                                  // Emotional cycle (blue)
                                  LineChartBarData(
                                    spots: _generateBiorhythmData(
                                      emotionalCycle,
                                      Colors.blue,
                                    ),
                                    isCurved: true,
                                    color: Colors.blue,
                                    barWidth: 2,
                                    dotData: const FlDotData(show: false),
                                  ),
                                  // Intellectual cycle (green)
                                  LineChartBarData(
                                    spots: _generateBiorhythmData(
                                      intellectualCycle,
                                      Colors.green,
                                    ),
                                    isCurved: true,
                                    color: Colors.green,
                                    barWidth: 2,
                                    dotData: const FlDotData(show: false),
                                  ),
                                  // Today marker
                                  LineChartBarData(
                                    spots: [
                                      const FlSpot(15, -1.2),
                                      const FlSpot(15, 1.2),
                                    ],
                                    isCurved: false,
                                    color: Colors.black,
                                    barWidth: 1,
                                    dotData: const FlDotData(show: false),
                                    dashArray: [5, 5],
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                l10n.pleaseSelectBirthDate,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                    ),
                    if (_birthDate != null) ...[
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildLegendItem(l10n.physical, Colors.red),
                          _buildLegendItem(l10n.emotional, Colors.blue),
                          _buildLegendItem(l10n.intellectual, Colors.green),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Description box
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.biorhythmAnalysis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _getBiorhythmDescription(context),
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 16, height: 2, color: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
