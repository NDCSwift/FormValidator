//
    // Project: FormValidator1
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

enum ValidationResult {
    case success
    case failure(String)
    
    var errorMessage: String? {
        switch self {
        case .success: return nil
        case .failure(let msg): return msg
        }
    }
}

struct ContentView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthdate = Date()
    @State private var agreedToTerms = false
    
    var body: some View {
        Form {
            Section(header: Text("Personal Info")){
                TextField("Name", text: $name)
//                    .overlay(validateName().errorMessage != nil ? RoundedRectangle(cornerRadius: 12).stroke(Color.red) : nil)
                    
                if let error = validateName().errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                        .accessibilityLabel(error)
                }
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                if let error = validateEmail().errorMessage{
                    Text(error)
                        .foregroundStyle(.red)
                }
                
                SecureField("Password", text: $password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                if let error = validatePassword().errorMessage{
                    Text(error)
                        .foregroundStyle(.red)
                }
                
                DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                if let error = validateBirthdate().errorMessage{
                    Text(error)
                        .foregroundStyle(.red)
                }

            }
            Section{
                Toggle("I agree to ToS", isOn: $agreedToTerms)
            }
            Section{
                Button("Submit"){
                    print("From Submitted!")
                }
                .disabled(!isFormValid)
            }
        }
        
    }
    
    var isFormValid: Bool {
        [
            validateName(),
            validateEmail(),
            validatePassword(),
            validateBirthdate()
        ].allSatisfy {
            if case .success = $0 { return true} else{
                return false
                
            }
        } && agreedToTerms
    }
    
    func validateName() -> ValidationResult {
        name.isEmpty ? .failure("Name is required") : .success
    }
    
    func validateEmail() -> ValidationResult {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        if email.range(of: emailPattern, options: .regularExpression) == nil {
            return.failure("Enter a valid email")
        }
        return .success
    }
    
    func validatePassword() -> ValidationResult{
        if password.count < 8 {
            return .failure("Password must be atleast 8 characters")
        }
        return .success
    }
    
    func validateBirthdate() -> ValidationResult {
        if birthdate > Date() {
            return .failure("Birthday cannot be in future")
        }
        return .success
    }
    
}

#Preview {
    ContentView()
}
