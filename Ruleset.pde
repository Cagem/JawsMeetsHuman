// @author Kyra Muhl

String ruleset = "";

// loads the current ruleset from txt & formats it into a string
void loadRuleSet() {
  String[] ruleSetArray = loadStrings("ruleset.txt");

  for (int i = 0; i < ruleSetArray.length; i++) {
    String lineBreak = "\n";
    ruleset += ruleSetArray[i] + lineBreak;
  }
}
