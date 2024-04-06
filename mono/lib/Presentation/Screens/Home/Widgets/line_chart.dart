import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mono/Core/Constants/colors.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xFF438883).withOpacity(0.025),
    const Color(0xFF438883).withOpacity(0.05),
    const Color(0xFF438883).withOpacity(0.1),
    const Color(0xFF438883).withOpacity(0.2),
    const Color(0xFF438883).withOpacity(0.3),
    const Color(0xFF438883).withOpacity(0.4),
    const Color(0xFF438883).withOpacity(0.5),
    const Color(0xFF438883).withOpacity(0.6),
    const Color(0xFF438883).withOpacity(0.7),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
            child: LineChart(
            mainData(),
            ),
        ),
       
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 16,
      color: Colors.black
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Feb', style: style);
        break;
      case 2:
        text = const Text('Mar', style: style);
        break;
      case 4:
        text = const Text('Apr', style: style);
        break;
      case 6:
        text = const Text('May', style: style);
        break;
      case 8:
        text = const Text('Jun', style: style);
        break;
      case 10:
        text = const Text('Jul', style: style);
        break;
     
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      
      gridData: FlGridData(
  
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.transparent,

          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
          );
        },
      ),
      titlesData: FlTitlesData(
        
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.transparent),
      ),

      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(-1, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 2),

            
          ],
          isCurved: true,
          gradient: const LinearGradient(colors: [
            Colors.white,
            AppColors.primaryColor,
            AppColors.primaryColor,
            AppColors.primaryColor,
            AppColors.primaryColor,
            AppColors.primaryColor,
            AppColors.primaryColor,
            AppColors.primaryColor,
            AppColors.primaryColor,
            Colors.white,
          ]),
          color: AppColors.primaryColor,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: gradientColors.map((color) => color).toList(),
            ),
          ),
        ),
      ],
    );
  }


}

class TestColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
