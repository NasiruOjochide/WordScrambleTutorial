//
//  ContentView.swift
//  WordScrambleTutorial
//
//  Created by Danjuma Nasiru on 06/01/2023.
//

import SwiftUI


struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List(people, id: \.self){
            Text("static row")
            Text("\($0)")
//            Section("Section 1") {
//                    Text("Static row 1")
//                    Text("Static row 2")
//                }
//
//                Section("Section 2") {
//                    ForEach(0..<5) {
//                        Text("Dynamic row \($0)")
//                    }
//                }
//
//                Section("Section 3") {
//                    Text("Static row 3")
//                    Text("Static row 4")
//                }
        }.listStyle(.inset)
    }
    
    func loadFile(){
        guard let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") else {
            return
            // we found the file in our bundle!
        }
        if let fileContent = try? String(contentsOf: fileURL){
            //do something
        }
    }
    
    func test(){
        //Checking a string for misspelled words takes four steps in total. First, we create a word to check and an instance of UITextChecker that we can use to check that string:
        let word = "swift"
        let checker = UITextChecker()
        
        //we need to tell the checker how much of our string we want to check.
        //create an Objective-C string range using the entire length of all our characters, like this:
        let range = NSRange(location: 0, length: word.utf16.count)
        
        //we can ask our text checker to report where it found any misspellings in our word
        //That sends back another Objective-C string range, telling us where the misspelling was found.
        let misSpelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        //if the Objective-C range comes back as empty – i.e., if there was no spelling mistake because the string was spelled correctly – then we get back the special value NSNotFound.
        
        // So, we could check our spelling result to see whether there was a mistake or not like this:
        let allGood = misSpelledRange.location == NSNotFound
        
//        let input = """
//a
//b
//c
//"""
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
