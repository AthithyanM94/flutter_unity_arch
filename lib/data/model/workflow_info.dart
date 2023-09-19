import 'dart:convert';
import 'base_reponse.dart';

class WorkFlowInfo extends BaseResponse {
  late List<Hotspot> hotspots;

  WorkFlowInfo({List<Hotspot>? hotspots}) : super("", "") {}

  @override
  void fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    hotspots = List<Hotspot>.from(json['hotspots']!.map((e) {
      var hs = Hotspot();
      hs.fromJson(e);
      return hs;
    }));
    //print(hotspots.length);
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['hotspots'] = hotspots;
    return data;
  }
}

class Hotspot {
  String? followUpQuestion;
  List<DiscoverQuestion>? discoveryQuestions;
  ValueProp? valueProps;

  void fromJson(Map<String, dynamic> json) {
    followUpQuestion = json['followup_question'];
    discoveryQuestions =
        List<DiscoverQuestion>.from(json['discovery_questions']!.map((e) {
      var temp = DiscoverQuestion();
      temp.fromJson(e);
      return temp;
    }));

    valueProps = ValueProp();
    valueProps!.fromJson(json["value_prop"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['followup_question'] = followUpQuestion;
    data['discovery_questions'] = discoveryQuestions;
    data['value_prop'] = valueProps;
    return data;
  }
}

class DiscoverQuestion {
  String? type;
  String? question;
  int? upperRange;
  int? lowerRange;

  void fromJson(Map<String, dynamic> json) {
    type = json['type'];
    question = json['questions'];
    lowerRange = json['lower_range'];
    upperRange = json['upper_range'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['questions'] = question;
    data['lower_range'] = lowerRange;
    data['upper_range'] = upperRange;
    return data;
  }
}

class ValueProp {
  String? currentBrand;
  String? proposedBrand;
  String? values;
  String? gains;

  void fromJson(Map<String, dynamic> json) {
    currentBrand = json['current_brand'];
    proposedBrand = json['proposed_brand'];
    values = json['values'];
    gains = json['gains'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_brand'] = currentBrand;
    data['proposed_brand'] = proposedBrand;
    data['values'] = values;
    data['gains'] = gains;
    return data;
  }
}
