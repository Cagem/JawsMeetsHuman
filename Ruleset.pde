// @author Kyra Muhl

String ruleset = "";

void loadRuleSet() {
  String[] ruleSetArray = loadStrings("ruleset.txt");

  for (int i = 0; i < ruleSetArray.length; i++) {
    String lineBreak = "\n";
    ruleset += ruleSetArray[i] + lineBreak;
  }
}
