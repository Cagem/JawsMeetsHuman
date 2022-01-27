// @author Kyra Muhl
// @author Jona König

String ruleset = "";

// loads the current ruleset from txt & formats it into a string
void loadRuleSet() {
  try {
    String[] ruleSetArray = loadStrings("data/ruleset.txt");

    for (int i = 0; i < ruleSetArray.length; i++) {
      String lineBreak = "\n";
      ruleset += ruleSetArray[i] + lineBreak;
    }
  } catch (Exception e) {
    println("There was an error loading ruleset.txt: " + e.getMessage());
    exit();
  }
}
