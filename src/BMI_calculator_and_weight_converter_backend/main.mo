import Result "mo:base/Result";
import Float "mo:base/Float"

actor {

  type Person = {
    var weight: Float;
    var height: Float;
  };

  var person : Person = {
    var weight = 0;
    var height = 0;
  };
  public func getParamsinKG(weight:Float, height:Float) : async Result.Result<Text, Text> {
    person.weight := weight;
    person.height := height;
    
    return #ok "weight and height set";
  };  
  
  public func weightConvertertoLBS(): async Result.Result<Float, Text>{
    let old_weight = person.weight;
    person.weight := person.weight * 2.2042;

    if (old_weight == person.weight){
      return #err "no weight";
      
    } else {
      return #ok (person.weight);      
    };
  };
  public query func calculateBMI() : async Text {
    
    let heightSquared = person.height * person.height;
    var bmi = person.weight / heightSquared;
    return Float.toText(bmi) # " kg/m^2";
  };
};