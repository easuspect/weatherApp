import UIKit

var greeting = "Hello, playground"

var name = "Efe"
print(name)

var surname = "Bakin"

print(name + surname)

class BakinFamily{
    
    var fatherName: String
    var motherName: String
    var sonName: String
    
    init(fatherName:String, motherName: String, sonName: String){
        self.fatherName = fatherName
        self.motherName = motherName
        self.sonName = sonName
    }
    
}

BakinFamily.init(fatherName: "Haydar", motherName: "Filiz", sonName: "Efe")
